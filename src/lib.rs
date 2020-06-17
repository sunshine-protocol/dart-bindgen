#![deny(
    unsafe_code,
    missing_docs,
    missing_debug_implementations,
    missing_copy_implementations,
    elided_lifetimes_in_paths,
    rust_2018_idioms,
    clippy::fallible_impl_from,
    clippy::missing_const_for_fn,
    intra_doc_link_resolution_failure
)]
#![doc(html_logo_url = "https://avatars0.githubusercontent.com/u/55122894")]
//! ## Dart Bindgen
//! Generate Dart FFI bindings to C Header file.
//!
//! ### Supported C Language Features
//! - Functions
//! - Function Pointer (aka `callback`)
//! - Simple structs (NOTE: Nested structs is not supported yet, open a PR?)
//!
//! ## Example
//! in your `build.rs`:
//! ```rust,ignore
//!  let config = DynamicLibraryConfig {
//!       ios: DynamicLibraryCreationMode::Executable.into(),
//!       android: DynamicLibraryCreationMode::open("libsimple.so").into(),
//!       ..Default::default()
//!   };
//!   // load the c header file, with config and lib name
//!   let codegen = Codegen::builder()
//!       .with_src_header("simple-ffi/include/simple.h")
//!       .with_lib_name("libsimple")
//!       .with_config(config)
//!       .build()?;
//!   // generate the dart code and get the bindings back
//!   let bindings = codegen.generate()?;
//!   // write the bindings to your dart package
//!   // and start using it to write your own high level abstraction.
//!   bindings.write_to_file("simple/lib/ffi.dart")?;
//! ```
use clang::{Clang, Entity, EntityKind, Index, Type, TypeKind};
use log::debug;
use std::{
    collections::HashMap,
    fmt, fs,
    io::{self, Write},
    path::PathBuf,
};
/// Bindgens config for loading `DynamicLibrary` on each Platform.
pub mod config;
use config::DynamicLibraryConfig;

mod dart_source_writer;
use dart_source_writer::{DartSourceWriter, ImportedUri};

mod errors;
use errors::CodegenError;

mod structure;
use structure::{Field, Struct};

mod func;
use func::{Func, Param};

/// Abstract over Func, Struct and Global.
trait Element {
    /// Get the name of this element
    fn name(&self) -> &str;

    /// Optional documentation of this element
    fn documentation(&self) -> Option<&str>;

    /// Used to Write the Current Element to the Final Source File
    fn generate_source(&self, w: &mut DartSourceWriter) -> io::Result<()>;
}
/// Dart Code Generator
pub struct Codegen {
    src_header: PathBuf,
    lib_name: String,
    config: DynamicLibraryConfig,
    elements: HashMap<String, Box<dyn Element>>,
}

impl Codegen {
    /// Create new [`Codegen`] using it's Builder
    pub fn builder() -> CodegenBuilder { CodegenBuilder::default() }

    /// Generate the [`Bindings`]
    pub fn generate(mut self) -> Result<Bindings, CodegenError> {
        debug!("Starting Codegen!");
        debug!("Building dsw");
        let mut dsw = Self::build_dsw();
        debug!("dsw is ready");
        self.generate_open_dl(&mut dsw)?;
        let clang = Clang::new()?;
        let index = Index::new(&clang, true, false);
        debug!("start parsing the C header file at {:?}.", self.src_header);
        let parser = index.parser(self.src_header);
        let tu = parser.parse()?;
        debug!("Done Parsed the header file");
        let entity = tu.get_entity();
        let entities = entity
            .get_children()
            .into_iter()
            .filter(|e| !e.is_in_system_header());
        for e in entities {
            let kind = e.get_kind();
            if kind == EntityKind::FunctionDecl {
                debug!("Got Function: {:?}", e);
                // handle functions
                let func = Self::parse_function(e)?;
                self.elements.insert(func.name().to_owned(), Box::new(func));
            }

            if kind == EntityKind::StructDecl {
                debug!("Got Struct: {:?}", e);
                let s = Self::parse_struct(e)?;
                self.elements.insert(s.name().to_owned(), Box::new(s));
            }
        }
        debug!("Generating Dart Source...");
        for el in self.elements.values() {
            el.generate_source(&mut dsw)?;
        }
        debug!("Done.");
        Ok(Bindings::new(dsw))
    }

    fn generate_open_dl(
        &self,
        dsw: &mut DartSourceWriter,
    ) -> Result<(), CodegenError> {
        dsw.set_lib_name(&self.lib_name);
        debug!("Generating Code for opening DynamicLibrary");
        writeln!(dsw, "final DynamicLibrary _dl = _open();")?;
        writeln!(dsw, "DynamicLibrary _open() {{")?;
        if let Some(ref config) = self.config.windows {
            debug!("Generating _open Code for Windows");
            writeln!(dsw, "  if (Platform.isWindows) return {};", config)?;
        }
        if let Some(ref config) = self.config.linux {
            debug!("Generating _open Code for Linux");
            writeln!(dsw, "  if (Platform.isLinux) return {};", config)?;
        }
        if let Some(ref config) = self.config.android {
            debug!("Generating _open Code for Android");
            writeln!(dsw, "  if (Platform.isAndroid) return {};", config)?;
        }
        if let Some(ref config) = self.config.ios {
            debug!("Generating _open Code for iOS");
            writeln!(dsw, "  if (Platform.isIOS) return {};", config)?;
        }
        if let Some(ref config) = self.config.macos {
            debug!("Generating _open Code for macOS");
            writeln!(dsw, "  if (Platform.isMacOS) return {};", config)?;
        }
        if let Some(ref config) = self.config.fuchsia {
            debug!("Generating _open Code for Fuchsia");
            writeln!(dsw, "  if (Platform.isFuchsia) return {};", config)?;
        }
        writeln!(
            dsw,
            "  throw UnsupportedError('This platform is not supported.');"
        )?;
        writeln!(dsw, "}}")?;
        debug!("Generating Code for opening DynamicLibrary done.");
        Ok(())
    }

    fn parse_function(
        entity: Entity<'_>,
    ) -> Result<impl Element, CodegenError> {
        let name = entity
            .get_name()
            .ok_or_else(|| CodegenError::UnnamedFunction)?;
        debug!("Function: {}", name);
        let params = match entity.get_arguments() {
            Some(entities) => Self::parse_fn_params(entities)?,
            None => Vec::new(),
        };
        debug!("Function Params: {:?}", params);
        let docs = entity.get_parsed_comment().map(|c| c.as_html());
        debug!("Function Docs: {:?}", docs);
        let return_ty = entity
            .get_result_type()
            .ok_or_else(|| CodegenError::UnknownFunctionReturnType)?
            .get_canonical_type()
            .get_display_name();
        debug!("Function Return Type: {}", return_ty);
        Ok(Func::new(name, docs, params, return_ty))
    }

    fn parse_fn_params(
        entities: Vec<Entity<'_>>,
    ) -> Result<Vec<Param>, CodegenError> {
        let mut params = Vec::with_capacity(entities.capacity());
        for e in entities {
            debug!("Param: {:?}", e);
            let name = e.get_name();
            debug!("Param Name: {:?}", name);
            let ty = e
                .get_type()
                .ok_or_else(|| CodegenError::UnknownParamType)?
                .get_canonical_type();
            debug!("Param Type: {:?}", ty);
            let ty = Self::parse_ty(ty)?;
            debug!("Param Type Display Name: {}", ty);
            params.push(Param::new(name, ty));
        }
        Ok(params)
    }

    fn parse_fn_proto(ty: Type<'_>) -> Result<String, CodegenError> {
        let mut dsw = DartSourceWriter::new();
        debug!("Function Proto: {:?}", ty);
        let return_ty = ty
            .get_canonical_type()
            .get_result_type()
            .ok_or_else(|| CodegenError::UnknownFunctionReturnType)?
            .get_canonical_type()
            .get_display_name();
        let params = match ty.get_argument_types() {
            Some(arg_ty) => arg_ty
                .iter()
                .map(|ty| ty.get_display_name())
                .map(|ty| dsw.get_ctype(&ty))
                .collect(),
            None => Vec::new(),
        };
        write!(
            dsw,
            "Pointer<NativeFunction<{} Function({})>>",
            dsw.get_dart_type(&return_ty),
            params.join(", ")
        )?;
        Ok(dsw.to_string())
    }

    fn parse_struct(entity: Entity<'_>) -> Result<impl Element, CodegenError> {
        let name = entity
            .get_name()
            .ok_or_else(|| CodegenError::UnnamedStruct)?;
        debug!("Struct: {}", name);
        let children = entity.get_children();
        let mut fields = Vec::with_capacity(children.capacity());

        for child in children {
            let name = child
                .get_name()
                .ok_or_else(|| CodegenError::UnnamedStructField)?;
            let ty = child
                .get_type()
                .ok_or_else(|| CodegenError::UnknownParamType)?
                .get_canonical_type();
            let ty = Self::parse_ty(ty)?;
            fields.push(Field::new(name, ty));
        }
        let docs = entity.get_parsed_comment().map(|c| c.as_html());
        Ok(Struct::new(name, docs, fields))
    }

    fn parse_ty(ty: Type<'_>) -> Result<String, CodegenError> {
        if ty.get_kind() == TypeKind::Pointer {
            let pointee_type = ty
                .get_pointee_type()
                .ok_or_else(|| CodegenError::UnknownPointeeType)?;
            let kind = pointee_type.get_kind();
            if kind == TypeKind::FunctionPrototype
                || kind == TypeKind::FunctionNoPrototype
            {
                Self::parse_fn_proto(pointee_type)
            } else {
                Ok(ty.get_display_name())
            }
        } else {
            Ok(ty.get_display_name())
        }
    }

    fn build_dsw() -> DartSourceWriter {
        let mut dsw = DartSourceWriter::new();
        // disable some lints
        writeln!(dsw, "// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names").unwrap();
        dsw.import(ImportedUri::new(String::from("dart:ffi")));
        dsw.import(ImportedUri::new(String::from("dart:io")));
        let mut ffi = ImportedUri::new(String::from("package:ffi/ffi.dart"));
        ffi.with_prefix(String::from("ffi"));
        dsw.import(ffi);
        dsw
    }
}

impl fmt::Debug for Codegen {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("Codegen")
            .field("src_header", &self.src_header)
            .field("lib_name", &self.lib_name)
            .field("config", &self.config)
            .finish()
    }
}
/// The [`Codegen`] Builder
///
/// start by calling [`Codegen::builder()`]
#[derive(Clone, Debug, Default)]
pub struct CodegenBuilder {
    src_header: PathBuf,
    lib_name: String,
    config: Option<DynamicLibraryConfig>,
}

impl CodegenBuilder {
    /// The Input `C` header file
    pub fn with_src_header(mut self, path: impl Into<PathBuf>) -> Self {
        self.src_header = path.into();
        self
    }

    /// The output lib name, for example `libfoo`
    ///
    /// used for docs
    pub fn with_lib_name(mut self, name: impl Into<String>) -> Self {
        self.lib_name = name.into();
        self
    }

    /// Defines, how the dynamic library should be loaded on each of dart's
    /// known platforms.
    #[allow(clippy::missing_const_for_fn)]
    pub fn with_config(mut self, config: DynamicLibraryConfig) -> Self {
        self.config = Some(config);
        self
    }

    /// Consumes the builder and validate everyting, then create the [`Codegen`]
    pub fn build(self) -> Result<Codegen, CodegenError> {
        if self.lib_name.is_empty() {
            return Err(CodegenError::Builder(
                "Please Provide the C lib name.",
            ));
        }

        let config = self.config.ok_or_else(|| {
            CodegenError::Builder("Missing `DynamicLibraryConfig` did you forget to call `with_config` builder method?.")
        })?;

        Ok(Codegen {
            src_header: self.src_header,
            lib_name: self.lib_name,
            config,
            elements: HashMap::new(),
        })
    }
}

/// A bindings using `dart:ffi` that could be written.
#[derive(Debug)]
pub struct Bindings {
    dsw: DartSourceWriter,
}

impl Bindings {
    pub(crate) const fn new(dsw: DartSourceWriter) -> Self { Self { dsw } }

    /// Write dart ffi bindings to a file
    pub fn write_to_file(
        &self,
        path: impl Into<PathBuf>,
    ) -> Result<(), CodegenError> {
        let mut out = fs::OpenOptions::new()
            .read(false)
            .write(true)
            .truncate(true)
            .create(true)
            .open(path.into())?;
        debug!("Writing Dart Source File...");
        write!(out, "{}", self.dsw)?;
        Ok(())
    }

    /// Write dart ffi bindings to anything that can we write into :D
    ///
    /// see also:
    ///  * [`Bindings::write_to_file`]
    pub fn write(&self, mut w: impl Write) -> Result<(), CodegenError> {
        debug!("Writing Dart Source File...");
        write!(w, "{}", self.dsw)?;
        Ok(())
    }
}

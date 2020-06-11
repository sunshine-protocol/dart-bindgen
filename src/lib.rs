#![deny(
    unsafe_code,
    missing_debug_implementations,
    missing_copy_implementations,
    elided_lifetimes_in_paths,
    rust_2018_idioms,
    clippy::fallible_impl_from,
    clippy::missing_const_for_fn,
    intra_doc_link_resolution_failure
)]

use clang::{Clang, Entity, EntityKind, Index};
use std::{
    fmt, fs,
    io::{self, Write},
    path::PathBuf,
};

pub mod config;
use config::DynamicLibraryConfig;

mod dart_source_writer;
use dart_source_writer::{DartSourceWriter, ImportedUri};

mod errors;
use errors::CodegenError;

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

pub struct Codegen {
    output_file: PathBuf,
    input_header: PathBuf,
    lib_name: String,
    config: DynamicLibraryConfig,
    elements: Vec<Box<dyn Element>>,
}

impl Codegen {
    pub fn builder() -> CodegenBuilder { CodegenBuilder::default() }

    pub fn generate(mut self) -> Result<(), CodegenError> {
        let mut dsw = Self::get_dsw();
        self.generate_open_dl(&mut dsw)?;
        let clang = Clang::new()?;
        let index = Index::new(&clang, true, false);
        let parser = index.parser(self.input_header);
        let tu = parser.parse()?;
        let entity = tu.get_entity();
        let entities = entity
            .get_children()
            .into_iter()
            .filter(|e| !e.is_in_system_header());
        for e in entities {
            if e.get_kind() == EntityKind::FunctionDecl {
                // handle functions
                let func = Self::parse_function(e)?;
                self.elements.push(Box::new(func));
            }
        }

        for el in self.elements {
            el.generate_source(&mut dsw)?;
        }

        let mut out = fs::OpenOptions::new()
            .read(false)
            .write(true)
            .truncate(true)
            .create(true)
            .open(self.output_file)?;

        write!(out, "{}", dsw)?;

        Ok(())
    }

    fn generate_open_dl(
        &self,
        dsw: &mut DartSourceWriter,
    ) -> Result<(), CodegenError> {
        writeln!(dsw, "final DynamicLibrary _dl = _open();")?;
        writeln!(dsw, "DynamicLibrary _open() {{")?;
        if let Some(ref config) = self.config.windows {
            writeln!(dsw, "  if (Platform.isWindows) return {};", config)?;
        }
        if let Some(ref config) = self.config.linux {
            writeln!(dsw, "  if (Platform.isLinux) return {};", config)?;
        }
        if let Some(ref config) = self.config.android {
            writeln!(dsw, "  if (Platform.isAndroid) return {};", config)?;
        }
        if let Some(ref config) = self.config.ios {
            writeln!(dsw, "  if (Platform.isIOS) return {};", config)?;
        }
        if let Some(ref config) = self.config.macos {
            writeln!(dsw, "  if (Platform.isMacOS) return {};", config)?;
        }
        if let Some(ref config) = self.config.fuchsia {
            writeln!(dsw, "  if (Platform.isFuchsia) return {};", config)?;
        }
        writeln!(
            dsw,
            "  throw UnsupportedError('This platform is not supported.');"
        )?;
        writeln!(dsw, "}}")?;
        Ok(())
    }

    fn parse_function(entity: Entity<'_>) -> Result<Func, CodegenError> {
        let name = entity
            .get_name()
            .ok_or_else(|| CodegenError::UnnamedFunction)?;
        let params = match entity.get_arguments() {
            Some(entities) => Self::parse_fn_params(entities)?,
            None => Vec::new(),
        };
        let docs = entity.get_parsed_comment().map(|c| c.as_html());
        let return_ty = entity
            .get_result_type()
            .ok_or_else(|| CodegenError::UnknownFunctionReturnType)?
            .get_canonical_type()
            .get_display_name();
        Ok(Func::new(name, docs, params, return_ty))
    }

    fn parse_fn_params(
        entities: Vec<Entity<'_>>,
    ) -> Result<Vec<Param>, CodegenError> {
        let mut params = Vec::with_capacity(entities.capacity());
        for e in entities {
            let name = e.get_name();
            let ty = e
                .get_type()
                .ok_or_else(|| CodegenError::UnknownParamType)?
                .get_canonical_type()
                .get_display_name();
            params.push(Param::new(name, ty));
        }
        Ok(params)
    }

    fn get_dsw() -> DartSourceWriter {
        let mut dsw = DartSourceWriter::new();
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
            .field("output_file", &self.output_file)
            .field("input_file", &self.input_header)
            .field("lib_name", &self.lib_name)
            .finish()
    }
}

#[derive(Clone, Debug, Default)]
pub struct CodegenBuilder {
    output_file: PathBuf,
    input_header: PathBuf,
    lib_name: String,
    config: Option<DynamicLibraryConfig>,
}

impl CodegenBuilder {
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
            output_file: self.output_file,
            input_header: self.input_header,
            lib_name: self.lib_name,
            config,
            elements: Vec::new(),
        })
    }

    pub fn with_input_header_path(mut self, path: impl Into<PathBuf>) -> Self {
        self.input_header = path.into();
        self
    }

    pub fn with_output_dart_file(mut self, path: impl Into<PathBuf>) -> Self {
        self.output_file = path.into();
        self
    }

    pub fn with_lib_name(mut self, name: impl Into<String>) -> Self {
        self.lib_name = name.into();
        self
    }

    #[allow(clippy::missing_const_for_fn)]
    pub fn with_config(mut self, config: DynamicLibraryConfig) -> Self {
        self.config = Some(config);
        self
    }
}

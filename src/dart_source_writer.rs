use lazy_static::lazy_static;
use std::{
    collections::{HashMap, HashSet},
    io::{self, ErrorKind, Write},
    str,
};
/// Describes an imported Dart package.
#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub(crate) struct ImportedUri {
    uri: String,
    prefix: Option<String>,
    show: Option<String>,
    hide: Option<String>,
}

impl ImportedUri {
    pub(crate) const fn new(uri: String) -> Self {
        Self {
            uri,
            prefix: None,
            show: None,
            hide: None,
        }
    }

    pub(crate) fn with_prefix(&mut self, prefix: String) -> &Self {
        self.prefix = Some(prefix);
        self
    }

    pub(crate) fn with_show(&mut self, show: String) -> &Self {
        self.show = Some(show);
        self
    }

    pub(crate) fn with_hide(&mut self, hide: String) -> &Self {
        self.hide = Some(hide);
        self
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct DartType {
    ffi: &'static str,
    dart: &'static str,
}

impl DartType {
    pub(crate) const fn new(ffi: &'static str, dart: &'static str) -> Self {
        Self { ffi, dart }
    }

    pub(crate) const fn ffi(&self) -> &str { self.ffi }

    pub(crate) const fn dart(&self) -> &str { self.dart }
}

lazy_static! {
    pub(crate) static ref FFI_TYPES_MAP: HashMap<&'static str, DartType> = {
        let mut map = HashMap::new();
        map.insert("int64_t", DartType::new("ffi.Int64", "int"));
        map.insert("void", DartType::new("ffi.Void", "void"));
        map
    };
}

#[derive(Clone, Debug)]
pub(crate) struct DartSourceWriter {
    imports: HashSet<ImportedUri>,
    sb: String,
}

impl DartSourceWriter {
    pub(crate) fn new() -> Self {
        Self {
            imports: HashSet::new(),
            sb: String::new(),
        }
    }

    pub(crate) fn import(&mut self, imported_uri: ImportedUri) {
        self.imports.insert(imported_uri);
    }

    /// Returns Dart C type for the description type.
    ///
    /// Examples:
    /// * `Int32` -> `Int32`
    /// * `*CFString` -> `Pointer<CFString>`
    /// * `*void` -> `Pointer`
    /// * `void` -> `Void`
    pub(crate) fn get_ctype(&self, name: &str) -> String {
        let ty = FFI_TYPES_MAP.get(name.to_lowercase().as_str());
        if let Some(cty) = ty {
            cty.ffi().to_owned()
        } else if name.starts_with('*') {
            // skip the `*`
            format!("ffi.Pointer<{}>", &name[1..])
        } else {
            name.to_owned()
        }
    }

    /// Converts description type to Dart type.
    ///
    /// Examples:
    /// * `Int32` -> `int`
    /// * `Int64` -> `int`
    /// * `*CFString` -> `Pointer<CFString>`
    pub(crate) fn get_dart_type(&self, name: &str) -> String {
        let ty = FFI_TYPES_MAP.get(name.to_lowercase().as_str());
        if let Some(cty) = ty {
            cty.dart().to_owned()
        } else if name.starts_with('*') {
            // skip the `*`
            format!("ffi.Pointer<{}>", &name[1..])
        } else {
            name.to_owned()
        }
    }

    /// Returns Dart C type for the description type.
    ///
    /// Examples:
    /// * `Int32` -> `Int32`
    /// * `*CFString` -> `Pointer<CFString>`
    /// * `*void` -> `Pointer`
    /// * `void` -> `Void`
    pub(crate) fn get_property_annotation_type(
        &self,
        name: &str,
    ) -> Option<String> {
        if name.starts_with('*') {
            Some("ffi.Pointer".to_owned())
        } else if let Some(ty) = FFI_TYPES_MAP.get(name.to_lowercase().as_str())
        {
            Some(ty.ffi().to_owned())
        } else {
            None
        }
    }
}

impl Write for DartSourceWriter {
    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
        let s = str::from_utf8(buf).map_err(|e| {
            io::Error::new(ErrorKind::InvalidData, e.to_string())
        })?;
        self.sb.push_str(s);
        Ok(buf.len())
    }

    fn flush(&mut self) -> io::Result<()> { Ok(()) }
}

impl ToString for DartSourceWriter {
    fn to_string(&self) -> String {
        let mut sb = String::new();
        for import in &self.imports {
            sb = sb + &format!("import '{}'", import.uri);
            if let Some(ref prefix) = import.prefix {
                sb = sb + &format!(" as {}", prefix);
            }
            // TODO(@shekohex): support `show` and `hide`
            sb.push_str(";\n");
        }
        sb.push('\n');
        // content
        sb = sb + &self.sb;
        sb
    }
}

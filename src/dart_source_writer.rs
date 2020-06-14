use lazy_static::lazy_static;
use std::{
    collections::{HashMap, HashSet},
    fmt::{self, Display},
    io::{self, ErrorKind, Write},
    str,
};

/// Describes an imported Dart package.
#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub(crate) struct ImportedUri {
    uri: String,
    prefix: Option<String>,
}

impl ImportedUri {
    pub(crate) const fn new(uri: String) -> Self { Self { uri, prefix: None } }

    pub(crate) fn with_prefix(&mut self, prefix: String) -> &Self {
        self.prefix = Some(prefix);
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
        map.insert("void *", DartType::new("Pointer", "Pointer"));
        map.insert("void", DartType::new("Void", "void"));

        map.insert(
            "char *",
            DartType::new("Pointer<ffi.Utf8>", "Pointer<ffi.Utf8>"),
        );
        map.insert("char", DartType::new("Uint8", "int"));
        map.insert("unsigned char", DartType::new("Uint8", "int"));
        map.insert("signed char", DartType::new("Int8", "int"));

        map.insert("short", DartType::new("Int16", "int"));
        map.insert("signed short", DartType::new("Int16", "int"));
        map.insert("signed short int", DartType::new("Int16", "int"));
        map.insert("unsigned short", DartType::new("Uint16", "int"));
        map.insert("unsigned short int", DartType::new("Uint16", "int"));

        map.insert("int", DartType::new("Int32", "int"));
        map.insert("signed", DartType::new("Int32", "int"));
        map.insert("signed int", DartType::new("Int32", "int"));
        map.insert("unsigned", DartType::new("Uint32", "int"));
        map.insert("unsigned int", DartType::new("Uint32", "int"));

        map.insert("long", DartType::new("Int64", "int"));
        map.insert("long int", DartType::new("Int64", "int"));
        map.insert("signed long", DartType::new("Int64", "int"));
        map.insert("signed long int", DartType::new("Int64", "int"));
        map.insert("unsigned long", DartType::new("Uint64", "int"));
        map.insert("unsigned long int", DartType::new("Uint64", "int"));

        map.insert("long long", DartType::new("Int64", "int"));
        map.insert("long long int", DartType::new("Int64", "int"));
        map.insert("signed long long", DartType::new("Int64", "int"));
        map.insert("signed long long int", DartType::new("Int64", "int"));
        map.insert("unsigned long long", DartType::new("Uint64", "int"));
        map.insert("unsigned long long int", DartType::new("Uint64", "int"));

        map.insert("float", DartType::new("Float", "double"));
        map.insert("double", DartType::new("Double", "double"));
        map.insert("long double", DartType::new("Double", "double"));
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
        let mut n = name
            .trim()
            .replace("const ", "")
            .replace("volatile ", "")
            .replace("struct ", "");
        let ty = FFI_TYPES_MAP.get(n.to_lowercase().as_str());
        if let Some(cty) = ty {
            cty.ffi().to_owned()
        } else {
            if n.ends_with('*') {
                n.pop();
                return format!("Pointer<{}>", self.get_ctype(&n));
            }

            if n.ends_with("**") {
                n.pop();
                return format!("Pointer<Pointer<{}>>", self.get_ctype(&n));
            }
            n
        }
    }

    /// Converts description type to Dart type.
    ///
    /// Examples:
    /// * `Int32` -> `int`
    /// * `Int64` -> `int`
    /// * `*CFString` -> `Pointer<CFString>`
    pub(crate) fn get_dart_type(&self, name: &str) -> String {
        let mut n = name
            .trim()
            .replace("struct ", "")
            .replace("volatile ", "")
            .replace("const ", "");
        let ty = FFI_TYPES_MAP.get(n.to_lowercase().as_str());
        if let Some(cty) = ty {
            cty.dart().to_owned()
        } else {
            if n.ends_with('*') {
                n.pop();
                return format!("Pointer<{}>", self.get_ctype(&n));
            }

            if n.ends_with("**") {
                n.pop();
                n.pop();
                return format!("Pointer<Pointer<{}>>", self.get_ctype(&n));
            }
            n
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
        let n = name
            .trim()
            .replace("struct ", "")
            .replace("volatile ", "")
            .replace("const ", "");
        if n.ends_with('*') {
            None
        } else if let Some(ty) = FFI_TYPES_MAP.get(n.to_lowercase().as_str()) {
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

impl Display for DartSourceWriter {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        for import in &self.imports {
            write!(f, "import '{}'", import.uri)?;
            if let Some(ref prefix) = import.prefix {
                write!(f, " as {}", prefix)?;
            }
            // TODO(@shekohex): support `show` and `hide`
            writeln!(f, ";")?;
        }
        writeln!(f)?;
        // content
        write!(f, "{}", self.sb)?;
        Ok(())
    }
}

use crate::dart_source_writer::{DartSourceWriter, ImportedUri};
use std::io::{self, Write};

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct Struct {
    documentation: Option<String>,
    name: String,
    fields: Vec<Field>,
}

impl Struct {
    pub(crate) fn new(
        name: String,
        documentation: Option<String>,
        fields: Vec<Field>,
    ) -> Self {
        Self {
            documentation,
            name,
            fields,
        }
    }
}

impl crate::Element for Struct {
    #[inline(always)]
    fn name(&self) -> &str { &self.name }

    #[inline(always)]
    fn documentation(&self) -> Option<&str> { self.documentation.as_deref() }

    fn generate_source(&self, w: &mut DartSourceWriter) -> io::Result<()> {
        let mut ffi = ImportedUri::new(String::from("package:ffi/ffi.dart"));
        ffi.with_prefix(String::from("ffi"));
        w.import(ffi);
        writeln!(w)?;
        if let Some(ref docs) = self.documentation {
            let docs = docs
                .split('\n')
                .map(|c| format!("/// {}", c))
                .collect::<Vec<_>>()
                .join("\n");
            writeln!(w, "{}", docs)?;
        } else {
            writeln!(w, "/// C struct `{}`.", self.name)?;
        }
        writeln!(w, "class {} extends Struct {{", self.name)?;
        writeln!(w, "  ")?;

        for field in &self.fields {
            if let Some(annotation) = w.get_property_annotation_type(&field.ty)
            {
                writeln!(w, "  @{}()", annotation)?;
            }
            writeln!(w, "  {} {};", w.get_dart_type(&field.ty), field.name)?;
        }

        writeln!(w, "  static Pointer<{}> allocate() {{", self.name)?;
        writeln!(w, "    return ffi.allocate<{}>();", self.name)?;
        writeln!(w, "  }}\n")?;
        writeln!(w)?;
        writeln!(w, "  static {} from(int ptr) {{", self.name)?;
        writeln!(w, "    return Pointer<{}>.fromAddress(ptr).ref;", self.name)?;
        writeln!(w, "  }}\n")?;
        writeln!(w, "}}")?;
        Ok(())
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct Field {
    name: String,
    ty: String,
}

impl Field {
    pub(crate) const fn new(name: String, ty: String) -> Self {
        Self { name, ty }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::{dart_source_writer::ImportedUri, Element};
    macro_rules! get_dsw {
        () => {{
            let mut dsw = DartSourceWriter::new();
            dsw.import(ImportedUri::new(String::from("dart:ffi")));
            let mut ffi =
                ImportedUri::new(String::from("package:ffi/ffi.dart"));
            ffi.with_prefix(String::from("ffi"));
            dsw.import(ffi);
            dsw
        }};
    }

    #[test]
    fn test_simple_struct() {
        let mut dsw = get_dsw!();
        let s = Struct::new(String::from("foo"), None, Vec::new());
        s.generate_source(&mut dsw).unwrap();
        println!("{}", dsw);
    }
}

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

use std::io;

pub mod config;

mod dart_source_writer;
use dart_source_writer::DartSourceWriter;

mod func;

/// Abstract over Func, Struct and Global.
trait Element {
    /// Get the name of this element
    fn name(&self) -> &str;

    /// Optional documentation of this element
    fn documentation(&self) -> Option<&str>;

    /// Used to Write the Current Element to the Final Source File
    fn generate_source(&self, w: &mut DartSourceWriter) -> io::Result<()>;
}

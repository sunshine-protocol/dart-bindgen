use clang::SourceError;
use std::io::Error as IoError;
#[derive(thiserror::Error, Debug)]
pub enum CodegenError {
    #[error("Builder Error: {}", _0)]
    Builder(&'static str),
    #[error("IO Error: {}", _0)]
    Io(#[from] IoError),
    #[error("Other: {}", _0)]
    Other(String),
    #[error("SourceError: {}", _0)]
    SourceError(#[from] SourceError),
    // TODO(@shekohex): add more info here
    #[error("Found Function without name at ")]
    UnnamedFunction,
    // TODO(@shekohex): add more info here
    #[error("Unknown Return type for function `func_name_here` at ")]
    UnknownFunctionReturnType,
    #[error("Unknown Param type for param `a` at ")]
    UnknownParamType,
    #[error("Unknown Pointee type for param `a` at ")]
    UnknownPointeeType,
}

impl From<String> for CodegenError {
    fn from(e: String) -> Self { Self::Other(e) }
}

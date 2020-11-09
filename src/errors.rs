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
    #[error("Found Struct without name at ")]
    UnnamedStruct,
    #[error("Unknown name of struct field `a` at ")]
    UnnamedStructField,
    #[error("Unknown type for struct field `a` at ")]
    UnknownStructFieldType,
    #[error("Found Enum without name at ")]
    UnnamedEnum,
    #[error("Unknown name for enum field `a` at ")]
    UnnamedEnumField,
    #[error("Unknown constant value for enum field `a` at ")]
    UnknownEnumFieldConstantValue,
    #[error("An anonymous entity found at ")]
    AnonymousEntity,
}

impl From<String> for CodegenError {
    fn from(e: String) -> Self { Self::Other(e) }
}

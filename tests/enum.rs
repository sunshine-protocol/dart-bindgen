use dart_bindgen::{config::*, Codegen};
use insta::assert_snapshot;
use log::LevelFilter;
use simplelog::{TermLogger, TerminalMode};
use std::io::Cursor;

#[test]
fn test_enum() {
    TermLogger::init(
        LevelFilter::Debug,
        Default::default(),
        TerminalMode::Mixed,
    )
    .unwrap();
    let config = DynamicLibraryConfig {
        ios: DynamicLibraryCreationMode::Executable.into(),
        android: DynamicLibraryCreationMode::open("libenum.so").into(),
        windows: DynamicLibraryCreationMode::open("enum.dll").into(),
        ..Default::default()
    };
    let bindings = Codegen::builder()
        .with_src_header("tests/headers/enum.h")
        .with_lib_name("libenum")
        .with_config(config)
        .build()
        .unwrap()
        .generate()
        .unwrap();

    let mut out = Cursor::new(Vec::new());
    bindings.write(&mut out).unwrap();
    let out = String::from_utf8(out.into_inner()).unwrap();
    assert_snapshot!(out);
}

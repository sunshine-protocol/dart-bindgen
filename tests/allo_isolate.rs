use dart_bindgen::{config::*, Codegen};
use insta::assert_snapshot;
use log::LevelFilter;
use simplelog::{TermLogger, TerminalMode};
use std::io::Cursor;

#[test]
fn test_allo_isolate() {
    TermLogger::init(
        LevelFilter::Debug,
        Default::default(),
        TerminalMode::Mixed,
    )
    .unwrap();
    let config = DynamicLibraryConfig {
        ios: DynamicLibraryCreationMode::Executable.into(),
        android: DynamicLibraryCreationMode::open("libkeystore.so").into(),
        windows: DynamicLibraryCreationMode::open("keystore.dll").into(),
        ..Default::default()
    };
    let bindings = Codegen::builder()
        .with_src_header("tests/headers/keystore.h")
        .with_lib_name("libkeystore")
        .with_config(config)
        .with_allo_isolate()
        .build()
        .unwrap()
        .generate()
        .unwrap();

    let mut out = Cursor::new(Vec::new());
    bindings.write(&mut out).unwrap();
    let out = String::from_utf8(out.into_inner()).unwrap();
    assert_snapshot!(out);
}

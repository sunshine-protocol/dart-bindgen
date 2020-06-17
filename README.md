<h1 align="center">Dart Bindgen</h1>
<div align="center">
  <strong>
        A tool for generating Dart FFI bindings to C Header file.
  </strong>

</div>

<br />

[![crates.io](https://img.shields.io/crates/v/dart-bindgen.svg)](https://crates.io/crates/dart-bindgen)
[![Documentation](https://docs.rs/dart-bindgen/badge.svg)](https://docs.rs/dart-bindgen)
[![GitHub license](https://img.shields.io/github/license/sunshine-protocol/dart-bindgen)](https://github.com/sunshine-protocol/dart-bindgen/blob/master/LICENSE)
![Crates.io](https://img.shields.io/crates/d/dart-bindgen)

## Goals

1. be able to generate a single `ffi.dart` file that should contain all the C header bindings.
2. Current Supported C Features

- [x] Functions
- [x] Function Pointer (aka Callbacks)
- [x] Simple Structs (NOTE: Nested structs is not supported yet, open a PR?)

## Non-Goals

Writing a High-Level Abstractions and idiomatic Dart Code for the FFI bindgens, we will leave that as a homework for the user :).

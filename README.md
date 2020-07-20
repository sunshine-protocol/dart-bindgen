<h1 align="center">Dart Bindgen</h1>
<div align="center">
  <strong>
        A tool for generating Dart FFI bindings to C Header file.
  </strong>

</div>

<br />

<div align="center">
  <a href="https://github.com/sunshine-protocol/dart-bindgen">
    <img src="https://github.com/sunshine-protocol/dart-bindgen/workflows/Snapshot%20Testing/badge.svg"
      alt="Snapshot Testing" />
  </a>
   <a href="https://github.com/sunshine-protocol/dart-bindgen">
    <img src="https://github.com/sunshine-protocol/dart-bindgen/workflows/Security%20audit/badge.svg"
      alt="Security" />
  </a>
  <a href="https://crates.io/crates/dart-bindgen">
    <img src="https://img.shields.io/crates/v/dart-bindgen.svg"
      alt="crates.io" />
  </a>
  <a href="https://docs.rs/dart-bindgen">
    <img src="https://docs.rs/dart-bindgen/badge.svg"
      alt="Documentation" />
  </a>
</div>

## Goals

1. be able to generate a single `ffi.dart` file that should contain all the C header bindings.
2. Current Supported C Features

- [x] Functions
- [x] Function Pointer (aka Callbacks)
- [x] Simple Structs (NOTE: Nested structs is not supported yet, open a PR?)

## Non-Goals

Writing a High-Level Abstractions and idiomatic Dart Code for the FFI bindgens, we will leave that as a homework for the user :).

## Install

Make sure you have installed the dependencies:

1. LLVM and clang

#### on macOS:

```
brew install llvm
```

#### on Windows:

Download a prebuild from [here](https://releases.llvm.org/)

#### on Linux:

you know what to do ;)

---

and then you could install the CLI from [github releases](https://github.com/sunshine-protocol/dart-bindgen/releases) or you could also use cargo to build it from source:

```bash
$ cargo install --force dart-bindgen --features cli
```

## Safety

This crate uses `#![deny(unsafe_code)]` to ensure everything is implemented in
100% Safe Rust.

## Contributing

Want to join us? Check out our ["Contributing" guide][contributing] and take a
look at some of these issues:

- [Issues labeled "good first issue"][good-first-issue]
- [Issues labeled "help wanted"][help-wanted]

[contributing]: https://github.com/sunshine-protocol/dart-bindgen/blob/master/.github/CONTRIBUTING.md
[good-first-issue]: https://github.com/sunshine-protocol/dart-bindgen/labels/good%20first%20issue
[help-wanted]: https://github.com/sunshine-protocol/dart-bindgen/labels/help%20wanted

## License

<sup>
Licensed under <a href="LICENSE">Apache v2.0 license</a>.
</sup>

<br/>

<sub>
Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in this crate by you, as defined in the Apache-2.0 license, shall
be licensed as above, without any additional terms or conditions.
</sub>

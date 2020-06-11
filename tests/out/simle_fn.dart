import 'dart:io';
import 'package:ffi/ffi.dart' as ffi;
import 'dart:ffi';

final DynamicLibrary _dl = _open();
DynamicLibrary _open() {
  if (Platform.isWindows) return DynamicLibrary.open('target/addr_ffi.dll');
  if (Platform.isAndroid) return DynamicLibrary.open('libaddr_ffi.so');
  if (Platform.isIOS) return DynamicLibrary.executable();
  throw UnsupportedError('This platform is not supported.');
}

/// C function `add`.

int add(
  int a,
  int b,
) {
  return   _add(a, b);
}
final _add_Dart _add = _dl.lookupFunction<_add_C, _add_Dart>('add');
typedef _add_C = ffi.Int64 Function(
  ffi.Int64 a,
  ffi.Int64 b,
);
typedef _add_Dart = int Function(
  int a,
  int b,
);

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
typedef _add_C = Int64 Function(
  Int64 a,
  Int64 b,
);
typedef _add_Dart = int Function(
  int a,
  int b,
);

/// C function `callback_test`.

int callback_test(
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Pointer<ffi.Utf8>>, Pointer<Pointer<ffi.Utf8>>)>> callback,
) {
  return   _callback_test(callback);
}
final _callback_test_Dart _callback_test = _dl.lookupFunction<_callback_test_C, _callback_test_Dart>('callback_test');
typedef _callback_test_C = Int32 Function(
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Pointer<ffi.Utf8>>, Pointer<Pointer<ffi.Utf8>>)>> callback,
);
typedef _callback_test_Dart = int Function(
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Pointer<ffi.Utf8>>, Pointer<Pointer<ffi.Utf8>>)>> callback,
);

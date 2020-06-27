/// bindings for `libkeystore`

import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart' as ffi;

// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names
final DynamicLibrary _dl = _open();
DynamicLibrary _open() {
  if (Platform.isWindows) return DynamicLibrary.open('keystore.dll');
  if (Platform.isAndroid) return DynamicLibrary.open('libkeystore.so');
  if (Platform.isIOS) return DynamicLibrary.executable();
  throw UnsupportedError('This platform is not supported.');
}

/// C function `account_destroy`.
void account_destroy(
  Pointer account,
) {
  _account_destroy(account);
}
final _account_destroy_Dart _account_destroy = _dl.lookupFunction<_account_destroy_C, _account_destroy_Dart>('account_destroy');
typedef _account_destroy_C = Void Function(
  Pointer account,
);
typedef _account_destroy_Dart = void Function(
  Pointer account,
);

/// C function `error_message_utf8`.
int error_message_utf8(
  Pointer<ffi.Utf8> buf,
  int length,
) {
  return _error_message_utf8(buf, length);
}
final _error_message_utf8_Dart _error_message_utf8 = _dl.lookupFunction<_error_message_utf8_C, _error_message_utf8_Dart>('error_message_utf8');
typedef _error_message_utf8_C = Int32 Function(
  Pointer<ffi.Utf8> buf,
  Int32 length,
);
typedef _error_message_utf8_Dart = int Function(
  Pointer<ffi.Utf8> buf,
  int length,
);

/// C function `keystore_account`.
Pointer keystore_account(
  Pointer keystore,
) {
  return _keystore_account(keystore);
}
final _keystore_account_Dart _keystore_account = _dl.lookupFunction<_keystore_account_C, _keystore_account_Dart>('keystore_account');
typedef _keystore_account_C = Pointer Function(
  Pointer keystore,
);
typedef _keystore_account_Dart = Pointer Function(
  Pointer keystore,
);

/// C function `keystore_destroy`.
void keystore_destroy(
  Pointer keystore,
) {
  _keystore_destroy(keystore);
}
final _keystore_destroy_Dart _keystore_destroy = _dl.lookupFunction<_keystore_destroy_C, _keystore_destroy_Dart>('keystore_destroy');
typedef _keystore_destroy_C = Void Function(
  Pointer keystore,
);
typedef _keystore_destroy_Dart = void Function(
  Pointer keystore,
);

/// C function `keystore_from_keyfile`.
Pointer keystore_from_keyfile(
  Pointer<ffi.Utf8> path,
) {
  return _keystore_from_keyfile(path);
}
final _keystore_from_keyfile_Dart _keystore_from_keyfile = _dl.lookupFunction<_keystore_from_keyfile_C, _keystore_from_keyfile_Dart>('keystore_from_keyfile');
typedef _keystore_from_keyfile_C = Pointer Function(
  Pointer<ffi.Utf8> path,
);
typedef _keystore_from_keyfile_Dart = Pointer Function(
  Pointer<ffi.Utf8> path,
);

/// C function `keystore_generate`.
int keystore_generate(
  Pointer keystore,
  Pointer<ffi.Utf8> password,
) {
  return _keystore_generate(keystore, password);
}
final _keystore_generate_Dart _keystore_generate = _dl.lookupFunction<_keystore_generate_C, _keystore_generate_Dart>('keystore_generate');
typedef _keystore_generate_C = Int32 Function(
  Pointer keystore,
  Pointer<ffi.Utf8> password,
);
typedef _keystore_generate_Dart = int Function(
  Pointer keystore,
  Pointer<ffi.Utf8> password,
);

/// C function `keystore_import`.
int keystore_import(
  Pointer keystore,
  Pointer<ffi.Utf8> phrase,
  Pointer<ffi.Utf8> password,
) {
  return _keystore_import(keystore, phrase, password);
}
final _keystore_import_Dart _keystore_import = _dl.lookupFunction<_keystore_import_C, _keystore_import_Dart>('keystore_import');
typedef _keystore_import_C = Int32 Function(
  Pointer keystore,
  Pointer<ffi.Utf8> phrase,
  Pointer<ffi.Utf8> password,
);
typedef _keystore_import_Dart = int Function(
  Pointer keystore,
  Pointer<ffi.Utf8> phrase,
  Pointer<ffi.Utf8> password,
);

/// C function `keystore_lock`.
int keystore_lock(
  Pointer keystore,
) {
  return _keystore_lock(keystore);
}
final _keystore_lock_Dart _keystore_lock = _dl.lookupFunction<_keystore_lock_C, _keystore_lock_Dart>('keystore_lock');
typedef _keystore_lock_C = Int32 Function(
  Pointer keystore,
);
typedef _keystore_lock_Dart = int Function(
  Pointer keystore,
);

/// C function `keystore_new`.
Pointer keystore_new() {
  return _keystore_new();
}
final _keystore_new_Dart _keystore_new = _dl.lookupFunction<_keystore_new_C, _keystore_new_Dart>('keystore_new');
typedef _keystore_new_C = Pointer Function();
typedef _keystore_new_Dart = Pointer Function();

/// C function `keystore_paper_backup`.
int keystore_paper_backup(
  Pointer keystore,
) {
  return _keystore_paper_backup(keystore);
}
final _keystore_paper_backup_Dart _keystore_paper_backup = _dl.lookupFunction<_keystore_paper_backup_C, _keystore_paper_backup_Dart>('keystore_paper_backup');
typedef _keystore_paper_backup_C = Int32 Function(
  Pointer keystore,
);
typedef _keystore_paper_backup_Dart = int Function(
  Pointer keystore,
);

/// C function `keystore_phrase`.
Pointer<ffi.Utf8> keystore_phrase(
  Pointer keystore,
  Pointer<ffi.Utf8> password,
) {
  return _keystore_phrase(keystore, password);
}
final _keystore_phrase_Dart _keystore_phrase = _dl.lookupFunction<_keystore_phrase_C, _keystore_phrase_Dart>('keystore_phrase');
typedef _keystore_phrase_C = Pointer<ffi.Utf8> Function(
  Pointer keystore,
  Pointer<ffi.Utf8> password,
);
typedef _keystore_phrase_Dart = Pointer<ffi.Utf8> Function(
  Pointer keystore,
  Pointer<ffi.Utf8> password,
);

/// C function `keystore_set_paper_backup`.
int keystore_set_paper_backup(
  Pointer keystore,
) {
  return _keystore_set_paper_backup(keystore);
}
final _keystore_set_paper_backup_Dart _keystore_set_paper_backup = _dl.lookupFunction<_keystore_set_paper_backup_C, _keystore_set_paper_backup_Dart>('keystore_set_paper_backup');
typedef _keystore_set_paper_backup_C = Int32 Function(
  Pointer keystore,
);
typedef _keystore_set_paper_backup_Dart = int Function(
  Pointer keystore,
);

/// C function `keystore_status`.
int keystore_status(
  Pointer keystore,
) {
  return _keystore_status(keystore);
}
final _keystore_status_Dart _keystore_status = _dl.lookupFunction<_keystore_status_C, _keystore_status_Dart>('keystore_status');
typedef _keystore_status_C = Int32 Function(
  Pointer keystore,
);
typedef _keystore_status_Dart = int Function(
  Pointer keystore,
);

/// C function `keystore_unlock`.
int keystore_unlock(
  Pointer keystore,
  Pointer<ffi.Utf8> password,
) {
  return _keystore_unlock(keystore, password);
}
final _keystore_unlock_Dart _keystore_unlock = _dl.lookupFunction<_keystore_unlock_C, _keystore_unlock_Dart>('keystore_unlock');
typedef _keystore_unlock_C = Int32 Function(
  Pointer keystore,
  Pointer<ffi.Utf8> password,
);
typedef _keystore_unlock_Dart = int Function(
  Pointer keystore,
  Pointer<ffi.Utf8> password,
);

/// C function `last_error_length`.
int last_error_length() {
  return _last_error_length();
}
final _last_error_length_Dart _last_error_length = _dl.lookupFunction<_last_error_length_C, _last_error_length_Dart>('last_error_length');
typedef _last_error_length_C = Int32 Function();
typedef _last_error_length_Dart = int Function();

/// C function `phrase_destroy`.
void phrase_destroy(
  Pointer<ffi.Utf8> phrase,
) {
  _phrase_destroy(phrase);
}
final _phrase_destroy_Dart _phrase_destroy = _dl.lookupFunction<_phrase_destroy_C, _phrase_destroy_Dart>('phrase_destroy');
typedef _phrase_destroy_C = Void Function(
  Pointer<ffi.Utf8> phrase,
);
typedef _phrase_destroy_Dart = void Function(
  Pointer<ffi.Utf8> phrase,
);

/// C function `store_dart_post_cobject`.
void store_dart_post_cobject(
  Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
) {
  _store_dart_post_cobject(ptr);
}
final _store_dart_post_cobject_Dart _store_dart_post_cobject = _dl.lookupFunction<_store_dart_post_cobject_C, _store_dart_post_cobject_Dart>('store_dart_post_cobject');
typedef _store_dart_post_cobject_C = Void Function(
  Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
);
typedef _store_dart_post_cobject_Dart = void Function(
  Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr,
);

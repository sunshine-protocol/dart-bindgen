import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart' as ffi;

final DynamicLibrary _dl = _open();
DynamicLibrary _open() {
  if (Platform.isWindows) return DynamicLibrary.open('target/sqlite.dll');
  if (Platform.isAndroid) return DynamicLibrary.open('libsqlite.so');
  if (Platform.isIOS) return DynamicLibrary.executable();
  throw UnsupportedError('This platform is not supported.');
}

/// C function `sqlite3_libversion`.

Pointer<Uint8> sqlite3_libversion() {
  return   _sqlite3_libversion();
}
final _sqlite3_libversion_Dart _sqlite3_libversion = _dl.lookupFunction<_sqlite3_libversion_C, _sqlite3_libversion_Dart>('sqlite3_libversion');
typedef _sqlite3_libversion_C = Pointer<Uint8> Function();
typedef _sqlite3_libversion_Dart = Pointer<Uint8> Function();

/// C function `sqlite3_sourceid`.

Pointer<Uint8> sqlite3_sourceid() {
  return   _sqlite3_sourceid();
}
final _sqlite3_sourceid_Dart _sqlite3_sourceid = _dl.lookupFunction<_sqlite3_sourceid_C, _sqlite3_sourceid_Dart>('sqlite3_sourceid');
typedef _sqlite3_sourceid_C = Pointer<Uint8> Function();
typedef _sqlite3_sourceid_Dart = Pointer<Uint8> Function();

/// C function `sqlite3_libversion_number`.

int sqlite3_libversion_number() {
  return   _sqlite3_libversion_number();
}
final _sqlite3_libversion_number_Dart _sqlite3_libversion_number = _dl.lookupFunction<_sqlite3_libversion_number_C, _sqlite3_libversion_number_Dart>('sqlite3_libversion_number');
typedef _sqlite3_libversion_number_C = Int32 Function();
typedef _sqlite3_libversion_number_Dart = int Function();

/// C function `sqlite3_compileoption_used`.

int sqlite3_compileoption_used(
  Pointer<Uint8> zOptName,
) {
  return   _sqlite3_compileoption_used(zOptName);
}
final _sqlite3_compileoption_used_Dart _sqlite3_compileoption_used = _dl.lookupFunction<_sqlite3_compileoption_used_C, _sqlite3_compileoption_used_Dart>('sqlite3_compileoption_used');
typedef _sqlite3_compileoption_used_C = Int32 Function(
  Pointer<Uint8> zOptName,
);
typedef _sqlite3_compileoption_used_Dart = int Function(
  Pointer<Uint8> zOptName,
);

/// C function `sqlite3_compileoption_get`.

Pointer<Uint8> sqlite3_compileoption_get(
  int N,
) {
  return   _sqlite3_compileoption_get(N);
}
final _sqlite3_compileoption_get_Dart _sqlite3_compileoption_get = _dl.lookupFunction<_sqlite3_compileoption_get_C, _sqlite3_compileoption_get_Dart>('sqlite3_compileoption_get');
typedef _sqlite3_compileoption_get_C = Pointer<Uint8> Function(
  Int32 N,
);
typedef _sqlite3_compileoption_get_Dart = Pointer<Uint8> Function(
  int N,
);

/// C function `sqlite3_threadsafe`.

int sqlite3_threadsafe() {
  return   _sqlite3_threadsafe();
}
final _sqlite3_threadsafe_Dart _sqlite3_threadsafe = _dl.lookupFunction<_sqlite3_threadsafe_C, _sqlite3_threadsafe_Dart>('sqlite3_threadsafe');
typedef _sqlite3_threadsafe_C = Int32 Function();
typedef _sqlite3_threadsafe_Dart = int Function();

/// C function `sqlite3_close`.

int sqlite3_close(
  Pointer<sqlite3> arg0,
) {
  return   _sqlite3_close(arg0);
}
final _sqlite3_close_Dart _sqlite3_close = _dl.lookupFunction<_sqlite3_close_C, _sqlite3_close_Dart>('sqlite3_close');
typedef _sqlite3_close_C = Int32 Function(
  Pointer<sqlite3> arg0,
);
typedef _sqlite3_close_Dart = int Function(
  Pointer<sqlite3> arg0,
);

/// C function `sqlite3_exec`.

int sqlite3_exec(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> sql,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Pointer<ffi.Utf8>>, Pointer<Pointer<ffi.Utf8>>)>> callback,
  Pointer<Void> arg3,
  Pointer<Pointer<ffi.Utf8>> errmsg,
) {
  return   _sqlite3_exec(arg0, sql, callback, arg3, errmsg);
}
final _sqlite3_exec_Dart _sqlite3_exec = _dl.lookupFunction<_sqlite3_exec_C, _sqlite3_exec_Dart>('sqlite3_exec');
typedef _sqlite3_exec_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> sql,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Pointer<ffi.Utf8>>, Pointer<Pointer<ffi.Utf8>>)>> callback,
  Pointer<Void> arg3,
  Pointer<Pointer<ffi.Utf8>> errmsg,
);
typedef _sqlite3_exec_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> sql,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Pointer<ffi.Utf8>>, Pointer<Pointer<ffi.Utf8>>)>> callback,
  Pointer<Void> arg3,
  Pointer<Pointer<ffi.Utf8>> errmsg,
);

/// C function `sqlite3_initialize`.

int sqlite3_initialize() {
  return   _sqlite3_initialize();
}
final _sqlite3_initialize_Dart _sqlite3_initialize = _dl.lookupFunction<_sqlite3_initialize_C, _sqlite3_initialize_Dart>('sqlite3_initialize');
typedef _sqlite3_initialize_C = Int32 Function();
typedef _sqlite3_initialize_Dart = int Function();

/// C function `sqlite3_shutdown`.

int sqlite3_shutdown() {
  return   _sqlite3_shutdown();
}
final _sqlite3_shutdown_Dart _sqlite3_shutdown = _dl.lookupFunction<_sqlite3_shutdown_C, _sqlite3_shutdown_Dart>('sqlite3_shutdown');
typedef _sqlite3_shutdown_C = Int32 Function();
typedef _sqlite3_shutdown_Dart = int Function();

/// C function `sqlite3_os_init`.

int sqlite3_os_init() {
  return   _sqlite3_os_init();
}
final _sqlite3_os_init_Dart _sqlite3_os_init = _dl.lookupFunction<_sqlite3_os_init_C, _sqlite3_os_init_Dart>('sqlite3_os_init');
typedef _sqlite3_os_init_C = Int32 Function();
typedef _sqlite3_os_init_Dart = int Function();

/// C function `sqlite3_os_end`.

int sqlite3_os_end() {
  return   _sqlite3_os_end();
}
final _sqlite3_os_end_Dart _sqlite3_os_end = _dl.lookupFunction<_sqlite3_os_end_C, _sqlite3_os_end_Dart>('sqlite3_os_end');
typedef _sqlite3_os_end_C = Int32 Function();
typedef _sqlite3_os_end_Dart = int Function();

/// C function `sqlite3_config`.

int sqlite3_config(
  int arg0,
) {
  return   _sqlite3_config(arg0);
}
final _sqlite3_config_Dart _sqlite3_config = _dl.lookupFunction<_sqlite3_config_C, _sqlite3_config_Dart>('sqlite3_config');
typedef _sqlite3_config_C = Int32 Function(
  Int32 arg0,
);
typedef _sqlite3_config_Dart = int Function(
  int arg0,
);

/// C function `sqlite3_db_config`.

int sqlite3_db_config(
  Pointer<sqlite3> arg0,
  int op,
) {
  return   _sqlite3_db_config(arg0, op);
}
final _sqlite3_db_config_Dart _sqlite3_db_config = _dl.lookupFunction<_sqlite3_db_config_C, _sqlite3_db_config_Dart>('sqlite3_db_config');
typedef _sqlite3_db_config_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Int32 op,
);
typedef _sqlite3_db_config_Dart = int Function(
  Pointer<sqlite3> arg0,
  int op,
);

/// C function `sqlite3_extended_result_codes`.

int sqlite3_extended_result_codes(
  Pointer<sqlite3> arg0,
  int onoff,
) {
  return   _sqlite3_extended_result_codes(arg0, onoff);
}
final _sqlite3_extended_result_codes_Dart _sqlite3_extended_result_codes = _dl.lookupFunction<_sqlite3_extended_result_codes_C, _sqlite3_extended_result_codes_Dart>('sqlite3_extended_result_codes');
typedef _sqlite3_extended_result_codes_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Int32 onoff,
);
typedef _sqlite3_extended_result_codes_Dart = int Function(
  Pointer<sqlite3> arg0,
  int onoff,
);

/// C function `sqlite3_last_insert_rowid`.

int sqlite3_last_insert_rowid(
  Pointer<sqlite3> arg0,
) {
  return   _sqlite3_last_insert_rowid(arg0);
}
final _sqlite3_last_insert_rowid_Dart _sqlite3_last_insert_rowid = _dl.lookupFunction<_sqlite3_last_insert_rowid_C, _sqlite3_last_insert_rowid_Dart>('sqlite3_last_insert_rowid');
typedef _sqlite3_last_insert_rowid_C = Int64 Function(
  Pointer<sqlite3> arg0,
);
typedef _sqlite3_last_insert_rowid_Dart = int Function(
  Pointer<sqlite3> arg0,
);

/// C function `sqlite3_changes`.

int sqlite3_changes(
  Pointer<sqlite3> arg0,
) {
  return   _sqlite3_changes(arg0);
}
final _sqlite3_changes_Dart _sqlite3_changes = _dl.lookupFunction<_sqlite3_changes_C, _sqlite3_changes_Dart>('sqlite3_changes');
typedef _sqlite3_changes_C = Int32 Function(
  Pointer<sqlite3> arg0,
);
typedef _sqlite3_changes_Dart = int Function(
  Pointer<sqlite3> arg0,
);

/// C function `sqlite3_total_changes`.

int sqlite3_total_changes(
  Pointer<sqlite3> arg0,
) {
  return   _sqlite3_total_changes(arg0);
}
final _sqlite3_total_changes_Dart _sqlite3_total_changes = _dl.lookupFunction<_sqlite3_total_changes_C, _sqlite3_total_changes_Dart>('sqlite3_total_changes');
typedef _sqlite3_total_changes_C = Int32 Function(
  Pointer<sqlite3> arg0,
);
typedef _sqlite3_total_changes_Dart = int Function(
  Pointer<sqlite3> arg0,
);

/// C function `sqlite3_interrupt`.

void sqlite3_interrupt(
  Pointer<sqlite3> arg0,
) {
   _sqlite3_interrupt(arg0);
}
final _sqlite3_interrupt_Dart _sqlite3_interrupt = _dl.lookupFunction<_sqlite3_interrupt_C, _sqlite3_interrupt_Dart>('sqlite3_interrupt');
typedef _sqlite3_interrupt_C = Void Function(
  Pointer<sqlite3> arg0,
);
typedef _sqlite3_interrupt_Dart = void Function(
  Pointer<sqlite3> arg0,
);

/// C function `sqlite3_complete`.

int sqlite3_complete(
  Pointer<Uint8> sql,
) {
  return   _sqlite3_complete(sql);
}
final _sqlite3_complete_Dart _sqlite3_complete = _dl.lookupFunction<_sqlite3_complete_C, _sqlite3_complete_Dart>('sqlite3_complete');
typedef _sqlite3_complete_C = Int32 Function(
  Pointer<Uint8> sql,
);
typedef _sqlite3_complete_Dart = int Function(
  Pointer<Uint8> sql,
);

/// C function `sqlite3_complete16`.

int sqlite3_complete16(
  Pointer<Void> sql,
) {
  return   _sqlite3_complete16(sql);
}
final _sqlite3_complete16_Dart _sqlite3_complete16 = _dl.lookupFunction<_sqlite3_complete16_C, _sqlite3_complete16_Dart>('sqlite3_complete16');
typedef _sqlite3_complete16_C = Int32 Function(
  Pointer<Void> sql,
);
typedef _sqlite3_complete16_Dart = int Function(
  Pointer<Void> sql,
);

/// C function `sqlite3_busy_handler`.

int sqlite3_busy_handler(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32)>> arg1,
  Pointer<Void> arg2,
) {
  return   _sqlite3_busy_handler(arg0, arg1, arg2);
}
final _sqlite3_busy_handler_Dart _sqlite3_busy_handler = _dl.lookupFunction<_sqlite3_busy_handler_C, _sqlite3_busy_handler_Dart>('sqlite3_busy_handler');
typedef _sqlite3_busy_handler_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32)>> arg1,
  Pointer<Void> arg2,
);
typedef _sqlite3_busy_handler_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32)>> arg1,
  Pointer<Void> arg2,
);

/// C function `sqlite3_busy_timeout`.

int sqlite3_busy_timeout(
  Pointer<sqlite3> arg0,
  int ms,
) {
  return   _sqlite3_busy_timeout(arg0, ms);
}
final _sqlite3_busy_timeout_Dart _sqlite3_busy_timeout = _dl.lookupFunction<_sqlite3_busy_timeout_C, _sqlite3_busy_timeout_Dart>('sqlite3_busy_timeout');
typedef _sqlite3_busy_timeout_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Int32 ms,
);
typedef _sqlite3_busy_timeout_Dart = int Function(
  Pointer<sqlite3> arg0,
  int ms,
);

/// C function `sqlite3_get_table`.

int sqlite3_get_table(
  Pointer<sqlite3> db,
  Pointer<Uint8> zSql,
  Pointer<Pointer<Pointer<ffi.Utf8>>> pazResult,
  Pointer<Int32> pnRow,
  Pointer<Int32> pnColumn,
  Pointer<Pointer<ffi.Utf8>> pzErrmsg,
) {
  return   _sqlite3_get_table(db, zSql, pazResult, pnRow, pnColumn, pzErrmsg);
}
final _sqlite3_get_table_Dart _sqlite3_get_table = _dl.lookupFunction<_sqlite3_get_table_C, _sqlite3_get_table_Dart>('sqlite3_get_table');
typedef _sqlite3_get_table_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zSql,
  Pointer<Pointer<Pointer<ffi.Utf8>>> pazResult,
  Pointer<Int32> pnRow,
  Pointer<Int32> pnColumn,
  Pointer<Pointer<ffi.Utf8>> pzErrmsg,
);
typedef _sqlite3_get_table_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zSql,
  Pointer<Pointer<Pointer<ffi.Utf8>>> pazResult,
  Pointer<Int32> pnRow,
  Pointer<Int32> pnColumn,
  Pointer<Pointer<ffi.Utf8>> pzErrmsg,
);

/// C function `sqlite3_free_table`.

void sqlite3_free_table(
  Pointer<Pointer<ffi.Utf8>> result,
) {
   _sqlite3_free_table(result);
}
final _sqlite3_free_table_Dart _sqlite3_free_table = _dl.lookupFunction<_sqlite3_free_table_C, _sqlite3_free_table_Dart>('sqlite3_free_table');
typedef _sqlite3_free_table_C = Void Function(
  Pointer<Pointer<ffi.Utf8>> result,
);
typedef _sqlite3_free_table_Dart = void Function(
  Pointer<Pointer<ffi.Utf8>> result,
);

/// C function `sqlite3_mprintf`.

Pointer<ffi.Utf8> sqlite3_mprintf(
  Pointer<Uint8> arg0,
) {
  return   _sqlite3_mprintf(arg0);
}
final _sqlite3_mprintf_Dart _sqlite3_mprintf = _dl.lookupFunction<_sqlite3_mprintf_C, _sqlite3_mprintf_Dart>('sqlite3_mprintf');
typedef _sqlite3_mprintf_C = Pointer<ffi.Utf8> Function(
  Pointer<Uint8> arg0,
);
typedef _sqlite3_mprintf_Dart = Pointer<ffi.Utf8> Function(
  Pointer<Uint8> arg0,
);

/// C function `sqlite3_vmprintf`.

Pointer<ffi.Utf8> sqlite3_vmprintf(
  Pointer<Uint8> arg0,
  Pointer<ffi.Utf8> arg1,
) {
  return   _sqlite3_vmprintf(arg0, arg1);
}
final _sqlite3_vmprintf_Dart _sqlite3_vmprintf = _dl.lookupFunction<_sqlite3_vmprintf_C, _sqlite3_vmprintf_Dart>('sqlite3_vmprintf');
typedef _sqlite3_vmprintf_C = Pointer<ffi.Utf8> Function(
  Pointer<Uint8> arg0,
  Pointer<ffi.Utf8> arg1,
);
typedef _sqlite3_vmprintf_Dart = Pointer<ffi.Utf8> Function(
  Pointer<Uint8> arg0,
  Pointer<ffi.Utf8> arg1,
);

/// C function `sqlite3_snprintf`.

Pointer<ffi.Utf8> sqlite3_snprintf(
  int arg0,
  Pointer<ffi.Utf8> arg1,
  Pointer<Uint8> arg2,
) {
  return   _sqlite3_snprintf(arg0, arg1, arg2);
}
final _sqlite3_snprintf_Dart _sqlite3_snprintf = _dl.lookupFunction<_sqlite3_snprintf_C, _sqlite3_snprintf_Dart>('sqlite3_snprintf');
typedef _sqlite3_snprintf_C = Pointer<ffi.Utf8> Function(
  Int32 arg0,
  Pointer<ffi.Utf8> arg1,
  Pointer<Uint8> arg2,
);
typedef _sqlite3_snprintf_Dart = Pointer<ffi.Utf8> Function(
  int arg0,
  Pointer<ffi.Utf8> arg1,
  Pointer<Uint8> arg2,
);

/// C function `sqlite3_vsnprintf`.

Pointer<ffi.Utf8> sqlite3_vsnprintf(
  int arg0,
  Pointer<ffi.Utf8> arg1,
  Pointer<Uint8> arg2,
  Pointer<ffi.Utf8> arg3,
) {
  return   _sqlite3_vsnprintf(arg0, arg1, arg2, arg3);
}
final _sqlite3_vsnprintf_Dart _sqlite3_vsnprintf = _dl.lookupFunction<_sqlite3_vsnprintf_C, _sqlite3_vsnprintf_Dart>('sqlite3_vsnprintf');
typedef _sqlite3_vsnprintf_C = Pointer<ffi.Utf8> Function(
  Int32 arg0,
  Pointer<ffi.Utf8> arg1,
  Pointer<Uint8> arg2,
  Pointer<ffi.Utf8> arg3,
);
typedef _sqlite3_vsnprintf_Dart = Pointer<ffi.Utf8> Function(
  int arg0,
  Pointer<ffi.Utf8> arg1,
  Pointer<Uint8> arg2,
  Pointer<ffi.Utf8> arg3,
);

/// C function `sqlite3_malloc`.

Pointer<Void> sqlite3_malloc(
  int arg0,
) {
  return   _sqlite3_malloc(arg0);
}
final _sqlite3_malloc_Dart _sqlite3_malloc = _dl.lookupFunction<_sqlite3_malloc_C, _sqlite3_malloc_Dart>('sqlite3_malloc');
typedef _sqlite3_malloc_C = Pointer<Void> Function(
  Int32 arg0,
);
typedef _sqlite3_malloc_Dart = Pointer<Void> Function(
  int arg0,
);

/// C function `sqlite3_realloc`.

Pointer<Void> sqlite3_realloc(
  Pointer<Void> arg0,
  int arg1,
) {
  return   _sqlite3_realloc(arg0, arg1);
}
final _sqlite3_realloc_Dart _sqlite3_realloc = _dl.lookupFunction<_sqlite3_realloc_C, _sqlite3_realloc_Dart>('sqlite3_realloc');
typedef _sqlite3_realloc_C = Pointer<Void> Function(
  Pointer<Void> arg0,
  Int32 arg1,
);
typedef _sqlite3_realloc_Dart = Pointer<Void> Function(
  Pointer<Void> arg0,
  int arg1,
);

/// C function `sqlite3_free`.

void sqlite3_free(
  Pointer<Void> arg0,
) {
   _sqlite3_free(arg0);
}
final _sqlite3_free_Dart _sqlite3_free = _dl.lookupFunction<_sqlite3_free_C, _sqlite3_free_Dart>('sqlite3_free');
typedef _sqlite3_free_C = Void Function(
  Pointer<Void> arg0,
);
typedef _sqlite3_free_Dart = void Function(
  Pointer<Void> arg0,
);

/// C function `sqlite3_memory_used`.

int sqlite3_memory_used() {
  return   _sqlite3_memory_used();
}
final _sqlite3_memory_used_Dart _sqlite3_memory_used = _dl.lookupFunction<_sqlite3_memory_used_C, _sqlite3_memory_used_Dart>('sqlite3_memory_used');
typedef _sqlite3_memory_used_C = Int64 Function();
typedef _sqlite3_memory_used_Dart = int Function();

/// C function `sqlite3_memory_highwater`.

int sqlite3_memory_highwater(
  int resetFlag,
) {
  return   _sqlite3_memory_highwater(resetFlag);
}
final _sqlite3_memory_highwater_Dart _sqlite3_memory_highwater = _dl.lookupFunction<_sqlite3_memory_highwater_C, _sqlite3_memory_highwater_Dart>('sqlite3_memory_highwater');
typedef _sqlite3_memory_highwater_C = Int64 Function(
  Int32 resetFlag,
);
typedef _sqlite3_memory_highwater_Dart = int Function(
  int resetFlag,
);

/// C function `sqlite3_randomness`.

void sqlite3_randomness(
  int N,
  Pointer<Void> P,
) {
   _sqlite3_randomness(N, P);
}
final _sqlite3_randomness_Dart _sqlite3_randomness = _dl.lookupFunction<_sqlite3_randomness_C, _sqlite3_randomness_Dart>('sqlite3_randomness');
typedef _sqlite3_randomness_C = Void Function(
  Int32 N,
  Pointer<Void> P,
);
typedef _sqlite3_randomness_Dart = void Function(
  int N,
  Pointer<Void> P,
);

/// C function `sqlite3_set_authorizer`.

int sqlite3_set_authorizer(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>)>> xAuth,
  Pointer<Void> pUserData,
) {
  return   _sqlite3_set_authorizer(arg0, xAuth, pUserData);
}
final _sqlite3_set_authorizer_Dart _sqlite3_set_authorizer = _dl.lookupFunction<_sqlite3_set_authorizer_C, _sqlite3_set_authorizer_Dart>('sqlite3_set_authorizer');
typedef _sqlite3_set_authorizer_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>)>> xAuth,
  Pointer<Void> pUserData,
);
typedef _sqlite3_set_authorizer_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>)>> xAuth,
  Pointer<Void> pUserData,
);

/// C function `sqlite3_trace`.

Pointer<Void> sqlite3_trace(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<Uint8>)>> xTrace,
  Pointer<Void> arg2,
) {
  return   _sqlite3_trace(arg0, xTrace, arg2);
}
final _sqlite3_trace_Dart _sqlite3_trace = _dl.lookupFunction<_sqlite3_trace_C, _sqlite3_trace_Dart>('sqlite3_trace');
typedef _sqlite3_trace_C = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<Uint8>)>> xTrace,
  Pointer<Void> arg2,
);
typedef _sqlite3_trace_Dart = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<Uint8>)>> xTrace,
  Pointer<Void> arg2,
);

/// C function `sqlite3_profile`.

Pointer<Void> sqlite3_profile(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<Uint8>, Uint64)>> xProfile,
  Pointer<Void> arg2,
) {
  return   _sqlite3_profile(arg0, xProfile, arg2);
}
final _sqlite3_profile_Dart _sqlite3_profile = _dl.lookupFunction<_sqlite3_profile_C, _sqlite3_profile_Dart>('sqlite3_profile');
typedef _sqlite3_profile_C = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<Uint8>, Uint64)>> xProfile,
  Pointer<Void> arg2,
);
typedef _sqlite3_profile_Dart = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<Uint8>, Uint64)>> xProfile,
  Pointer<Void> arg2,
);

/// C function `sqlite3_progress_handler`.

void sqlite3_progress_handler(
  Pointer<sqlite3> arg0,
  int arg1,
  Pointer<NativeFunction<int Function(Pointer<Void>)>> arg2,
  Pointer<Void> arg3,
) {
   _sqlite3_progress_handler(arg0, arg1, arg2, arg3);
}
final _sqlite3_progress_handler_Dart _sqlite3_progress_handler = _dl.lookupFunction<_sqlite3_progress_handler_C, _sqlite3_progress_handler_Dart>('sqlite3_progress_handler');
typedef _sqlite3_progress_handler_C = Void Function(
  Pointer<sqlite3> arg0,
  Int32 arg1,
  Pointer<NativeFunction<int Function(Pointer<Void>)>> arg2,
  Pointer<Void> arg3,
);
typedef _sqlite3_progress_handler_Dart = void Function(
  Pointer<sqlite3> arg0,
  int arg1,
  Pointer<NativeFunction<int Function(Pointer<Void>)>> arg2,
  Pointer<Void> arg3,
);

/// C function `sqlite3_open`.

int sqlite3_open(
  Pointer<Uint8> filename,
  Pointer<Pointer<sqlite3>> ppDb,
) {
  return   _sqlite3_open(filename, ppDb);
}
final _sqlite3_open_Dart _sqlite3_open = _dl.lookupFunction<_sqlite3_open_C, _sqlite3_open_Dart>('sqlite3_open');
typedef _sqlite3_open_C = Int32 Function(
  Pointer<Uint8> filename,
  Pointer<Pointer<sqlite3>> ppDb,
);
typedef _sqlite3_open_Dart = int Function(
  Pointer<Uint8> filename,
  Pointer<Pointer<sqlite3>> ppDb,
);

/// C function `sqlite3_open16`.

int sqlite3_open16(
  Pointer<Void> filename,
  Pointer<Pointer<sqlite3>> ppDb,
) {
  return   _sqlite3_open16(filename, ppDb);
}
final _sqlite3_open16_Dart _sqlite3_open16 = _dl.lookupFunction<_sqlite3_open16_C, _sqlite3_open16_Dart>('sqlite3_open16');
typedef _sqlite3_open16_C = Int32 Function(
  Pointer<Void> filename,
  Pointer<Pointer<sqlite3>> ppDb,
);
typedef _sqlite3_open16_Dart = int Function(
  Pointer<Void> filename,
  Pointer<Pointer<sqlite3>> ppDb,
);

/// C function `sqlite3_open_v2`.

int sqlite3_open_v2(
  Pointer<Uint8> filename,
  Pointer<Pointer<sqlite3>> ppDb,
  int flags,
  Pointer<Uint8> zVfs,
) {
  return   _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}
final _sqlite3_open_v2_Dart _sqlite3_open_v2 = _dl.lookupFunction<_sqlite3_open_v2_C, _sqlite3_open_v2_Dart>('sqlite3_open_v2');
typedef _sqlite3_open_v2_C = Int32 Function(
  Pointer<Uint8> filename,
  Pointer<Pointer<sqlite3>> ppDb,
  Int32 flags,
  Pointer<Uint8> zVfs,
);
typedef _sqlite3_open_v2_Dart = int Function(
  Pointer<Uint8> filename,
  Pointer<Pointer<sqlite3>> ppDb,
  int flags,
  Pointer<Uint8> zVfs,
);

/// C function `sqlite3_uri_parameter`.

Pointer<Uint8> sqlite3_uri_parameter(
  Pointer<Uint8> zFilename,
  Pointer<Uint8> zParam,
) {
  return   _sqlite3_uri_parameter(zFilename, zParam);
}
final _sqlite3_uri_parameter_Dart _sqlite3_uri_parameter = _dl.lookupFunction<_sqlite3_uri_parameter_C, _sqlite3_uri_parameter_Dart>('sqlite3_uri_parameter');
typedef _sqlite3_uri_parameter_C = Pointer<Uint8> Function(
  Pointer<Uint8> zFilename,
  Pointer<Uint8> zParam,
);
typedef _sqlite3_uri_parameter_Dart = Pointer<Uint8> Function(
  Pointer<Uint8> zFilename,
  Pointer<Uint8> zParam,
);

/// C function `sqlite3_errcode`.

int sqlite3_errcode(
  Pointer<sqlite3> db,
) {
  return   _sqlite3_errcode(db);
}
final _sqlite3_errcode_Dart _sqlite3_errcode = _dl.lookupFunction<_sqlite3_errcode_C, _sqlite3_errcode_Dart>('sqlite3_errcode');
typedef _sqlite3_errcode_C = Int32 Function(
  Pointer<sqlite3> db,
);
typedef _sqlite3_errcode_Dart = int Function(
  Pointer<sqlite3> db,
);

/// C function `sqlite3_extended_errcode`.

int sqlite3_extended_errcode(
  Pointer<sqlite3> db,
) {
  return   _sqlite3_extended_errcode(db);
}
final _sqlite3_extended_errcode_Dart _sqlite3_extended_errcode = _dl.lookupFunction<_sqlite3_extended_errcode_C, _sqlite3_extended_errcode_Dart>('sqlite3_extended_errcode');
typedef _sqlite3_extended_errcode_C = Int32 Function(
  Pointer<sqlite3> db,
);
typedef _sqlite3_extended_errcode_Dart = int Function(
  Pointer<sqlite3> db,
);

/// C function `sqlite3_errmsg`.

Pointer<Uint8> sqlite3_errmsg(
  Pointer<sqlite3> arg0,
) {
  return   _sqlite3_errmsg(arg0);
}
final _sqlite3_errmsg_Dart _sqlite3_errmsg = _dl.lookupFunction<_sqlite3_errmsg_C, _sqlite3_errmsg_Dart>('sqlite3_errmsg');
typedef _sqlite3_errmsg_C = Pointer<Uint8> Function(
  Pointer<sqlite3> arg0,
);
typedef _sqlite3_errmsg_Dart = Pointer<Uint8> Function(
  Pointer<sqlite3> arg0,
);

/// C function `sqlite3_errmsg16`.

Pointer<Void> sqlite3_errmsg16(
  Pointer<sqlite3> arg0,
) {
  return   _sqlite3_errmsg16(arg0);
}
final _sqlite3_errmsg16_Dart _sqlite3_errmsg16 = _dl.lookupFunction<_sqlite3_errmsg16_C, _sqlite3_errmsg16_Dart>('sqlite3_errmsg16');
typedef _sqlite3_errmsg16_C = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
);
typedef _sqlite3_errmsg16_Dart = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
);

/// C function `sqlite3_limit`.

int sqlite3_limit(
  Pointer<sqlite3> arg0,
  int id,
  int newVal,
) {
  return   _sqlite3_limit(arg0, id, newVal);
}
final _sqlite3_limit_Dart _sqlite3_limit = _dl.lookupFunction<_sqlite3_limit_C, _sqlite3_limit_Dart>('sqlite3_limit');
typedef _sqlite3_limit_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Int32 id,
  Int32 newVal,
);
typedef _sqlite3_limit_Dart = int Function(
  Pointer<sqlite3> arg0,
  int id,
  int newVal,
);

/// C function `sqlite3_prepare`.

int sqlite3_prepare(
  Pointer<sqlite3> db,
  Pointer<Uint8> zSql,
  int nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<ffi.Utf8>> pzTail,
) {
  return   _sqlite3_prepare(db, zSql, nByte, ppStmt, pzTail);
}
final _sqlite3_prepare_Dart _sqlite3_prepare = _dl.lookupFunction<_sqlite3_prepare_C, _sqlite3_prepare_Dart>('sqlite3_prepare');
typedef _sqlite3_prepare_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zSql,
  Int32 nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<ffi.Utf8>> pzTail,
);
typedef _sqlite3_prepare_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zSql,
  int nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<ffi.Utf8>> pzTail,
);

/// C function `sqlite3_prepare_v2`.

int sqlite3_prepare_v2(
  Pointer<sqlite3> db,
  Pointer<Uint8> zSql,
  int nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<ffi.Utf8>> pzTail,
) {
  return   _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}
final _sqlite3_prepare_v2_Dart _sqlite3_prepare_v2 = _dl.lookupFunction<_sqlite3_prepare_v2_C, _sqlite3_prepare_v2_Dart>('sqlite3_prepare_v2');
typedef _sqlite3_prepare_v2_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zSql,
  Int32 nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<ffi.Utf8>> pzTail,
);
typedef _sqlite3_prepare_v2_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zSql,
  int nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<ffi.Utf8>> pzTail,
);

/// C function `sqlite3_prepare16`.

int sqlite3_prepare16(
  Pointer<sqlite3> db,
  Pointer<Void> zSql,
  int nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<Void>> pzTail,
) {
  return   _sqlite3_prepare16(db, zSql, nByte, ppStmt, pzTail);
}
final _sqlite3_prepare16_Dart _sqlite3_prepare16 = _dl.lookupFunction<_sqlite3_prepare16_C, _sqlite3_prepare16_Dart>('sqlite3_prepare16');
typedef _sqlite3_prepare16_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Void> zSql,
  Int32 nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<Void>> pzTail,
);
typedef _sqlite3_prepare16_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Void> zSql,
  int nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<Void>> pzTail,
);

/// C function `sqlite3_prepare16_v2`.

int sqlite3_prepare16_v2(
  Pointer<sqlite3> db,
  Pointer<Void> zSql,
  int nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<Void>> pzTail,
) {
  return   _sqlite3_prepare16_v2(db, zSql, nByte, ppStmt, pzTail);
}
final _sqlite3_prepare16_v2_Dart _sqlite3_prepare16_v2 = _dl.lookupFunction<_sqlite3_prepare16_v2_C, _sqlite3_prepare16_v2_Dart>('sqlite3_prepare16_v2');
typedef _sqlite3_prepare16_v2_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Void> zSql,
  Int32 nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<Void>> pzTail,
);
typedef _sqlite3_prepare16_v2_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Void> zSql,
  int nByte,
  Pointer<Pointer<sqlite3_stmt>> ppStmt,
  Pointer<Pointer<Void>> pzTail,
);

/// C function `sqlite3_sql`.

Pointer<Uint8> sqlite3_sql(
  Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_sql(pStmt);
}
final _sqlite3_sql_Dart _sqlite3_sql = _dl.lookupFunction<_sqlite3_sql_C, _sqlite3_sql_Dart>('sqlite3_sql');
typedef _sqlite3_sql_C = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_sql_Dart = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_stmt_readonly`.

int sqlite3_stmt_readonly(
  Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_stmt_readonly(pStmt);
}
final _sqlite3_stmt_readonly_Dart _sqlite3_stmt_readonly = _dl.lookupFunction<_sqlite3_stmt_readonly_C, _sqlite3_stmt_readonly_Dart>('sqlite3_stmt_readonly');
typedef _sqlite3_stmt_readonly_C = Int32 Function(
  Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_stmt_readonly_Dart = int Function(
  Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_bind_blob`.

int sqlite3_bind_blob(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  Pointer<Void> arg2,
  int n,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg4,
) {
  return   _sqlite3_bind_blob(arg0, arg1, arg2, n, arg4);
}
final _sqlite3_bind_blob_Dart _sqlite3_bind_blob = _dl.lookupFunction<_sqlite3_bind_blob_C, _sqlite3_bind_blob_Dart>('sqlite3_bind_blob');
typedef _sqlite3_bind_blob_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
  Pointer<Void> arg2,
  Int32 n,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg4,
);
typedef _sqlite3_bind_blob_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  Pointer<Void> arg2,
  int n,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg4,
);

/// C function `sqlite3_bind_double`.

int sqlite3_bind_double(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  double arg2,
) {
  return   _sqlite3_bind_double(arg0, arg1, arg2);
}
final _sqlite3_bind_double_Dart _sqlite3_bind_double = _dl.lookupFunction<_sqlite3_bind_double_C, _sqlite3_bind_double_Dart>('sqlite3_bind_double');
typedef _sqlite3_bind_double_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
  Double arg2,
);
typedef _sqlite3_bind_double_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  double arg2,
);

/// C function `sqlite3_bind_int`.

int sqlite3_bind_int(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  int arg2,
) {
  return   _sqlite3_bind_int(arg0, arg1, arg2);
}
final _sqlite3_bind_int_Dart _sqlite3_bind_int = _dl.lookupFunction<_sqlite3_bind_int_C, _sqlite3_bind_int_Dart>('sqlite3_bind_int');
typedef _sqlite3_bind_int_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
  Int32 arg2,
);
typedef _sqlite3_bind_int_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  int arg2,
);

/// C function `sqlite3_bind_int64`.

int sqlite3_bind_int64(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  int arg2,
) {
  return   _sqlite3_bind_int64(arg0, arg1, arg2);
}
final _sqlite3_bind_int64_Dart _sqlite3_bind_int64 = _dl.lookupFunction<_sqlite3_bind_int64_C, _sqlite3_bind_int64_Dart>('sqlite3_bind_int64');
typedef _sqlite3_bind_int64_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
  Int64 arg2,
);
typedef _sqlite3_bind_int64_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  int arg2,
);

/// C function `sqlite3_bind_null`.

int sqlite3_bind_null(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_bind_null(arg0, arg1);
}
final _sqlite3_bind_null_Dart _sqlite3_bind_null = _dl.lookupFunction<_sqlite3_bind_null_C, _sqlite3_bind_null_Dart>('sqlite3_bind_null');
typedef _sqlite3_bind_null_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
);
typedef _sqlite3_bind_null_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_bind_text`.

int sqlite3_bind_text(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  Pointer<Uint8> arg2,
  int n,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg4,
) {
  return   _sqlite3_bind_text(arg0, arg1, arg2, n, arg4);
}
final _sqlite3_bind_text_Dart _sqlite3_bind_text = _dl.lookupFunction<_sqlite3_bind_text_C, _sqlite3_bind_text_Dart>('sqlite3_bind_text');
typedef _sqlite3_bind_text_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
  Pointer<Uint8> arg2,
  Int32 n,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg4,
);
typedef _sqlite3_bind_text_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  Pointer<Uint8> arg2,
  int n,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg4,
);

/// C function `sqlite3_bind_text16`.

int sqlite3_bind_text16(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  Pointer<Void> arg2,
  int arg3,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg4,
) {
  return   _sqlite3_bind_text16(arg0, arg1, arg2, arg3, arg4);
}
final _sqlite3_bind_text16_Dart _sqlite3_bind_text16 = _dl.lookupFunction<_sqlite3_bind_text16_C, _sqlite3_bind_text16_Dart>('sqlite3_bind_text16');
typedef _sqlite3_bind_text16_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
  Pointer<Void> arg2,
  Int32 arg3,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg4,
);
typedef _sqlite3_bind_text16_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  Pointer<Void> arg2,
  int arg3,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg4,
);

/// C function `sqlite3_bind_value`.

int sqlite3_bind_value(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  Pointer<Mem> arg2,
) {
  return   _sqlite3_bind_value(arg0, arg1, arg2);
}
final _sqlite3_bind_value_Dart _sqlite3_bind_value = _dl.lookupFunction<_sqlite3_bind_value_C, _sqlite3_bind_value_Dart>('sqlite3_bind_value');
typedef _sqlite3_bind_value_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
  Pointer<Mem> arg2,
);
typedef _sqlite3_bind_value_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  Pointer<Mem> arg2,
);

/// C function `sqlite3_bind_zeroblob`.

int sqlite3_bind_zeroblob(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  int n,
) {
  return   _sqlite3_bind_zeroblob(arg0, arg1, n);
}
final _sqlite3_bind_zeroblob_Dart _sqlite3_bind_zeroblob = _dl.lookupFunction<_sqlite3_bind_zeroblob_C, _sqlite3_bind_zeroblob_Dart>('sqlite3_bind_zeroblob');
typedef _sqlite3_bind_zeroblob_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
  Int32 n,
);
typedef _sqlite3_bind_zeroblob_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
  int n,
);

/// C function `sqlite3_bind_parameter_count`.

int sqlite3_bind_parameter_count(
  Pointer<sqlite3_stmt> arg0,
) {
  return   _sqlite3_bind_parameter_count(arg0);
}
final _sqlite3_bind_parameter_count_Dart _sqlite3_bind_parameter_count = _dl.lookupFunction<_sqlite3_bind_parameter_count_C, _sqlite3_bind_parameter_count_Dart>('sqlite3_bind_parameter_count');
typedef _sqlite3_bind_parameter_count_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
);
typedef _sqlite3_bind_parameter_count_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
);

/// C function `sqlite3_bind_parameter_name`.

Pointer<Uint8> sqlite3_bind_parameter_name(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_bind_parameter_name(arg0, arg1);
}
final _sqlite3_bind_parameter_name_Dart _sqlite3_bind_parameter_name = _dl.lookupFunction<_sqlite3_bind_parameter_name_C, _sqlite3_bind_parameter_name_Dart>('sqlite3_bind_parameter_name');
typedef _sqlite3_bind_parameter_name_C = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
);
typedef _sqlite3_bind_parameter_name_Dart = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_bind_parameter_index`.

int sqlite3_bind_parameter_index(
  Pointer<sqlite3_stmt> arg0,
  Pointer<Uint8> zName,
) {
  return   _sqlite3_bind_parameter_index(arg0, zName);
}
final _sqlite3_bind_parameter_index_Dart _sqlite3_bind_parameter_index = _dl.lookupFunction<_sqlite3_bind_parameter_index_C, _sqlite3_bind_parameter_index_Dart>('sqlite3_bind_parameter_index');
typedef _sqlite3_bind_parameter_index_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Pointer<Uint8> zName,
);
typedef _sqlite3_bind_parameter_index_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  Pointer<Uint8> zName,
);

/// C function `sqlite3_clear_bindings`.

int sqlite3_clear_bindings(
  Pointer<sqlite3_stmt> arg0,
) {
  return   _sqlite3_clear_bindings(arg0);
}
final _sqlite3_clear_bindings_Dart _sqlite3_clear_bindings = _dl.lookupFunction<_sqlite3_clear_bindings_C, _sqlite3_clear_bindings_Dart>('sqlite3_clear_bindings');
typedef _sqlite3_clear_bindings_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
);
typedef _sqlite3_clear_bindings_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
);

/// C function `sqlite3_column_count`.

int sqlite3_column_count(
  Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_column_count(pStmt);
}
final _sqlite3_column_count_Dart _sqlite3_column_count = _dl.lookupFunction<_sqlite3_column_count_C, _sqlite3_column_count_Dart>('sqlite3_column_count');
typedef _sqlite3_column_count_C = Int32 Function(
  Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_column_count_Dart = int Function(
  Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_column_name`.

Pointer<Uint8> sqlite3_column_name(
  Pointer<sqlite3_stmt> arg0,
  int N,
) {
  return   _sqlite3_column_name(arg0, N);
}
final _sqlite3_column_name_Dart _sqlite3_column_name = _dl.lookupFunction<_sqlite3_column_name_C, _sqlite3_column_name_Dart>('sqlite3_column_name');
typedef _sqlite3_column_name_C = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 N,
);
typedef _sqlite3_column_name_Dart = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  int N,
);

/// C function `sqlite3_column_name16`.

Pointer<Void> sqlite3_column_name16(
  Pointer<sqlite3_stmt> arg0,
  int N,
) {
  return   _sqlite3_column_name16(arg0, N);
}
final _sqlite3_column_name16_Dart _sqlite3_column_name16 = _dl.lookupFunction<_sqlite3_column_name16_C, _sqlite3_column_name16_Dart>('sqlite3_column_name16');
typedef _sqlite3_column_name16_C = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 N,
);
typedef _sqlite3_column_name16_Dart = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  int N,
);

/// C function `sqlite3_column_database_name`.

Pointer<Uint8> sqlite3_column_database_name(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_database_name(arg0, arg1);
}
final _sqlite3_column_database_name_Dart _sqlite3_column_database_name = _dl.lookupFunction<_sqlite3_column_database_name_C, _sqlite3_column_database_name_Dart>('sqlite3_column_database_name');
typedef _sqlite3_column_database_name_C = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
);
typedef _sqlite3_column_database_name_Dart = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_database_name16`.

Pointer<Void> sqlite3_column_database_name16(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_database_name16(arg0, arg1);
}
final _sqlite3_column_database_name16_Dart _sqlite3_column_database_name16 = _dl.lookupFunction<_sqlite3_column_database_name16_C, _sqlite3_column_database_name16_Dart>('sqlite3_column_database_name16');
typedef _sqlite3_column_database_name16_C = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
);
typedef _sqlite3_column_database_name16_Dart = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_table_name`.

Pointer<Uint8> sqlite3_column_table_name(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_table_name(arg0, arg1);
}
final _sqlite3_column_table_name_Dart _sqlite3_column_table_name = _dl.lookupFunction<_sqlite3_column_table_name_C, _sqlite3_column_table_name_Dart>('sqlite3_column_table_name');
typedef _sqlite3_column_table_name_C = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
);
typedef _sqlite3_column_table_name_Dart = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_table_name16`.

Pointer<Void> sqlite3_column_table_name16(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_table_name16(arg0, arg1);
}
final _sqlite3_column_table_name16_Dart _sqlite3_column_table_name16 = _dl.lookupFunction<_sqlite3_column_table_name16_C, _sqlite3_column_table_name16_Dart>('sqlite3_column_table_name16');
typedef _sqlite3_column_table_name16_C = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
);
typedef _sqlite3_column_table_name16_Dart = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_origin_name`.

Pointer<Uint8> sqlite3_column_origin_name(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_origin_name(arg0, arg1);
}
final _sqlite3_column_origin_name_Dart _sqlite3_column_origin_name = _dl.lookupFunction<_sqlite3_column_origin_name_C, _sqlite3_column_origin_name_Dart>('sqlite3_column_origin_name');
typedef _sqlite3_column_origin_name_C = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
);
typedef _sqlite3_column_origin_name_Dart = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_origin_name16`.

Pointer<Void> sqlite3_column_origin_name16(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_origin_name16(arg0, arg1);
}
final _sqlite3_column_origin_name16_Dart _sqlite3_column_origin_name16 = _dl.lookupFunction<_sqlite3_column_origin_name16_C, _sqlite3_column_origin_name16_Dart>('sqlite3_column_origin_name16');
typedef _sqlite3_column_origin_name16_C = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
);
typedef _sqlite3_column_origin_name16_Dart = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_decltype`.

Pointer<Uint8> sqlite3_column_decltype(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_decltype(arg0, arg1);
}
final _sqlite3_column_decltype_Dart _sqlite3_column_decltype = _dl.lookupFunction<_sqlite3_column_decltype_C, _sqlite3_column_decltype_Dart>('sqlite3_column_decltype');
typedef _sqlite3_column_decltype_C = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
);
typedef _sqlite3_column_decltype_Dart = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_decltype16`.

Pointer<Void> sqlite3_column_decltype16(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_decltype16(arg0, arg1);
}
final _sqlite3_column_decltype16_Dart _sqlite3_column_decltype16 = _dl.lookupFunction<_sqlite3_column_decltype16_C, _sqlite3_column_decltype16_Dart>('sqlite3_column_decltype16');
typedef _sqlite3_column_decltype16_C = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 arg1,
);
typedef _sqlite3_column_decltype16_Dart = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_step`.

int sqlite3_step(
  Pointer<sqlite3_stmt> arg0,
) {
  return   _sqlite3_step(arg0);
}
final _sqlite3_step_Dart _sqlite3_step = _dl.lookupFunction<_sqlite3_step_C, _sqlite3_step_Dart>('sqlite3_step');
typedef _sqlite3_step_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
);
typedef _sqlite3_step_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
);

/// C function `sqlite3_data_count`.

int sqlite3_data_count(
  Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_data_count(pStmt);
}
final _sqlite3_data_count_Dart _sqlite3_data_count = _dl.lookupFunction<_sqlite3_data_count_C, _sqlite3_data_count_Dart>('sqlite3_data_count');
typedef _sqlite3_data_count_C = Int32 Function(
  Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_data_count_Dart = int Function(
  Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_column_blob`.

Pointer<Void> sqlite3_column_blob(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_blob(arg0, iCol);
}
final _sqlite3_column_blob_Dart _sqlite3_column_blob = _dl.lookupFunction<_sqlite3_column_blob_C, _sqlite3_column_blob_Dart>('sqlite3_column_blob');
typedef _sqlite3_column_blob_C = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 iCol,
);
typedef _sqlite3_column_blob_Dart = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_bytes`.

int sqlite3_column_bytes(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_bytes(arg0, iCol);
}
final _sqlite3_column_bytes_Dart _sqlite3_column_bytes = _dl.lookupFunction<_sqlite3_column_bytes_C, _sqlite3_column_bytes_Dart>('sqlite3_column_bytes');
typedef _sqlite3_column_bytes_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 iCol,
);
typedef _sqlite3_column_bytes_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_bytes16`.

int sqlite3_column_bytes16(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_bytes16(arg0, iCol);
}
final _sqlite3_column_bytes16_Dart _sqlite3_column_bytes16 = _dl.lookupFunction<_sqlite3_column_bytes16_C, _sqlite3_column_bytes16_Dart>('sqlite3_column_bytes16');
typedef _sqlite3_column_bytes16_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 iCol,
);
typedef _sqlite3_column_bytes16_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_double`.

double sqlite3_column_double(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_double(arg0, iCol);
}
final _sqlite3_column_double_Dart _sqlite3_column_double = _dl.lookupFunction<_sqlite3_column_double_C, _sqlite3_column_double_Dart>('sqlite3_column_double');
typedef _sqlite3_column_double_C = Double Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 iCol,
);
typedef _sqlite3_column_double_Dart = double Function(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_int`.

int sqlite3_column_int(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_int(arg0, iCol);
}
final _sqlite3_column_int_Dart _sqlite3_column_int = _dl.lookupFunction<_sqlite3_column_int_C, _sqlite3_column_int_Dart>('sqlite3_column_int');
typedef _sqlite3_column_int_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 iCol,
);
typedef _sqlite3_column_int_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_int64`.

int sqlite3_column_int64(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_int64(arg0, iCol);
}
final _sqlite3_column_int64_Dart _sqlite3_column_int64 = _dl.lookupFunction<_sqlite3_column_int64_C, _sqlite3_column_int64_Dart>('sqlite3_column_int64');
typedef _sqlite3_column_int64_C = Int64 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 iCol,
);
typedef _sqlite3_column_int64_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_text`.

Pointer<Uint8> sqlite3_column_text(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_text(arg0, iCol);
}
final _sqlite3_column_text_Dart _sqlite3_column_text = _dl.lookupFunction<_sqlite3_column_text_C, _sqlite3_column_text_Dart>('sqlite3_column_text');
typedef _sqlite3_column_text_C = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 iCol,
);
typedef _sqlite3_column_text_Dart = Pointer<Uint8> Function(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_text16`.

Pointer<Void> sqlite3_column_text16(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_text16(arg0, iCol);
}
final _sqlite3_column_text16_Dart _sqlite3_column_text16 = _dl.lookupFunction<_sqlite3_column_text16_C, _sqlite3_column_text16_Dart>('sqlite3_column_text16');
typedef _sqlite3_column_text16_C = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 iCol,
);
typedef _sqlite3_column_text16_Dart = Pointer<Void> Function(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_type`.

int sqlite3_column_type(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_type(arg0, iCol);
}
final _sqlite3_column_type_Dart _sqlite3_column_type = _dl.lookupFunction<_sqlite3_column_type_C, _sqlite3_column_type_Dart>('sqlite3_column_type');
typedef _sqlite3_column_type_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 iCol,
);
typedef _sqlite3_column_type_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_value`.

Pointer<Mem> sqlite3_column_value(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_value(arg0, iCol);
}
final _sqlite3_column_value_Dart _sqlite3_column_value = _dl.lookupFunction<_sqlite3_column_value_C, _sqlite3_column_value_Dart>('sqlite3_column_value');
typedef _sqlite3_column_value_C = Pointer<Mem> Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 iCol,
);
typedef _sqlite3_column_value_Dart = Pointer<Mem> Function(
  Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_finalize`.

int sqlite3_finalize(
  Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_finalize(pStmt);
}
final _sqlite3_finalize_Dart _sqlite3_finalize = _dl.lookupFunction<_sqlite3_finalize_C, _sqlite3_finalize_Dart>('sqlite3_finalize');
typedef _sqlite3_finalize_C = Int32 Function(
  Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_finalize_Dart = int Function(
  Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_reset`.

int sqlite3_reset(
  Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_reset(pStmt);
}
final _sqlite3_reset_Dart _sqlite3_reset = _dl.lookupFunction<_sqlite3_reset_C, _sqlite3_reset_Dart>('sqlite3_reset');
typedef _sqlite3_reset_C = Int32 Function(
  Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_reset_Dart = int Function(
  Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_create_function`.

int sqlite3_create_function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zFunctionName,
  int nArg,
  int eTextRep,
  Pointer<Void> pApp,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xFunc,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xStep,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>)>> xFinal,
) {
  return   _sqlite3_create_function(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal);
}
final _sqlite3_create_function_Dart _sqlite3_create_function = _dl.lookupFunction<_sqlite3_create_function_C, _sqlite3_create_function_Dart>('sqlite3_create_function');
typedef _sqlite3_create_function_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zFunctionName,
  Int32 nArg,
  Int32 eTextRep,
  Pointer<Void> pApp,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xFunc,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xStep,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>)>> xFinal,
);
typedef _sqlite3_create_function_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zFunctionName,
  int nArg,
  int eTextRep,
  Pointer<Void> pApp,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xFunc,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xStep,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>)>> xFinal,
);

/// C function `sqlite3_create_function16`.

int sqlite3_create_function16(
  Pointer<sqlite3> db,
  Pointer<Void> zFunctionName,
  int nArg,
  int eTextRep,
  Pointer<Void> pApp,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xFunc,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xStep,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>)>> xFinal,
) {
  return   _sqlite3_create_function16(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal);
}
final _sqlite3_create_function16_Dart _sqlite3_create_function16 = _dl.lookupFunction<_sqlite3_create_function16_C, _sqlite3_create_function16_Dart>('sqlite3_create_function16');
typedef _sqlite3_create_function16_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Void> zFunctionName,
  Int32 nArg,
  Int32 eTextRep,
  Pointer<Void> pApp,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xFunc,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xStep,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>)>> xFinal,
);
typedef _sqlite3_create_function16_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Void> zFunctionName,
  int nArg,
  int eTextRep,
  Pointer<Void> pApp,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xFunc,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xStep,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>)>> xFinal,
);

/// C function `sqlite3_create_function_v2`.

int sqlite3_create_function_v2(
  Pointer<sqlite3> db,
  Pointer<Uint8> zFunctionName,
  int nArg,
  int eTextRep,
  Pointer<Void> pApp,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xFunc,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xStep,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>)>> xFinal,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> xDestroy,
) {
  return   _sqlite3_create_function_v2(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal, xDestroy);
}
final _sqlite3_create_function_v2_Dart _sqlite3_create_function_v2 = _dl.lookupFunction<_sqlite3_create_function_v2_C, _sqlite3_create_function_v2_Dart>('sqlite3_create_function_v2');
typedef _sqlite3_create_function_v2_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zFunctionName,
  Int32 nArg,
  Int32 eTextRep,
  Pointer<Void> pApp,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xFunc,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xStep,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>)>> xFinal,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> xDestroy,
);
typedef _sqlite3_create_function_v2_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zFunctionName,
  int nArg,
  int eTextRep,
  Pointer<Void> pApp,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xFunc,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>, Int32, Pointer<Pointer<Mem>>)>> xStep,
  Pointer<NativeFunction<void Function(Pointer<sqlite3_context>)>> xFinal,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> xDestroy,
);

/// C function `sqlite3_aggregate_count`.

int sqlite3_aggregate_count(
  Pointer<sqlite3_context> arg0,
) {
  return   _sqlite3_aggregate_count(arg0);
}
final _sqlite3_aggregate_count_Dart _sqlite3_aggregate_count = _dl.lookupFunction<_sqlite3_aggregate_count_C, _sqlite3_aggregate_count_Dart>('sqlite3_aggregate_count');
typedef _sqlite3_aggregate_count_C = Int32 Function(
  Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_aggregate_count_Dart = int Function(
  Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_expired`.

int sqlite3_expired(
  Pointer<sqlite3_stmt> arg0,
) {
  return   _sqlite3_expired(arg0);
}
final _sqlite3_expired_Dart _sqlite3_expired = _dl.lookupFunction<_sqlite3_expired_C, _sqlite3_expired_Dart>('sqlite3_expired');
typedef _sqlite3_expired_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
);
typedef _sqlite3_expired_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
);

/// C function `sqlite3_transfer_bindings`.

int sqlite3_transfer_bindings(
  Pointer<sqlite3_stmt> arg0,
  Pointer<sqlite3_stmt> arg1,
) {
  return   _sqlite3_transfer_bindings(arg0, arg1);
}
final _sqlite3_transfer_bindings_Dart _sqlite3_transfer_bindings = _dl.lookupFunction<_sqlite3_transfer_bindings_C, _sqlite3_transfer_bindings_Dart>('sqlite3_transfer_bindings');
typedef _sqlite3_transfer_bindings_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Pointer<sqlite3_stmt> arg1,
);
typedef _sqlite3_transfer_bindings_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  Pointer<sqlite3_stmt> arg1,
);

/// C function `sqlite3_global_recover`.

int sqlite3_global_recover() {
  return   _sqlite3_global_recover();
}
final _sqlite3_global_recover_Dart _sqlite3_global_recover = _dl.lookupFunction<_sqlite3_global_recover_C, _sqlite3_global_recover_Dart>('sqlite3_global_recover');
typedef _sqlite3_global_recover_C = Int32 Function();
typedef _sqlite3_global_recover_Dart = int Function();

/// C function `sqlite3_thread_cleanup`.

void sqlite3_thread_cleanup() {
   _sqlite3_thread_cleanup();
}
final _sqlite3_thread_cleanup_Dart _sqlite3_thread_cleanup = _dl.lookupFunction<_sqlite3_thread_cleanup_C, _sqlite3_thread_cleanup_Dart>('sqlite3_thread_cleanup');
typedef _sqlite3_thread_cleanup_C = Void Function();
typedef _sqlite3_thread_cleanup_Dart = void Function();

/// C function `sqlite3_memory_alarm`.

int sqlite3_memory_alarm(
  Pointer<NativeFunction<void Function(Pointer<Void>, Int64, Int32)>> arg0,
  Pointer<Void> arg1,
  int arg2,
) {
  return   _sqlite3_memory_alarm(arg0, arg1, arg2);
}
final _sqlite3_memory_alarm_Dart _sqlite3_memory_alarm = _dl.lookupFunction<_sqlite3_memory_alarm_C, _sqlite3_memory_alarm_Dart>('sqlite3_memory_alarm');
typedef _sqlite3_memory_alarm_C = Int32 Function(
  Pointer<NativeFunction<void Function(Pointer<Void>, Int64, Int32)>> arg0,
  Pointer<Void> arg1,
  Int64 arg2,
);
typedef _sqlite3_memory_alarm_Dart = int Function(
  Pointer<NativeFunction<void Function(Pointer<Void>, Int64, Int32)>> arg0,
  Pointer<Void> arg1,
  int arg2,
);

/// C function `sqlite3_value_blob`.

Pointer<Void> sqlite3_value_blob(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_blob(arg0);
}
final _sqlite3_value_blob_Dart _sqlite3_value_blob = _dl.lookupFunction<_sqlite3_value_blob_C, _sqlite3_value_blob_Dart>('sqlite3_value_blob');
typedef _sqlite3_value_blob_C = Pointer<Void> Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_blob_Dart = Pointer<Void> Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_bytes`.

int sqlite3_value_bytes(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_bytes(arg0);
}
final _sqlite3_value_bytes_Dart _sqlite3_value_bytes = _dl.lookupFunction<_sqlite3_value_bytes_C, _sqlite3_value_bytes_Dart>('sqlite3_value_bytes');
typedef _sqlite3_value_bytes_C = Int32 Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_bytes_Dart = int Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_bytes16`.

int sqlite3_value_bytes16(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_bytes16(arg0);
}
final _sqlite3_value_bytes16_Dart _sqlite3_value_bytes16 = _dl.lookupFunction<_sqlite3_value_bytes16_C, _sqlite3_value_bytes16_Dart>('sqlite3_value_bytes16');
typedef _sqlite3_value_bytes16_C = Int32 Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_bytes16_Dart = int Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_double`.

double sqlite3_value_double(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_double(arg0);
}
final _sqlite3_value_double_Dart _sqlite3_value_double = _dl.lookupFunction<_sqlite3_value_double_C, _sqlite3_value_double_Dart>('sqlite3_value_double');
typedef _sqlite3_value_double_C = Double Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_double_Dart = double Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_int`.

int sqlite3_value_int(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_int(arg0);
}
final _sqlite3_value_int_Dart _sqlite3_value_int = _dl.lookupFunction<_sqlite3_value_int_C, _sqlite3_value_int_Dart>('sqlite3_value_int');
typedef _sqlite3_value_int_C = Int32 Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_int_Dart = int Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_int64`.

int sqlite3_value_int64(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_int64(arg0);
}
final _sqlite3_value_int64_Dart _sqlite3_value_int64 = _dl.lookupFunction<_sqlite3_value_int64_C, _sqlite3_value_int64_Dart>('sqlite3_value_int64');
typedef _sqlite3_value_int64_C = Int64 Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_int64_Dart = int Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_text`.

Pointer<Uint8> sqlite3_value_text(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_text(arg0);
}
final _sqlite3_value_text_Dart _sqlite3_value_text = _dl.lookupFunction<_sqlite3_value_text_C, _sqlite3_value_text_Dart>('sqlite3_value_text');
typedef _sqlite3_value_text_C = Pointer<Uint8> Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_text_Dart = Pointer<Uint8> Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_text16`.

Pointer<Void> sqlite3_value_text16(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_text16(arg0);
}
final _sqlite3_value_text16_Dart _sqlite3_value_text16 = _dl.lookupFunction<_sqlite3_value_text16_C, _sqlite3_value_text16_Dart>('sqlite3_value_text16');
typedef _sqlite3_value_text16_C = Pointer<Void> Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_text16_Dart = Pointer<Void> Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_text16le`.

Pointer<Void> sqlite3_value_text16le(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_text16le(arg0);
}
final _sqlite3_value_text16le_Dart _sqlite3_value_text16le = _dl.lookupFunction<_sqlite3_value_text16le_C, _sqlite3_value_text16le_Dart>('sqlite3_value_text16le');
typedef _sqlite3_value_text16le_C = Pointer<Void> Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_text16le_Dart = Pointer<Void> Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_text16be`.

Pointer<Void> sqlite3_value_text16be(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_text16be(arg0);
}
final _sqlite3_value_text16be_Dart _sqlite3_value_text16be = _dl.lookupFunction<_sqlite3_value_text16be_C, _sqlite3_value_text16be_Dart>('sqlite3_value_text16be');
typedef _sqlite3_value_text16be_C = Pointer<Void> Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_text16be_Dart = Pointer<Void> Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_type`.

int sqlite3_value_type(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_type(arg0);
}
final _sqlite3_value_type_Dart _sqlite3_value_type = _dl.lookupFunction<_sqlite3_value_type_C, _sqlite3_value_type_Dart>('sqlite3_value_type');
typedef _sqlite3_value_type_C = Int32 Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_type_Dart = int Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_value_numeric_type`.

int sqlite3_value_numeric_type(
  Pointer<Mem> arg0,
) {
  return   _sqlite3_value_numeric_type(arg0);
}
final _sqlite3_value_numeric_type_Dart _sqlite3_value_numeric_type = _dl.lookupFunction<_sqlite3_value_numeric_type_C, _sqlite3_value_numeric_type_Dart>('sqlite3_value_numeric_type');
typedef _sqlite3_value_numeric_type_C = Int32 Function(
  Pointer<Mem> arg0,
);
typedef _sqlite3_value_numeric_type_Dart = int Function(
  Pointer<Mem> arg0,
);

/// C function `sqlite3_aggregate_context`.

Pointer<Void> sqlite3_aggregate_context(
  Pointer<sqlite3_context> arg0,
  int nBytes,
) {
  return   _sqlite3_aggregate_context(arg0, nBytes);
}
final _sqlite3_aggregate_context_Dart _sqlite3_aggregate_context = _dl.lookupFunction<_sqlite3_aggregate_context_C, _sqlite3_aggregate_context_Dart>('sqlite3_aggregate_context');
typedef _sqlite3_aggregate_context_C = Pointer<Void> Function(
  Pointer<sqlite3_context> arg0,
  Int32 nBytes,
);
typedef _sqlite3_aggregate_context_Dart = Pointer<Void> Function(
  Pointer<sqlite3_context> arg0,
  int nBytes,
);

/// C function `sqlite3_user_data`.

Pointer<Void> sqlite3_user_data(
  Pointer<sqlite3_context> arg0,
) {
  return   _sqlite3_user_data(arg0);
}
final _sqlite3_user_data_Dart _sqlite3_user_data = _dl.lookupFunction<_sqlite3_user_data_C, _sqlite3_user_data_Dart>('sqlite3_user_data');
typedef _sqlite3_user_data_C = Pointer<Void> Function(
  Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_user_data_Dart = Pointer<Void> Function(
  Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_context_db_handle`.

Pointer<sqlite3> sqlite3_context_db_handle(
  Pointer<sqlite3_context> arg0,
) {
  return   _sqlite3_context_db_handle(arg0);
}
final _sqlite3_context_db_handle_Dart _sqlite3_context_db_handle = _dl.lookupFunction<_sqlite3_context_db_handle_C, _sqlite3_context_db_handle_Dart>('sqlite3_context_db_handle');
typedef _sqlite3_context_db_handle_C = Pointer<sqlite3> Function(
  Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_context_db_handle_Dart = Pointer<sqlite3> Function(
  Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_get_auxdata`.

Pointer<Void> sqlite3_get_auxdata(
  Pointer<sqlite3_context> arg0,
  int N,
) {
  return   _sqlite3_get_auxdata(arg0, N);
}
final _sqlite3_get_auxdata_Dart _sqlite3_get_auxdata = _dl.lookupFunction<_sqlite3_get_auxdata_C, _sqlite3_get_auxdata_Dart>('sqlite3_get_auxdata');
typedef _sqlite3_get_auxdata_C = Pointer<Void> Function(
  Pointer<sqlite3_context> arg0,
  Int32 N,
);
typedef _sqlite3_get_auxdata_Dart = Pointer<Void> Function(
  Pointer<sqlite3_context> arg0,
  int N,
);

/// C function `sqlite3_set_auxdata`.

void sqlite3_set_auxdata(
  Pointer<sqlite3_context> arg0,
  int N,
  Pointer<Void> arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
) {
   _sqlite3_set_auxdata(arg0, N, arg2, arg3);
}
final _sqlite3_set_auxdata_Dart _sqlite3_set_auxdata = _dl.lookupFunction<_sqlite3_set_auxdata_C, _sqlite3_set_auxdata_Dart>('sqlite3_set_auxdata');
typedef _sqlite3_set_auxdata_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Int32 N,
  Pointer<Void> arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);
typedef _sqlite3_set_auxdata_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  int N,
  Pointer<Void> arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);

/// C function `sqlite3_result_blob`.

void sqlite3_result_blob(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  int arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
) {
   _sqlite3_result_blob(arg0, arg1, arg2, arg3);
}
final _sqlite3_result_blob_Dart _sqlite3_result_blob = _dl.lookupFunction<_sqlite3_result_blob_C, _sqlite3_result_blob_Dart>('sqlite3_result_blob');
typedef _sqlite3_result_blob_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  Int32 arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);
typedef _sqlite3_result_blob_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  int arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);

/// C function `sqlite3_result_double`.

void sqlite3_result_double(
  Pointer<sqlite3_context> arg0,
  double arg1,
) {
   _sqlite3_result_double(arg0, arg1);
}
final _sqlite3_result_double_Dart _sqlite3_result_double = _dl.lookupFunction<_sqlite3_result_double_C, _sqlite3_result_double_Dart>('sqlite3_result_double');
typedef _sqlite3_result_double_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Double arg1,
);
typedef _sqlite3_result_double_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  double arg1,
);

/// C function `sqlite3_result_error`.

void sqlite3_result_error(
  Pointer<sqlite3_context> arg0,
  Pointer<Uint8> arg1,
  int arg2,
) {
   _sqlite3_result_error(arg0, arg1, arg2);
}
final _sqlite3_result_error_Dart _sqlite3_result_error = _dl.lookupFunction<_sqlite3_result_error_C, _sqlite3_result_error_Dart>('sqlite3_result_error');
typedef _sqlite3_result_error_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Uint8> arg1,
  Int32 arg2,
);
typedef _sqlite3_result_error_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Uint8> arg1,
  int arg2,
);

/// C function `sqlite3_result_error16`.

void sqlite3_result_error16(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  int arg2,
) {
   _sqlite3_result_error16(arg0, arg1, arg2);
}
final _sqlite3_result_error16_Dart _sqlite3_result_error16 = _dl.lookupFunction<_sqlite3_result_error16_C, _sqlite3_result_error16_Dart>('sqlite3_result_error16');
typedef _sqlite3_result_error16_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  Int32 arg2,
);
typedef _sqlite3_result_error16_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  int arg2,
);

/// C function `sqlite3_result_error_toobig`.

void sqlite3_result_error_toobig(
  Pointer<sqlite3_context> arg0,
) {
   _sqlite3_result_error_toobig(arg0);
}
final _sqlite3_result_error_toobig_Dart _sqlite3_result_error_toobig = _dl.lookupFunction<_sqlite3_result_error_toobig_C, _sqlite3_result_error_toobig_Dart>('sqlite3_result_error_toobig');
typedef _sqlite3_result_error_toobig_C = Void Function(
  Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_result_error_toobig_Dart = void Function(
  Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_result_error_nomem`.

void sqlite3_result_error_nomem(
  Pointer<sqlite3_context> arg0,
) {
   _sqlite3_result_error_nomem(arg0);
}
final _sqlite3_result_error_nomem_Dart _sqlite3_result_error_nomem = _dl.lookupFunction<_sqlite3_result_error_nomem_C, _sqlite3_result_error_nomem_Dart>('sqlite3_result_error_nomem');
typedef _sqlite3_result_error_nomem_C = Void Function(
  Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_result_error_nomem_Dart = void Function(
  Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_result_error_code`.

void sqlite3_result_error_code(
  Pointer<sqlite3_context> arg0,
  int arg1,
) {
   _sqlite3_result_error_code(arg0, arg1);
}
final _sqlite3_result_error_code_Dart _sqlite3_result_error_code = _dl.lookupFunction<_sqlite3_result_error_code_C, _sqlite3_result_error_code_Dart>('sqlite3_result_error_code');
typedef _sqlite3_result_error_code_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Int32 arg1,
);
typedef _sqlite3_result_error_code_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  int arg1,
);

/// C function `sqlite3_result_int`.

void sqlite3_result_int(
  Pointer<sqlite3_context> arg0,
  int arg1,
) {
   _sqlite3_result_int(arg0, arg1);
}
final _sqlite3_result_int_Dart _sqlite3_result_int = _dl.lookupFunction<_sqlite3_result_int_C, _sqlite3_result_int_Dart>('sqlite3_result_int');
typedef _sqlite3_result_int_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Int32 arg1,
);
typedef _sqlite3_result_int_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  int arg1,
);

/// C function `sqlite3_result_int64`.

void sqlite3_result_int64(
  Pointer<sqlite3_context> arg0,
  int arg1,
) {
   _sqlite3_result_int64(arg0, arg1);
}
final _sqlite3_result_int64_Dart _sqlite3_result_int64 = _dl.lookupFunction<_sqlite3_result_int64_C, _sqlite3_result_int64_Dart>('sqlite3_result_int64');
typedef _sqlite3_result_int64_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Int64 arg1,
);
typedef _sqlite3_result_int64_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  int arg1,
);

/// C function `sqlite3_result_null`.

void sqlite3_result_null(
  Pointer<sqlite3_context> arg0,
) {
   _sqlite3_result_null(arg0);
}
final _sqlite3_result_null_Dart _sqlite3_result_null = _dl.lookupFunction<_sqlite3_result_null_C, _sqlite3_result_null_Dart>('sqlite3_result_null');
typedef _sqlite3_result_null_C = Void Function(
  Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_result_null_Dart = void Function(
  Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_result_text`.

void sqlite3_result_text(
  Pointer<sqlite3_context> arg0,
  Pointer<Uint8> arg1,
  int arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
) {
   _sqlite3_result_text(arg0, arg1, arg2, arg3);
}
final _sqlite3_result_text_Dart _sqlite3_result_text = _dl.lookupFunction<_sqlite3_result_text_C, _sqlite3_result_text_Dart>('sqlite3_result_text');
typedef _sqlite3_result_text_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Uint8> arg1,
  Int32 arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);
typedef _sqlite3_result_text_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Uint8> arg1,
  int arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);

/// C function `sqlite3_result_text16`.

void sqlite3_result_text16(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  int arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
) {
   _sqlite3_result_text16(arg0, arg1, arg2, arg3);
}
final _sqlite3_result_text16_Dart _sqlite3_result_text16 = _dl.lookupFunction<_sqlite3_result_text16_C, _sqlite3_result_text16_Dart>('sqlite3_result_text16');
typedef _sqlite3_result_text16_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  Int32 arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);
typedef _sqlite3_result_text16_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  int arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);

/// C function `sqlite3_result_text16le`.

void sqlite3_result_text16le(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  int arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
) {
   _sqlite3_result_text16le(arg0, arg1, arg2, arg3);
}
final _sqlite3_result_text16le_Dart _sqlite3_result_text16le = _dl.lookupFunction<_sqlite3_result_text16le_C, _sqlite3_result_text16le_Dart>('sqlite3_result_text16le');
typedef _sqlite3_result_text16le_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  Int32 arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);
typedef _sqlite3_result_text16le_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  int arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);

/// C function `sqlite3_result_text16be`.

void sqlite3_result_text16be(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  int arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
) {
   _sqlite3_result_text16be(arg0, arg1, arg2, arg3);
}
final _sqlite3_result_text16be_Dart _sqlite3_result_text16be = _dl.lookupFunction<_sqlite3_result_text16be_C, _sqlite3_result_text16be_Dart>('sqlite3_result_text16be');
typedef _sqlite3_result_text16be_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  Int32 arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);
typedef _sqlite3_result_text16be_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Void> arg1,
  int arg2,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg3,
);

/// C function `sqlite3_result_value`.

void sqlite3_result_value(
  Pointer<sqlite3_context> arg0,
  Pointer<Mem> arg1,
) {
   _sqlite3_result_value(arg0, arg1);
}
final _sqlite3_result_value_Dart _sqlite3_result_value = _dl.lookupFunction<_sqlite3_result_value_C, _sqlite3_result_value_Dart>('sqlite3_result_value');
typedef _sqlite3_result_value_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Mem> arg1,
);
typedef _sqlite3_result_value_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  Pointer<Mem> arg1,
);

/// C function `sqlite3_result_zeroblob`.

void sqlite3_result_zeroblob(
  Pointer<sqlite3_context> arg0,
  int n,
) {
   _sqlite3_result_zeroblob(arg0, n);
}
final _sqlite3_result_zeroblob_Dart _sqlite3_result_zeroblob = _dl.lookupFunction<_sqlite3_result_zeroblob_C, _sqlite3_result_zeroblob_Dart>('sqlite3_result_zeroblob');
typedef _sqlite3_result_zeroblob_C = Void Function(
  Pointer<sqlite3_context> arg0,
  Int32 n,
);
typedef _sqlite3_result_zeroblob_Dart = void Function(
  Pointer<sqlite3_context> arg0,
  int n,
);

/// C function `sqlite3_create_collation`.

int sqlite3_create_collation(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zName,
  int eTextRep,
  Pointer<Void> pArg,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Pointer<Void>)>> xCompare,
) {
  return   _sqlite3_create_collation(arg0, zName, eTextRep, pArg, xCompare);
}
final _sqlite3_create_collation_Dart _sqlite3_create_collation = _dl.lookupFunction<_sqlite3_create_collation_C, _sqlite3_create_collation_Dart>('sqlite3_create_collation');
typedef _sqlite3_create_collation_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zName,
  Int32 eTextRep,
  Pointer<Void> pArg,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Pointer<Void>)>> xCompare,
);
typedef _sqlite3_create_collation_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zName,
  int eTextRep,
  Pointer<Void> pArg,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Pointer<Void>)>> xCompare,
);

/// C function `sqlite3_create_collation_v2`.

int sqlite3_create_collation_v2(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zName,
  int eTextRep,
  Pointer<Void> pArg,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Pointer<Void>)>> xCompare,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> xDestroy,
) {
  return   _sqlite3_create_collation_v2(arg0, zName, eTextRep, pArg, xCompare, xDestroy);
}
final _sqlite3_create_collation_v2_Dart _sqlite3_create_collation_v2 = _dl.lookupFunction<_sqlite3_create_collation_v2_C, _sqlite3_create_collation_v2_Dart>('sqlite3_create_collation_v2');
typedef _sqlite3_create_collation_v2_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zName,
  Int32 eTextRep,
  Pointer<Void> pArg,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Pointer<Void>)>> xCompare,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> xDestroy,
);
typedef _sqlite3_create_collation_v2_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zName,
  int eTextRep,
  Pointer<Void> pArg,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Pointer<Void>)>> xCompare,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> xDestroy,
);

/// C function `sqlite3_create_collation16`.

int sqlite3_create_collation16(
  Pointer<sqlite3> arg0,
  Pointer<Void> zName,
  int eTextRep,
  Pointer<Void> pArg,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Pointer<Void>)>> xCompare,
) {
  return   _sqlite3_create_collation16(arg0, zName, eTextRep, pArg, xCompare);
}
final _sqlite3_create_collation16_Dart _sqlite3_create_collation16 = _dl.lookupFunction<_sqlite3_create_collation16_C, _sqlite3_create_collation16_Dart>('sqlite3_create_collation16');
typedef _sqlite3_create_collation16_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<Void> zName,
  Int32 eTextRep,
  Pointer<Void> pArg,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Pointer<Void>)>> xCompare,
);
typedef _sqlite3_create_collation16_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<Void> zName,
  int eTextRep,
  Pointer<Void> pArg,
  Pointer<NativeFunction<int Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Pointer<Void>)>> xCompare,
);

/// C function `sqlite3_collation_needed`.

int sqlite3_collation_needed(
  Pointer<sqlite3> arg0,
  Pointer<Void> arg1,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<sqlite3>, Int32, Pointer<Uint8>)>> arg2,
) {
  return   _sqlite3_collation_needed(arg0, arg1, arg2);
}
final _sqlite3_collation_needed_Dart _sqlite3_collation_needed = _dl.lookupFunction<_sqlite3_collation_needed_C, _sqlite3_collation_needed_Dart>('sqlite3_collation_needed');
typedef _sqlite3_collation_needed_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<Void> arg1,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<sqlite3>, Int32, Pointer<Uint8>)>> arg2,
);
typedef _sqlite3_collation_needed_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<Void> arg1,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<sqlite3>, Int32, Pointer<Uint8>)>> arg2,
);

/// C function `sqlite3_collation_needed16`.

int sqlite3_collation_needed16(
  Pointer<sqlite3> arg0,
  Pointer<Void> arg1,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<sqlite3>, Int32, Pointer<Void>)>> arg2,
) {
  return   _sqlite3_collation_needed16(arg0, arg1, arg2);
}
final _sqlite3_collation_needed16_Dart _sqlite3_collation_needed16 = _dl.lookupFunction<_sqlite3_collation_needed16_C, _sqlite3_collation_needed16_Dart>('sqlite3_collation_needed16');
typedef _sqlite3_collation_needed16_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<Void> arg1,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<sqlite3>, Int32, Pointer<Void>)>> arg2,
);
typedef _sqlite3_collation_needed16_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<Void> arg1,
  Pointer<NativeFunction<void Function(Pointer<Void>, Pointer<sqlite3>, Int32, Pointer<Void>)>> arg2,
);

/// C function `sqlite3_sleep`.

int sqlite3_sleep(
  int arg0,
) {
  return   _sqlite3_sleep(arg0);
}
final _sqlite3_sleep_Dart _sqlite3_sleep = _dl.lookupFunction<_sqlite3_sleep_C, _sqlite3_sleep_Dart>('sqlite3_sleep');
typedef _sqlite3_sleep_C = Int32 Function(
  Int32 arg0,
);
typedef _sqlite3_sleep_Dart = int Function(
  int arg0,
);

/// C function `sqlite3_get_autocommit`.

int sqlite3_get_autocommit(
  Pointer<sqlite3> arg0,
) {
  return   _sqlite3_get_autocommit(arg0);
}
final _sqlite3_get_autocommit_Dart _sqlite3_get_autocommit = _dl.lookupFunction<_sqlite3_get_autocommit_C, _sqlite3_get_autocommit_Dart>('sqlite3_get_autocommit');
typedef _sqlite3_get_autocommit_C = Int32 Function(
  Pointer<sqlite3> arg0,
);
typedef _sqlite3_get_autocommit_Dart = int Function(
  Pointer<sqlite3> arg0,
);

/// C function `sqlite3_db_handle`.

Pointer<sqlite3> sqlite3_db_handle(
  Pointer<sqlite3_stmt> arg0,
) {
  return   _sqlite3_db_handle(arg0);
}
final _sqlite3_db_handle_Dart _sqlite3_db_handle = _dl.lookupFunction<_sqlite3_db_handle_C, _sqlite3_db_handle_Dart>('sqlite3_db_handle');
typedef _sqlite3_db_handle_C = Pointer<sqlite3> Function(
  Pointer<sqlite3_stmt> arg0,
);
typedef _sqlite3_db_handle_Dart = Pointer<sqlite3> Function(
  Pointer<sqlite3_stmt> arg0,
);

/// C function `sqlite3_next_stmt`.

Pointer<sqlite3_stmt> sqlite3_next_stmt(
  Pointer<sqlite3> pDb,
  Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_next_stmt(pDb, pStmt);
}
final _sqlite3_next_stmt_Dart _sqlite3_next_stmt = _dl.lookupFunction<_sqlite3_next_stmt_C, _sqlite3_next_stmt_Dart>('sqlite3_next_stmt');
typedef _sqlite3_next_stmt_C = Pointer<sqlite3_stmt> Function(
  Pointer<sqlite3> pDb,
  Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_next_stmt_Dart = Pointer<sqlite3_stmt> Function(
  Pointer<sqlite3> pDb,
  Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_commit_hook`.

Pointer<Void> sqlite3_commit_hook(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>)>> arg1,
  Pointer<Void> arg2,
) {
  return   _sqlite3_commit_hook(arg0, arg1, arg2);
}
final _sqlite3_commit_hook_Dart _sqlite3_commit_hook = _dl.lookupFunction<_sqlite3_commit_hook_C, _sqlite3_commit_hook_Dart>('sqlite3_commit_hook');
typedef _sqlite3_commit_hook_C = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>)>> arg1,
  Pointer<Void> arg2,
);
typedef _sqlite3_commit_hook_Dart = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>)>> arg1,
  Pointer<Void> arg2,
);

/// C function `sqlite3_rollback_hook`.

Pointer<Void> sqlite3_rollback_hook(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg1,
  Pointer<Void> arg2,
) {
  return   _sqlite3_rollback_hook(arg0, arg1, arg2);
}
final _sqlite3_rollback_hook_Dart _sqlite3_rollback_hook = _dl.lookupFunction<_sqlite3_rollback_hook_C, _sqlite3_rollback_hook_Dart>('sqlite3_rollback_hook');
typedef _sqlite3_rollback_hook_C = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg1,
  Pointer<Void> arg2,
);
typedef _sqlite3_rollback_hook_Dart = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> arg1,
  Pointer<Void> arg2,
);

/// C function `sqlite3_update_hook`.

Pointer<Void> sqlite3_update_hook(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>, Int32, Pointer<Uint8>, Pointer<Uint8>, Int64)>> arg1,
  Pointer<Void> arg2,
) {
  return   _sqlite3_update_hook(arg0, arg1, arg2);
}
final _sqlite3_update_hook_Dart _sqlite3_update_hook = _dl.lookupFunction<_sqlite3_update_hook_C, _sqlite3_update_hook_Dart>('sqlite3_update_hook');
typedef _sqlite3_update_hook_C = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>, Int32, Pointer<Uint8>, Pointer<Uint8>, Int64)>> arg1,
  Pointer<Void> arg2,
);
typedef _sqlite3_update_hook_Dart = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<void Function(Pointer<Void>, Int32, Pointer<Uint8>, Pointer<Uint8>, Int64)>> arg1,
  Pointer<Void> arg2,
);

/// C function `sqlite3_enable_shared_cache`.

int sqlite3_enable_shared_cache(
  int arg0,
) {
  return   _sqlite3_enable_shared_cache(arg0);
}
final _sqlite3_enable_shared_cache_Dart _sqlite3_enable_shared_cache = _dl.lookupFunction<_sqlite3_enable_shared_cache_C, _sqlite3_enable_shared_cache_Dart>('sqlite3_enable_shared_cache');
typedef _sqlite3_enable_shared_cache_C = Int32 Function(
  Int32 arg0,
);
typedef _sqlite3_enable_shared_cache_Dart = int Function(
  int arg0,
);

/// C function `sqlite3_release_memory`.

int sqlite3_release_memory(
  int arg0,
) {
  return   _sqlite3_release_memory(arg0);
}
final _sqlite3_release_memory_Dart _sqlite3_release_memory = _dl.lookupFunction<_sqlite3_release_memory_C, _sqlite3_release_memory_Dart>('sqlite3_release_memory');
typedef _sqlite3_release_memory_C = Int32 Function(
  Int32 arg0,
);
typedef _sqlite3_release_memory_Dart = int Function(
  int arg0,
);

/// C function `sqlite3_soft_heap_limit64`.

int sqlite3_soft_heap_limit64(
  int N,
) {
  return   _sqlite3_soft_heap_limit64(N);
}
final _sqlite3_soft_heap_limit64_Dart _sqlite3_soft_heap_limit64 = _dl.lookupFunction<_sqlite3_soft_heap_limit64_C, _sqlite3_soft_heap_limit64_Dart>('sqlite3_soft_heap_limit64');
typedef _sqlite3_soft_heap_limit64_C = Int64 Function(
  Int64 N,
);
typedef _sqlite3_soft_heap_limit64_Dart = int Function(
  int N,
);

/// C function `sqlite3_soft_heap_limit`.

void sqlite3_soft_heap_limit(
  int N,
) {
   _sqlite3_soft_heap_limit(N);
}
final _sqlite3_soft_heap_limit_Dart _sqlite3_soft_heap_limit = _dl.lookupFunction<_sqlite3_soft_heap_limit_C, _sqlite3_soft_heap_limit_Dart>('sqlite3_soft_heap_limit');
typedef _sqlite3_soft_heap_limit_C = Void Function(
  Int32 N,
);
typedef _sqlite3_soft_heap_limit_Dart = void Function(
  int N,
);

/// C function `sqlite3_table_column_metadata`.

int sqlite3_table_column_metadata(
  Pointer<sqlite3> db,
  Pointer<Uint8> zDbName,
  Pointer<Uint8> zTableName,
  Pointer<Uint8> zColumnName,
  Pointer<Pointer<ffi.Utf8>> pzDataType,
  Pointer<Pointer<ffi.Utf8>> pzCollSeq,
  Pointer<Int32> pNotNull,
  Pointer<Int32> pPrimaryKey,
  Pointer<Int32> pAutoinc,
) {
  return   _sqlite3_table_column_metadata(db, zDbName, zTableName, zColumnName, pzDataType, pzCollSeq, pNotNull, pPrimaryKey, pAutoinc);
}
final _sqlite3_table_column_metadata_Dart _sqlite3_table_column_metadata = _dl.lookupFunction<_sqlite3_table_column_metadata_C, _sqlite3_table_column_metadata_Dart>('sqlite3_table_column_metadata');
typedef _sqlite3_table_column_metadata_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zDbName,
  Pointer<Uint8> zTableName,
  Pointer<Uint8> zColumnName,
  Pointer<Pointer<ffi.Utf8>> pzDataType,
  Pointer<Pointer<ffi.Utf8>> pzCollSeq,
  Pointer<Int32> pNotNull,
  Pointer<Int32> pPrimaryKey,
  Pointer<Int32> pAutoinc,
);
typedef _sqlite3_table_column_metadata_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zDbName,
  Pointer<Uint8> zTableName,
  Pointer<Uint8> zColumnName,
  Pointer<Pointer<ffi.Utf8>> pzDataType,
  Pointer<Pointer<ffi.Utf8>> pzCollSeq,
  Pointer<Int32> pNotNull,
  Pointer<Int32> pPrimaryKey,
  Pointer<Int32> pAutoinc,
);

/// C function `sqlite3_load_extension`.

int sqlite3_load_extension(
  Pointer<sqlite3> db,
  Pointer<Uint8> zFile,
  Pointer<Uint8> zProc,
  Pointer<Pointer<ffi.Utf8>> pzErrMsg,
) {
  return   _sqlite3_load_extension(db, zFile, zProc, pzErrMsg);
}
final _sqlite3_load_extension_Dart _sqlite3_load_extension = _dl.lookupFunction<_sqlite3_load_extension_C, _sqlite3_load_extension_Dart>('sqlite3_load_extension');
typedef _sqlite3_load_extension_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zFile,
  Pointer<Uint8> zProc,
  Pointer<Pointer<ffi.Utf8>> pzErrMsg,
);
typedef _sqlite3_load_extension_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zFile,
  Pointer<Uint8> zProc,
  Pointer<Pointer<ffi.Utf8>> pzErrMsg,
);

/// C function `sqlite3_enable_load_extension`.

int sqlite3_enable_load_extension(
  Pointer<sqlite3> db,
  int onoff,
) {
  return   _sqlite3_enable_load_extension(db, onoff);
}
final _sqlite3_enable_load_extension_Dart _sqlite3_enable_load_extension = _dl.lookupFunction<_sqlite3_enable_load_extension_C, _sqlite3_enable_load_extension_Dart>('sqlite3_enable_load_extension');
typedef _sqlite3_enable_load_extension_C = Int32 Function(
  Pointer<sqlite3> db,
  Int32 onoff,
);
typedef _sqlite3_enable_load_extension_Dart = int Function(
  Pointer<sqlite3> db,
  int onoff,
);

/// C function `sqlite3_auto_extension`.

int sqlite3_auto_extension(
  Pointer<NativeFunction<void Function()>> xEntryPoint,
) {
  return   _sqlite3_auto_extension(xEntryPoint);
}
final _sqlite3_auto_extension_Dart _sqlite3_auto_extension = _dl.lookupFunction<_sqlite3_auto_extension_C, _sqlite3_auto_extension_Dart>('sqlite3_auto_extension');
typedef _sqlite3_auto_extension_C = Int32 Function(
  Pointer<NativeFunction<void Function()>> xEntryPoint,
);
typedef _sqlite3_auto_extension_Dart = int Function(
  Pointer<NativeFunction<void Function()>> xEntryPoint,
);

/// C function `sqlite3_reset_auto_extension`.

void sqlite3_reset_auto_extension() {
   _sqlite3_reset_auto_extension();
}
final _sqlite3_reset_auto_extension_Dart _sqlite3_reset_auto_extension = _dl.lookupFunction<_sqlite3_reset_auto_extension_C, _sqlite3_reset_auto_extension_Dart>('sqlite3_reset_auto_extension');
typedef _sqlite3_reset_auto_extension_C = Void Function();
typedef _sqlite3_reset_auto_extension_Dart = void Function();

/// C function `sqlite3_create_module`.

int sqlite3_create_module(
  Pointer<sqlite3> db,
  Pointer<Uint8> zName,
  Pointer<sqlite3_module> p,
  Pointer<Void> pClientData,
) {
  return   _sqlite3_create_module(db, zName, p, pClientData);
}
final _sqlite3_create_module_Dart _sqlite3_create_module = _dl.lookupFunction<_sqlite3_create_module_C, _sqlite3_create_module_Dart>('sqlite3_create_module');
typedef _sqlite3_create_module_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zName,
  Pointer<sqlite3_module> p,
  Pointer<Void> pClientData,
);
typedef _sqlite3_create_module_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zName,
  Pointer<sqlite3_module> p,
  Pointer<Void> pClientData,
);

/// C function `sqlite3_create_module_v2`.

int sqlite3_create_module_v2(
  Pointer<sqlite3> db,
  Pointer<Uint8> zName,
  Pointer<sqlite3_module> p,
  Pointer<Void> pClientData,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> xDestroy,
) {
  return   _sqlite3_create_module_v2(db, zName, p, pClientData, xDestroy);
}
final _sqlite3_create_module_v2_Dart _sqlite3_create_module_v2 = _dl.lookupFunction<_sqlite3_create_module_v2_C, _sqlite3_create_module_v2_Dart>('sqlite3_create_module_v2');
typedef _sqlite3_create_module_v2_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zName,
  Pointer<sqlite3_module> p,
  Pointer<Void> pClientData,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> xDestroy,
);
typedef _sqlite3_create_module_v2_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zName,
  Pointer<sqlite3_module> p,
  Pointer<Void> pClientData,
  Pointer<NativeFunction<void Function(Pointer<Void>)>> xDestroy,
);

/// C function `sqlite3_declare_vtab`.

int sqlite3_declare_vtab(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zSQL,
) {
  return   _sqlite3_declare_vtab(arg0, zSQL);
}
final _sqlite3_declare_vtab_Dart _sqlite3_declare_vtab = _dl.lookupFunction<_sqlite3_declare_vtab_C, _sqlite3_declare_vtab_Dart>('sqlite3_declare_vtab');
typedef _sqlite3_declare_vtab_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zSQL,
);
typedef _sqlite3_declare_vtab_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zSQL,
);

/// C function `sqlite3_overload_function`.

int sqlite3_overload_function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zFuncName,
  int nArg,
) {
  return   _sqlite3_overload_function(arg0, zFuncName, nArg);
}
final _sqlite3_overload_function_Dart _sqlite3_overload_function = _dl.lookupFunction<_sqlite3_overload_function_C, _sqlite3_overload_function_Dart>('sqlite3_overload_function');
typedef _sqlite3_overload_function_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zFuncName,
  Int32 nArg,
);
typedef _sqlite3_overload_function_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zFuncName,
  int nArg,
);

/// C function `sqlite3_blob_open`.

int sqlite3_blob_open(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zDb,
  Pointer<Uint8> zTable,
  Pointer<Uint8> zColumn,
  int iRow,
  int flags,
  Pointer<Pointer<sqlite3_blob>> ppBlob,
) {
  return   _sqlite3_blob_open(arg0, zDb, zTable, zColumn, iRow, flags, ppBlob);
}
final _sqlite3_blob_open_Dart _sqlite3_blob_open = _dl.lookupFunction<_sqlite3_blob_open_C, _sqlite3_blob_open_Dart>('sqlite3_blob_open');
typedef _sqlite3_blob_open_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zDb,
  Pointer<Uint8> zTable,
  Pointer<Uint8> zColumn,
  Int64 iRow,
  Int32 flags,
  Pointer<Pointer<sqlite3_blob>> ppBlob,
);
typedef _sqlite3_blob_open_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zDb,
  Pointer<Uint8> zTable,
  Pointer<Uint8> zColumn,
  int iRow,
  int flags,
  Pointer<Pointer<sqlite3_blob>> ppBlob,
);

/// C function `sqlite3_blob_reopen`.

int sqlite3_blob_reopen(
  Pointer<sqlite3_blob> arg0,
  int arg1,
) {
  return   _sqlite3_blob_reopen(arg0, arg1);
}
final _sqlite3_blob_reopen_Dart _sqlite3_blob_reopen = _dl.lookupFunction<_sqlite3_blob_reopen_C, _sqlite3_blob_reopen_Dart>('sqlite3_blob_reopen');
typedef _sqlite3_blob_reopen_C = Int32 Function(
  Pointer<sqlite3_blob> arg0,
  Int64 arg1,
);
typedef _sqlite3_blob_reopen_Dart = int Function(
  Pointer<sqlite3_blob> arg0,
  int arg1,
);

/// C function `sqlite3_blob_close`.

int sqlite3_blob_close(
  Pointer<sqlite3_blob> arg0,
) {
  return   _sqlite3_blob_close(arg0);
}
final _sqlite3_blob_close_Dart _sqlite3_blob_close = _dl.lookupFunction<_sqlite3_blob_close_C, _sqlite3_blob_close_Dart>('sqlite3_blob_close');
typedef _sqlite3_blob_close_C = Int32 Function(
  Pointer<sqlite3_blob> arg0,
);
typedef _sqlite3_blob_close_Dart = int Function(
  Pointer<sqlite3_blob> arg0,
);

/// C function `sqlite3_blob_bytes`.

int sqlite3_blob_bytes(
  Pointer<sqlite3_blob> arg0,
) {
  return   _sqlite3_blob_bytes(arg0);
}
final _sqlite3_blob_bytes_Dart _sqlite3_blob_bytes = _dl.lookupFunction<_sqlite3_blob_bytes_C, _sqlite3_blob_bytes_Dart>('sqlite3_blob_bytes');
typedef _sqlite3_blob_bytes_C = Int32 Function(
  Pointer<sqlite3_blob> arg0,
);
typedef _sqlite3_blob_bytes_Dart = int Function(
  Pointer<sqlite3_blob> arg0,
);

/// C function `sqlite3_blob_read`.

int sqlite3_blob_read(
  Pointer<sqlite3_blob> arg0,
  Pointer<Void> Z,
  int N,
  int iOffset,
) {
  return   _sqlite3_blob_read(arg0, Z, N, iOffset);
}
final _sqlite3_blob_read_Dart _sqlite3_blob_read = _dl.lookupFunction<_sqlite3_blob_read_C, _sqlite3_blob_read_Dart>('sqlite3_blob_read');
typedef _sqlite3_blob_read_C = Int32 Function(
  Pointer<sqlite3_blob> arg0,
  Pointer<Void> Z,
  Int32 N,
  Int32 iOffset,
);
typedef _sqlite3_blob_read_Dart = int Function(
  Pointer<sqlite3_blob> arg0,
  Pointer<Void> Z,
  int N,
  int iOffset,
);

/// C function `sqlite3_blob_write`.

int sqlite3_blob_write(
  Pointer<sqlite3_blob> arg0,
  Pointer<Void> z,
  int n,
  int iOffset,
) {
  return   _sqlite3_blob_write(arg0, z, n, iOffset);
}
final _sqlite3_blob_write_Dart _sqlite3_blob_write = _dl.lookupFunction<_sqlite3_blob_write_C, _sqlite3_blob_write_Dart>('sqlite3_blob_write');
typedef _sqlite3_blob_write_C = Int32 Function(
  Pointer<sqlite3_blob> arg0,
  Pointer<Void> z,
  Int32 n,
  Int32 iOffset,
);
typedef _sqlite3_blob_write_Dart = int Function(
  Pointer<sqlite3_blob> arg0,
  Pointer<Void> z,
  int n,
  int iOffset,
);

/// C function `sqlite3_vfs_find`.

Pointer<sqlite3_vfs> sqlite3_vfs_find(
  Pointer<Uint8> zVfsName,
) {
  return   _sqlite3_vfs_find(zVfsName);
}
final _sqlite3_vfs_find_Dart _sqlite3_vfs_find = _dl.lookupFunction<_sqlite3_vfs_find_C, _sqlite3_vfs_find_Dart>('sqlite3_vfs_find');
typedef _sqlite3_vfs_find_C = Pointer<sqlite3_vfs> Function(
  Pointer<Uint8> zVfsName,
);
typedef _sqlite3_vfs_find_Dart = Pointer<sqlite3_vfs> Function(
  Pointer<Uint8> zVfsName,
);

/// C function `sqlite3_vfs_register`.

int sqlite3_vfs_register(
  Pointer<sqlite3_vfs> arg0,
  int makeDflt,
) {
  return   _sqlite3_vfs_register(arg0, makeDflt);
}
final _sqlite3_vfs_register_Dart _sqlite3_vfs_register = _dl.lookupFunction<_sqlite3_vfs_register_C, _sqlite3_vfs_register_Dart>('sqlite3_vfs_register');
typedef _sqlite3_vfs_register_C = Int32 Function(
  Pointer<sqlite3_vfs> arg0,
  Int32 makeDflt,
);
typedef _sqlite3_vfs_register_Dart = int Function(
  Pointer<sqlite3_vfs> arg0,
  int makeDflt,
);

/// C function `sqlite3_vfs_unregister`.

int sqlite3_vfs_unregister(
  Pointer<sqlite3_vfs> arg0,
) {
  return   _sqlite3_vfs_unregister(arg0);
}
final _sqlite3_vfs_unregister_Dart _sqlite3_vfs_unregister = _dl.lookupFunction<_sqlite3_vfs_unregister_C, _sqlite3_vfs_unregister_Dart>('sqlite3_vfs_unregister');
typedef _sqlite3_vfs_unregister_C = Int32 Function(
  Pointer<sqlite3_vfs> arg0,
);
typedef _sqlite3_vfs_unregister_Dart = int Function(
  Pointer<sqlite3_vfs> arg0,
);

/// C function `sqlite3_mutex_alloc`.

Pointer<sqlite3_mutex> sqlite3_mutex_alloc(
  int arg0,
) {
  return   _sqlite3_mutex_alloc(arg0);
}
final _sqlite3_mutex_alloc_Dart _sqlite3_mutex_alloc = _dl.lookupFunction<_sqlite3_mutex_alloc_C, _sqlite3_mutex_alloc_Dart>('sqlite3_mutex_alloc');
typedef _sqlite3_mutex_alloc_C = Pointer<sqlite3_mutex> Function(
  Int32 arg0,
);
typedef _sqlite3_mutex_alloc_Dart = Pointer<sqlite3_mutex> Function(
  int arg0,
);

/// C function `sqlite3_mutex_free`.

void sqlite3_mutex_free(
  Pointer<sqlite3_mutex> arg0,
) {
   _sqlite3_mutex_free(arg0);
}
final _sqlite3_mutex_free_Dart _sqlite3_mutex_free = _dl.lookupFunction<_sqlite3_mutex_free_C, _sqlite3_mutex_free_Dart>('sqlite3_mutex_free');
typedef _sqlite3_mutex_free_C = Void Function(
  Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_free_Dart = void Function(
  Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_mutex_enter`.

void sqlite3_mutex_enter(
  Pointer<sqlite3_mutex> arg0,
) {
   _sqlite3_mutex_enter(arg0);
}
final _sqlite3_mutex_enter_Dart _sqlite3_mutex_enter = _dl.lookupFunction<_sqlite3_mutex_enter_C, _sqlite3_mutex_enter_Dart>('sqlite3_mutex_enter');
typedef _sqlite3_mutex_enter_C = Void Function(
  Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_enter_Dart = void Function(
  Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_mutex_try`.

int sqlite3_mutex_try(
  Pointer<sqlite3_mutex> arg0,
) {
  return   _sqlite3_mutex_try(arg0);
}
final _sqlite3_mutex_try_Dart _sqlite3_mutex_try = _dl.lookupFunction<_sqlite3_mutex_try_C, _sqlite3_mutex_try_Dart>('sqlite3_mutex_try');
typedef _sqlite3_mutex_try_C = Int32 Function(
  Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_try_Dart = int Function(
  Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_mutex_leave`.

void sqlite3_mutex_leave(
  Pointer<sqlite3_mutex> arg0,
) {
   _sqlite3_mutex_leave(arg0);
}
final _sqlite3_mutex_leave_Dart _sqlite3_mutex_leave = _dl.lookupFunction<_sqlite3_mutex_leave_C, _sqlite3_mutex_leave_Dart>('sqlite3_mutex_leave');
typedef _sqlite3_mutex_leave_C = Void Function(
  Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_leave_Dart = void Function(
  Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_mutex_held`.

int sqlite3_mutex_held(
  Pointer<sqlite3_mutex> arg0,
) {
  return   _sqlite3_mutex_held(arg0);
}
final _sqlite3_mutex_held_Dart _sqlite3_mutex_held = _dl.lookupFunction<_sqlite3_mutex_held_C, _sqlite3_mutex_held_Dart>('sqlite3_mutex_held');
typedef _sqlite3_mutex_held_C = Int32 Function(
  Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_held_Dart = int Function(
  Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_mutex_notheld`.

int sqlite3_mutex_notheld(
  Pointer<sqlite3_mutex> arg0,
) {
  return   _sqlite3_mutex_notheld(arg0);
}
final _sqlite3_mutex_notheld_Dart _sqlite3_mutex_notheld = _dl.lookupFunction<_sqlite3_mutex_notheld_C, _sqlite3_mutex_notheld_Dart>('sqlite3_mutex_notheld');
typedef _sqlite3_mutex_notheld_C = Int32 Function(
  Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_notheld_Dart = int Function(
  Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_db_mutex`.

Pointer<sqlite3_mutex> sqlite3_db_mutex(
  Pointer<sqlite3> arg0,
) {
  return   _sqlite3_db_mutex(arg0);
}
final _sqlite3_db_mutex_Dart _sqlite3_db_mutex = _dl.lookupFunction<_sqlite3_db_mutex_C, _sqlite3_db_mutex_Dart>('sqlite3_db_mutex');
typedef _sqlite3_db_mutex_C = Pointer<sqlite3_mutex> Function(
  Pointer<sqlite3> arg0,
);
typedef _sqlite3_db_mutex_Dart = Pointer<sqlite3_mutex> Function(
  Pointer<sqlite3> arg0,
);

/// C function `sqlite3_file_control`.

int sqlite3_file_control(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zDbName,
  int op,
  Pointer<Void> arg3,
) {
  return   _sqlite3_file_control(arg0, zDbName, op, arg3);
}
final _sqlite3_file_control_Dart _sqlite3_file_control = _dl.lookupFunction<_sqlite3_file_control_C, _sqlite3_file_control_Dart>('sqlite3_file_control');
typedef _sqlite3_file_control_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zDbName,
  Int32 op,
  Pointer<Void> arg3,
);
typedef _sqlite3_file_control_Dart = int Function(
  Pointer<sqlite3> arg0,
  Pointer<Uint8> zDbName,
  int op,
  Pointer<Void> arg3,
);

/// C function `sqlite3_test_control`.

int sqlite3_test_control(
  int op,
) {
  return   _sqlite3_test_control(op);
}
final _sqlite3_test_control_Dart _sqlite3_test_control = _dl.lookupFunction<_sqlite3_test_control_C, _sqlite3_test_control_Dart>('sqlite3_test_control');
typedef _sqlite3_test_control_C = Int32 Function(
  Int32 op,
);
typedef _sqlite3_test_control_Dart = int Function(
  int op,
);

/// C function `sqlite3_status`.

int sqlite3_status(
  int op,
  Pointer<Int32> pCurrent,
  Pointer<Int32> pHighwater,
  int resetFlag,
) {
  return   _sqlite3_status(op, pCurrent, pHighwater, resetFlag);
}
final _sqlite3_status_Dart _sqlite3_status = _dl.lookupFunction<_sqlite3_status_C, _sqlite3_status_Dart>('sqlite3_status');
typedef _sqlite3_status_C = Int32 Function(
  Int32 op,
  Pointer<Int32> pCurrent,
  Pointer<Int32> pHighwater,
  Int32 resetFlag,
);
typedef _sqlite3_status_Dart = int Function(
  int op,
  Pointer<Int32> pCurrent,
  Pointer<Int32> pHighwater,
  int resetFlag,
);

/// C function `sqlite3_db_status`.

int sqlite3_db_status(
  Pointer<sqlite3> arg0,
  int op,
  Pointer<Int32> pCur,
  Pointer<Int32> pHiwtr,
  int resetFlg,
) {
  return   _sqlite3_db_status(arg0, op, pCur, pHiwtr, resetFlg);
}
final _sqlite3_db_status_Dart _sqlite3_db_status = _dl.lookupFunction<_sqlite3_db_status_C, _sqlite3_db_status_Dart>('sqlite3_db_status');
typedef _sqlite3_db_status_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Int32 op,
  Pointer<Int32> pCur,
  Pointer<Int32> pHiwtr,
  Int32 resetFlg,
);
typedef _sqlite3_db_status_Dart = int Function(
  Pointer<sqlite3> arg0,
  int op,
  Pointer<Int32> pCur,
  Pointer<Int32> pHiwtr,
  int resetFlg,
);

/// C function `sqlite3_stmt_status`.

int sqlite3_stmt_status(
  Pointer<sqlite3_stmt> arg0,
  int op,
  int resetFlg,
) {
  return   _sqlite3_stmt_status(arg0, op, resetFlg);
}
final _sqlite3_stmt_status_Dart _sqlite3_stmt_status = _dl.lookupFunction<_sqlite3_stmt_status_C, _sqlite3_stmt_status_Dart>('sqlite3_stmt_status');
typedef _sqlite3_stmt_status_C = Int32 Function(
  Pointer<sqlite3_stmt> arg0,
  Int32 op,
  Int32 resetFlg,
);
typedef _sqlite3_stmt_status_Dart = int Function(
  Pointer<sqlite3_stmt> arg0,
  int op,
  int resetFlg,
);

/// C function `sqlite3_backup_init`.

Pointer<sqlite3_backup> sqlite3_backup_init(
  Pointer<sqlite3> pDest,
  Pointer<Uint8> zDestName,
  Pointer<sqlite3> pSource,
  Pointer<Uint8> zSourceName,
) {
  return   _sqlite3_backup_init(pDest, zDestName, pSource, zSourceName);
}
final _sqlite3_backup_init_Dart _sqlite3_backup_init = _dl.lookupFunction<_sqlite3_backup_init_C, _sqlite3_backup_init_Dart>('sqlite3_backup_init');
typedef _sqlite3_backup_init_C = Pointer<sqlite3_backup> Function(
  Pointer<sqlite3> pDest,
  Pointer<Uint8> zDestName,
  Pointer<sqlite3> pSource,
  Pointer<Uint8> zSourceName,
);
typedef _sqlite3_backup_init_Dart = Pointer<sqlite3_backup> Function(
  Pointer<sqlite3> pDest,
  Pointer<Uint8> zDestName,
  Pointer<sqlite3> pSource,
  Pointer<Uint8> zSourceName,
);

/// C function `sqlite3_backup_step`.

int sqlite3_backup_step(
  Pointer<sqlite3_backup> p,
  int nPage,
) {
  return   _sqlite3_backup_step(p, nPage);
}
final _sqlite3_backup_step_Dart _sqlite3_backup_step = _dl.lookupFunction<_sqlite3_backup_step_C, _sqlite3_backup_step_Dart>('sqlite3_backup_step');
typedef _sqlite3_backup_step_C = Int32 Function(
  Pointer<sqlite3_backup> p,
  Int32 nPage,
);
typedef _sqlite3_backup_step_Dart = int Function(
  Pointer<sqlite3_backup> p,
  int nPage,
);

/// C function `sqlite3_backup_finish`.

int sqlite3_backup_finish(
  Pointer<sqlite3_backup> p,
) {
  return   _sqlite3_backup_finish(p);
}
final _sqlite3_backup_finish_Dart _sqlite3_backup_finish = _dl.lookupFunction<_sqlite3_backup_finish_C, _sqlite3_backup_finish_Dart>('sqlite3_backup_finish');
typedef _sqlite3_backup_finish_C = Int32 Function(
  Pointer<sqlite3_backup> p,
);
typedef _sqlite3_backup_finish_Dart = int Function(
  Pointer<sqlite3_backup> p,
);

/// C function `sqlite3_backup_remaining`.

int sqlite3_backup_remaining(
  Pointer<sqlite3_backup> p,
) {
  return   _sqlite3_backup_remaining(p);
}
final _sqlite3_backup_remaining_Dart _sqlite3_backup_remaining = _dl.lookupFunction<_sqlite3_backup_remaining_C, _sqlite3_backup_remaining_Dart>('sqlite3_backup_remaining');
typedef _sqlite3_backup_remaining_C = Int32 Function(
  Pointer<sqlite3_backup> p,
);
typedef _sqlite3_backup_remaining_Dart = int Function(
  Pointer<sqlite3_backup> p,
);

/// C function `sqlite3_backup_pagecount`.

int sqlite3_backup_pagecount(
  Pointer<sqlite3_backup> p,
) {
  return   _sqlite3_backup_pagecount(p);
}
final _sqlite3_backup_pagecount_Dart _sqlite3_backup_pagecount = _dl.lookupFunction<_sqlite3_backup_pagecount_C, _sqlite3_backup_pagecount_Dart>('sqlite3_backup_pagecount');
typedef _sqlite3_backup_pagecount_C = Int32 Function(
  Pointer<sqlite3_backup> p,
);
typedef _sqlite3_backup_pagecount_Dart = int Function(
  Pointer<sqlite3_backup> p,
);

/// C function `sqlite3_unlock_notify`.

int sqlite3_unlock_notify(
  Pointer<sqlite3> pBlocked,
  Pointer<NativeFunction<void Function(Pointer<Pointer<Void>>, Int32)>> xNotify,
  Pointer<Void> pNotifyArg,
) {
  return   _sqlite3_unlock_notify(pBlocked, xNotify, pNotifyArg);
}
final _sqlite3_unlock_notify_Dart _sqlite3_unlock_notify = _dl.lookupFunction<_sqlite3_unlock_notify_C, _sqlite3_unlock_notify_Dart>('sqlite3_unlock_notify');
typedef _sqlite3_unlock_notify_C = Int32 Function(
  Pointer<sqlite3> pBlocked,
  Pointer<NativeFunction<void Function(Pointer<Pointer<Void>>, Int32)>> xNotify,
  Pointer<Void> pNotifyArg,
);
typedef _sqlite3_unlock_notify_Dart = int Function(
  Pointer<sqlite3> pBlocked,
  Pointer<NativeFunction<void Function(Pointer<Pointer<Void>>, Int32)>> xNotify,
  Pointer<Void> pNotifyArg,
);

/// C function `sqlite3_strnicmp`.

int sqlite3_strnicmp(
  Pointer<Uint8> arg0,
  Pointer<Uint8> arg1,
  int arg2,
) {
  return   _sqlite3_strnicmp(arg0, arg1, arg2);
}
final _sqlite3_strnicmp_Dart _sqlite3_strnicmp = _dl.lookupFunction<_sqlite3_strnicmp_C, _sqlite3_strnicmp_Dart>('sqlite3_strnicmp');
typedef _sqlite3_strnicmp_C = Int32 Function(
  Pointer<Uint8> arg0,
  Pointer<Uint8> arg1,
  Int32 arg2,
);
typedef _sqlite3_strnicmp_Dart = int Function(
  Pointer<Uint8> arg0,
  Pointer<Uint8> arg1,
  int arg2,
);

/// C function `sqlite3_log`.

void sqlite3_log(
  int iErrCode,
  Pointer<Uint8> zFormat,
) {
   _sqlite3_log(iErrCode, zFormat);
}
final _sqlite3_log_Dart _sqlite3_log = _dl.lookupFunction<_sqlite3_log_C, _sqlite3_log_Dart>('sqlite3_log');
typedef _sqlite3_log_C = Void Function(
  Int32 iErrCode,
  Pointer<Uint8> zFormat,
);
typedef _sqlite3_log_Dart = void Function(
  int iErrCode,
  Pointer<Uint8> zFormat,
);

/// C function `sqlite3_wal_hook`.

Pointer<Void> sqlite3_wal_hook(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>, Pointer<sqlite3>, Pointer<Uint8>, Int32)>> arg1,
  Pointer<Void> arg2,
) {
  return   _sqlite3_wal_hook(arg0, arg1, arg2);
}
final _sqlite3_wal_hook_Dart _sqlite3_wal_hook = _dl.lookupFunction<_sqlite3_wal_hook_C, _sqlite3_wal_hook_Dart>('sqlite3_wal_hook');
typedef _sqlite3_wal_hook_C = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>, Pointer<sqlite3>, Pointer<Uint8>, Int32)>> arg1,
  Pointer<Void> arg2,
);
typedef _sqlite3_wal_hook_Dart = Pointer<Void> Function(
  Pointer<sqlite3> arg0,
  Pointer<NativeFunction<int Function(Pointer<Void>, Pointer<sqlite3>, Pointer<Uint8>, Int32)>> arg1,
  Pointer<Void> arg2,
);

/// C function `sqlite3_wal_autocheckpoint`.

int sqlite3_wal_autocheckpoint(
  Pointer<sqlite3> db,
  int N,
) {
  return   _sqlite3_wal_autocheckpoint(db, N);
}
final _sqlite3_wal_autocheckpoint_Dart _sqlite3_wal_autocheckpoint = _dl.lookupFunction<_sqlite3_wal_autocheckpoint_C, _sqlite3_wal_autocheckpoint_Dart>('sqlite3_wal_autocheckpoint');
typedef _sqlite3_wal_autocheckpoint_C = Int32 Function(
  Pointer<sqlite3> db,
  Int32 N,
);
typedef _sqlite3_wal_autocheckpoint_Dart = int Function(
  Pointer<sqlite3> db,
  int N,
);

/// C function `sqlite3_wal_checkpoint`.

int sqlite3_wal_checkpoint(
  Pointer<sqlite3> db,
  Pointer<Uint8> zDb,
) {
  return   _sqlite3_wal_checkpoint(db, zDb);
}
final _sqlite3_wal_checkpoint_Dart _sqlite3_wal_checkpoint = _dl.lookupFunction<_sqlite3_wal_checkpoint_C, _sqlite3_wal_checkpoint_Dart>('sqlite3_wal_checkpoint');
typedef _sqlite3_wal_checkpoint_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zDb,
);
typedef _sqlite3_wal_checkpoint_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zDb,
);

/// C function `sqlite3_wal_checkpoint_v2`.

int sqlite3_wal_checkpoint_v2(
  Pointer<sqlite3> db,
  Pointer<Uint8> zDb,
  int eMode,
  Pointer<Int32> pnLog,
  Pointer<Int32> pnCkpt,
) {
  return   _sqlite3_wal_checkpoint_v2(db, zDb, eMode, pnLog, pnCkpt);
}
final _sqlite3_wal_checkpoint_v2_Dart _sqlite3_wal_checkpoint_v2 = _dl.lookupFunction<_sqlite3_wal_checkpoint_v2_C, _sqlite3_wal_checkpoint_v2_Dart>('sqlite3_wal_checkpoint_v2');
typedef _sqlite3_wal_checkpoint_v2_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zDb,
  Int32 eMode,
  Pointer<Int32> pnLog,
  Pointer<Int32> pnCkpt,
);
typedef _sqlite3_wal_checkpoint_v2_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zDb,
  int eMode,
  Pointer<Int32> pnLog,
  Pointer<Int32> pnCkpt,
);

/// C function `sqlite3_vtab_config`.

int sqlite3_vtab_config(
  Pointer<sqlite3> arg0,
  int op,
) {
  return   _sqlite3_vtab_config(arg0, op);
}
final _sqlite3_vtab_config_Dart _sqlite3_vtab_config = _dl.lookupFunction<_sqlite3_vtab_config_C, _sqlite3_vtab_config_Dart>('sqlite3_vtab_config');
typedef _sqlite3_vtab_config_C = Int32 Function(
  Pointer<sqlite3> arg0,
  Int32 op,
);
typedef _sqlite3_vtab_config_Dart = int Function(
  Pointer<sqlite3> arg0,
  int op,
);

/// C function `sqlite3_vtab_on_conflict`.

int sqlite3_vtab_on_conflict(
  Pointer<sqlite3> arg0,
) {
  return   _sqlite3_vtab_on_conflict(arg0);
}
final _sqlite3_vtab_on_conflict_Dart _sqlite3_vtab_on_conflict = _dl.lookupFunction<_sqlite3_vtab_on_conflict_C, _sqlite3_vtab_on_conflict_Dart>('sqlite3_vtab_on_conflict');
typedef _sqlite3_vtab_on_conflict_C = Int32 Function(
  Pointer<sqlite3> arg0,
);
typedef _sqlite3_vtab_on_conflict_Dart = int Function(
  Pointer<sqlite3> arg0,
);

/// C function `sqlite3_rtree_geometry_callback`.

int sqlite3_rtree_geometry_callback(
  Pointer<sqlite3> db,
  Pointer<Uint8> zGeom,
  Pointer<NativeFunction<int Function(Pointer<sqlite3_rtree_geometry>, Int32, Pointer<Double>, Pointer<Int32>)>> xGeom,
  Pointer<Void> pContext,
) {
  return   _sqlite3_rtree_geometry_callback(db, zGeom, xGeom, pContext);
}
final _sqlite3_rtree_geometry_callback_Dart _sqlite3_rtree_geometry_callback = _dl.lookupFunction<_sqlite3_rtree_geometry_callback_C, _sqlite3_rtree_geometry_callback_Dart>('sqlite3_rtree_geometry_callback');
typedef _sqlite3_rtree_geometry_callback_C = Int32 Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zGeom,
  Pointer<NativeFunction<int Function(Pointer<sqlite3_rtree_geometry>, Int32, Pointer<Double>, Pointer<Int32>)>> xGeom,
  Pointer<Void> pContext,
);
typedef _sqlite3_rtree_geometry_callback_Dart = int Function(
  Pointer<sqlite3> db,
  Pointer<Uint8> zGeom,
  Pointer<NativeFunction<int Function(Pointer<sqlite3_rtree_geometry>, Int32, Pointer<Double>, Pointer<Int32>)>> xGeom,
  Pointer<Void> pContext,
);

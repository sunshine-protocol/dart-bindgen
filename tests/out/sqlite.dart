import 'dart:io';
import 'package:ffi/ffi.dart' as ffi;
import 'dart:ffi';

final DynamicLibrary _dl = _open();
DynamicLibrary _open() {
  if (Platform.isWindows) return DynamicLibrary.open('target/sqlite.dll');
  if (Platform.isAndroid) return DynamicLibrary.open('libsqlite.so');
  if (Platform.isIOS) return DynamicLibrary.executable();
  throw UnsupportedError('This platform is not supported.');
}

/// C function `sqlite3_libversion`.

ffi.Pointer<int> sqlite3_libversion() {
  return   _sqlite3_libversion();
}
final _sqlite3_libversion_Dart _sqlite3_libversion = _dl.lookupFunction<_sqlite3_libversion_C, _sqlite3_libversion_Dart>('sqlite3_libversion');
typedef _sqlite3_libversion_C = ffi.Pointer<ffi.Uint8> Function();
typedef _sqlite3_libversion_Dart = ffi.Pointer<int> Function();

/// C function `sqlite3_sourceid`.

ffi.Pointer<int> sqlite3_sourceid() {
  return   _sqlite3_sourceid();
}
final _sqlite3_sourceid_Dart _sqlite3_sourceid = _dl.lookupFunction<_sqlite3_sourceid_C, _sqlite3_sourceid_Dart>('sqlite3_sourceid');
typedef _sqlite3_sourceid_C = ffi.Pointer<ffi.Uint8> Function();
typedef _sqlite3_sourceid_Dart = ffi.Pointer<int> Function();

/// C function `sqlite3_libversion_number`.

int sqlite3_libversion_number() {
  return   _sqlite3_libversion_number();
}
final _sqlite3_libversion_number_Dart _sqlite3_libversion_number = _dl.lookupFunction<_sqlite3_libversion_number_C, _sqlite3_libversion_number_Dart>('sqlite3_libversion_number');
typedef _sqlite3_libversion_number_C = int Function();
typedef _sqlite3_libversion_number_Dart = int Function();

/// C function `sqlite3_compileoption_used`.

int sqlite3_compileoption_used(
  ffi.Pointer<int> zOptName,
) {
  return   _sqlite3_compileoption_used(zOptName);
}
final _sqlite3_compileoption_used_Dart _sqlite3_compileoption_used = _dl.lookupFunction<_sqlite3_compileoption_used_C, _sqlite3_compileoption_used_Dart>('sqlite3_compileoption_used');
typedef _sqlite3_compileoption_used_C = int Function(
  ffi.Pointer<ffi.Uint8> zOptName,
);
typedef _sqlite3_compileoption_used_Dart = int Function(
  ffi.Pointer<int> zOptName,
);

/// C function `sqlite3_compileoption_get`.

ffi.Pointer<int> sqlite3_compileoption_get(
  int N,
) {
  return   _sqlite3_compileoption_get(N);
}
final _sqlite3_compileoption_get_Dart _sqlite3_compileoption_get = _dl.lookupFunction<_sqlite3_compileoption_get_C, _sqlite3_compileoption_get_Dart>('sqlite3_compileoption_get');
typedef _sqlite3_compileoption_get_C = ffi.Pointer<ffi.Uint8> Function(
  int N,
);
typedef _sqlite3_compileoption_get_Dart = ffi.Pointer<int> Function(
  int N,
);

/// C function `sqlite3_threadsafe`.

int sqlite3_threadsafe() {
  return   _sqlite3_threadsafe();
}
final _sqlite3_threadsafe_Dart _sqlite3_threadsafe = _dl.lookupFunction<_sqlite3_threadsafe_C, _sqlite3_threadsafe_Dart>('sqlite3_threadsafe');
typedef _sqlite3_threadsafe_C = int Function();
typedef _sqlite3_threadsafe_Dart = int Function();

/// C function `sqlite3_close`.

int sqlite3_close(
  ffi.Pointer<sqlite3> arg0,
) {
  return   _sqlite3_close(arg0);
}
final _sqlite3_close_Dart _sqlite3_close = _dl.lookupFunction<_sqlite3_close_C, _sqlite3_close_Dart>('sqlite3_close');
typedef _sqlite3_close_C = int Function(
  ffi.Pointer<sqlite3> arg0,
);
typedef _sqlite3_close_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
);

/// C function `sqlite3_exec`.

int sqlite3_exec(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> sql,
  int (*)(void *, int, char **, char **) callback,
  ffi.Pointer<void> arg3,
  ffi.Pointer<ffi.Pointer<int>> errmsg,
) {
  return   _sqlite3_exec(arg0, sql, callback, arg3, errmsg);
}
final _sqlite3_exec_Dart _sqlite3_exec = _dl.lookupFunction<_sqlite3_exec_C, _sqlite3_exec_Dart>('sqlite3_exec');
typedef _sqlite3_exec_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<ffi.Uint8> sql,
  int (*)(void *, int, char **, char **) callback,
  ffi.Pointer<ffi.Void> arg3,
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> errmsg,
);
typedef _sqlite3_exec_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> sql,
  int (*)(void *, int, char **, char **) callback,
  ffi.Pointer<void> arg3,
  ffi.Pointer<ffi.Pointer<int>> errmsg,
);

/// C function `sqlite3_initialize`.

int sqlite3_initialize() {
  return   _sqlite3_initialize();
}
final _sqlite3_initialize_Dart _sqlite3_initialize = _dl.lookupFunction<_sqlite3_initialize_C, _sqlite3_initialize_Dart>('sqlite3_initialize');
typedef _sqlite3_initialize_C = int Function();
typedef _sqlite3_initialize_Dart = int Function();

/// C function `sqlite3_shutdown`.

int sqlite3_shutdown() {
  return   _sqlite3_shutdown();
}
final _sqlite3_shutdown_Dart _sqlite3_shutdown = _dl.lookupFunction<_sqlite3_shutdown_C, _sqlite3_shutdown_Dart>('sqlite3_shutdown');
typedef _sqlite3_shutdown_C = int Function();
typedef _sqlite3_shutdown_Dart = int Function();

/// C function `sqlite3_os_init`.

int sqlite3_os_init() {
  return   _sqlite3_os_init();
}
final _sqlite3_os_init_Dart _sqlite3_os_init = _dl.lookupFunction<_sqlite3_os_init_C, _sqlite3_os_init_Dart>('sqlite3_os_init');
typedef _sqlite3_os_init_C = int Function();
typedef _sqlite3_os_init_Dart = int Function();

/// C function `sqlite3_os_end`.

int sqlite3_os_end() {
  return   _sqlite3_os_end();
}
final _sqlite3_os_end_Dart _sqlite3_os_end = _dl.lookupFunction<_sqlite3_os_end_C, _sqlite3_os_end_Dart>('sqlite3_os_end');
typedef _sqlite3_os_end_C = int Function();
typedef _sqlite3_os_end_Dart = int Function();

/// C function `sqlite3_config`.

int sqlite3_config(
  int arg0,
) {
  return   _sqlite3_config(arg0);
}
final _sqlite3_config_Dart _sqlite3_config = _dl.lookupFunction<_sqlite3_config_C, _sqlite3_config_Dart>('sqlite3_config');
typedef _sqlite3_config_C = int Function(
  int arg0,
);
typedef _sqlite3_config_Dart = int Function(
  int arg0,
);

/// C function `sqlite3_db_config`.

int sqlite3_db_config(
  ffi.Pointer<sqlite3> arg0,
  int op,
) {
  return   _sqlite3_db_config(arg0, op);
}
final _sqlite3_db_config_Dart _sqlite3_db_config = _dl.lookupFunction<_sqlite3_db_config_C, _sqlite3_db_config_Dart>('sqlite3_db_config');
typedef _sqlite3_db_config_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  int op,
);
typedef _sqlite3_db_config_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  int op,
);

/// C function `sqlite3_extended_result_codes`.

int sqlite3_extended_result_codes(
  ffi.Pointer<sqlite3> arg0,
  int onoff,
) {
  return   _sqlite3_extended_result_codes(arg0, onoff);
}
final _sqlite3_extended_result_codes_Dart _sqlite3_extended_result_codes = _dl.lookupFunction<_sqlite3_extended_result_codes_C, _sqlite3_extended_result_codes_Dart>('sqlite3_extended_result_codes');
typedef _sqlite3_extended_result_codes_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  int onoff,
);
typedef _sqlite3_extended_result_codes_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  int onoff,
);

/// C function `sqlite3_last_insert_rowid`.

long long sqlite3_last_insert_rowid(
  ffi.Pointer<sqlite3> arg0,
) {
  return   _sqlite3_last_insert_rowid(arg0);
}
final _sqlite3_last_insert_rowid_Dart _sqlite3_last_insert_rowid = _dl.lookupFunction<_sqlite3_last_insert_rowid_C, _sqlite3_last_insert_rowid_Dart>('sqlite3_last_insert_rowid');
typedef _sqlite3_last_insert_rowid_C = long long Function(
  ffi.Pointer<sqlite3> arg0,
);
typedef _sqlite3_last_insert_rowid_Dart = long long Function(
  ffi.Pointer<sqlite3> arg0,
);

/// C function `sqlite3_changes`.

int sqlite3_changes(
  ffi.Pointer<sqlite3> arg0,
) {
  return   _sqlite3_changes(arg0);
}
final _sqlite3_changes_Dart _sqlite3_changes = _dl.lookupFunction<_sqlite3_changes_C, _sqlite3_changes_Dart>('sqlite3_changes');
typedef _sqlite3_changes_C = int Function(
  ffi.Pointer<sqlite3> arg0,
);
typedef _sqlite3_changes_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
);

/// C function `sqlite3_total_changes`.

int sqlite3_total_changes(
  ffi.Pointer<sqlite3> arg0,
) {
  return   _sqlite3_total_changes(arg0);
}
final _sqlite3_total_changes_Dart _sqlite3_total_changes = _dl.lookupFunction<_sqlite3_total_changes_C, _sqlite3_total_changes_Dart>('sqlite3_total_changes');
typedef _sqlite3_total_changes_C = int Function(
  ffi.Pointer<sqlite3> arg0,
);
typedef _sqlite3_total_changes_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
);

/// C function `sqlite3_interrupt`.

void sqlite3_interrupt(
  ffi.Pointer<sqlite3> arg0,
) {
   _sqlite3_interrupt(arg0);
}
final _sqlite3_interrupt_Dart _sqlite3_interrupt = _dl.lookupFunction<_sqlite3_interrupt_C, _sqlite3_interrupt_Dart>('sqlite3_interrupt');
typedef _sqlite3_interrupt_C = ffi.Void Function(
  ffi.Pointer<sqlite3> arg0,
);
typedef _sqlite3_interrupt_Dart = void Function(
  ffi.Pointer<sqlite3> arg0,
);

/// C function `sqlite3_complete`.

int sqlite3_complete(
  ffi.Pointer<int> sql,
) {
  return   _sqlite3_complete(sql);
}
final _sqlite3_complete_Dart _sqlite3_complete = _dl.lookupFunction<_sqlite3_complete_C, _sqlite3_complete_Dart>('sqlite3_complete');
typedef _sqlite3_complete_C = int Function(
  ffi.Pointer<ffi.Uint8> sql,
);
typedef _sqlite3_complete_Dart = int Function(
  ffi.Pointer<int> sql,
);

/// C function `sqlite3_complete16`.

int sqlite3_complete16(
  ffi.Pointer<void> sql,
) {
  return   _sqlite3_complete16(sql);
}
final _sqlite3_complete16_Dart _sqlite3_complete16 = _dl.lookupFunction<_sqlite3_complete16_C, _sqlite3_complete16_Dart>('sqlite3_complete16');
typedef _sqlite3_complete16_C = int Function(
  ffi.Pointer<ffi.Void> sql,
);
typedef _sqlite3_complete16_Dart = int Function(
  ffi.Pointer<void> sql,
);

/// C function `sqlite3_busy_handler`.

int sqlite3_busy_handler(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *, int) arg1,
  ffi.Pointer<void> arg2,
) {
  return   _sqlite3_busy_handler(arg0, arg1, arg2);
}
final _sqlite3_busy_handler_Dart _sqlite3_busy_handler = _dl.lookupFunction<_sqlite3_busy_handler_C, _sqlite3_busy_handler_Dart>('sqlite3_busy_handler');
typedef _sqlite3_busy_handler_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *, int) arg1,
  ffi.Pointer<ffi.Void> arg2,
);
typedef _sqlite3_busy_handler_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *, int) arg1,
  ffi.Pointer<void> arg2,
);

/// C function `sqlite3_busy_timeout`.

int sqlite3_busy_timeout(
  ffi.Pointer<sqlite3> arg0,
  int ms,
) {
  return   _sqlite3_busy_timeout(arg0, ms);
}
final _sqlite3_busy_timeout_Dart _sqlite3_busy_timeout = _dl.lookupFunction<_sqlite3_busy_timeout_C, _sqlite3_busy_timeout_Dart>('sqlite3_busy_timeout');
typedef _sqlite3_busy_timeout_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  int ms,
);
typedef _sqlite3_busy_timeout_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  int ms,
);

/// C function `sqlite3_get_table`.

int sqlite3_get_table(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zSql,
  ffi.Pointer<ffi.Pointer<ffi.Pointer<int>>> pazResult,
  ffi.Pointer<int> pnRow,
  ffi.Pointer<int> pnColumn,
  ffi.Pointer<ffi.Pointer<int>> pzErrmsg,
) {
  return   _sqlite3_get_table(db, zSql, pazResult, pnRow, pnColumn, pzErrmsg);
}
final _sqlite3_get_table_Dart _sqlite3_get_table = _dl.lookupFunction<_sqlite3_get_table_C, _sqlite3_get_table_Dart>('sqlite3_get_table');
typedef _sqlite3_get_table_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zSql,
  ffi.Pointer<ffi.Pointer<ffi.Pointer<ffi.Uint8>>> pazResult,
  ffi.Pointer<int> pnRow,
  ffi.Pointer<int> pnColumn,
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> pzErrmsg,
);
typedef _sqlite3_get_table_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zSql,
  ffi.Pointer<ffi.Pointer<ffi.Pointer<int>>> pazResult,
  ffi.Pointer<int> pnRow,
  ffi.Pointer<int> pnColumn,
  ffi.Pointer<ffi.Pointer<int>> pzErrmsg,
);

/// C function `sqlite3_free_table`.

void sqlite3_free_table(
  ffi.Pointer<ffi.Pointer<int>> result,
) {
   _sqlite3_free_table(result);
}
final _sqlite3_free_table_Dart _sqlite3_free_table = _dl.lookupFunction<_sqlite3_free_table_C, _sqlite3_free_table_Dart>('sqlite3_free_table');
typedef _sqlite3_free_table_C = ffi.Void Function(
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> result,
);
typedef _sqlite3_free_table_Dart = void Function(
  ffi.Pointer<ffi.Pointer<int>> result,
);

/// C function `sqlite3_mprintf`.

ffi.Pointer<int> sqlite3_mprintf(
  ffi.Pointer<int> arg0,
) {
  return   _sqlite3_mprintf(arg0);
}
final _sqlite3_mprintf_Dart _sqlite3_mprintf = _dl.lookupFunction<_sqlite3_mprintf_C, _sqlite3_mprintf_Dart>('sqlite3_mprintf');
typedef _sqlite3_mprintf_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<ffi.Uint8> arg0,
);
typedef _sqlite3_mprintf_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<int> arg0,
);

/// C function `sqlite3_vmprintf`.

ffi.Pointer<int> sqlite3_vmprintf(
  ffi.Pointer<int> arg0,
  ffi.Pointer<int> arg1,
) {
  return   _sqlite3_vmprintf(arg0, arg1);
}
final _sqlite3_vmprintf_Dart _sqlite3_vmprintf = _dl.lookupFunction<_sqlite3_vmprintf_C, _sqlite3_vmprintf_Dart>('sqlite3_vmprintf');
typedef _sqlite3_vmprintf_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<ffi.Uint8> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
);
typedef _sqlite3_vmprintf_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<int> arg0,
  ffi.Pointer<int> arg1,
);

/// C function `sqlite3_snprintf`.

ffi.Pointer<int> sqlite3_snprintf(
  int arg0,
  ffi.Pointer<int> arg1,
  ffi.Pointer<int> arg2,
) {
  return   _sqlite3_snprintf(arg0, arg1, arg2);
}
final _sqlite3_snprintf_Dart _sqlite3_snprintf = _dl.lookupFunction<_sqlite3_snprintf_C, _sqlite3_snprintf_Dart>('sqlite3_snprintf');
typedef _sqlite3_snprintf_C = ffi.Pointer<ffi.Uint8> Function(
  int arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<ffi.Uint8> arg2,
);
typedef _sqlite3_snprintf_Dart = ffi.Pointer<int> Function(
  int arg0,
  ffi.Pointer<int> arg1,
  ffi.Pointer<int> arg2,
);

/// C function `sqlite3_vsnprintf`.

ffi.Pointer<int> sqlite3_vsnprintf(
  int arg0,
  ffi.Pointer<int> arg1,
  ffi.Pointer<int> arg2,
  ffi.Pointer<int> arg3,
) {
  return   _sqlite3_vsnprintf(arg0, arg1, arg2, arg3);
}
final _sqlite3_vsnprintf_Dart _sqlite3_vsnprintf = _dl.lookupFunction<_sqlite3_vsnprintf_C, _sqlite3_vsnprintf_Dart>('sqlite3_vsnprintf');
typedef _sqlite3_vsnprintf_C = ffi.Pointer<ffi.Uint8> Function(
  int arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  ffi.Pointer<ffi.Uint8> arg2,
  ffi.Pointer<ffi.Uint8> arg3,
);
typedef _sqlite3_vsnprintf_Dart = ffi.Pointer<int> Function(
  int arg0,
  ffi.Pointer<int> arg1,
  ffi.Pointer<int> arg2,
  ffi.Pointer<int> arg3,
);

/// C function `sqlite3_malloc`.

ffi.Pointer<void> sqlite3_malloc(
  int arg0,
) {
  return   _sqlite3_malloc(arg0);
}
final _sqlite3_malloc_Dart _sqlite3_malloc = _dl.lookupFunction<_sqlite3_malloc_C, _sqlite3_malloc_Dart>('sqlite3_malloc');
typedef _sqlite3_malloc_C = ffi.Pointer<ffi.Void> Function(
  int arg0,
);
typedef _sqlite3_malloc_Dart = ffi.Pointer<void> Function(
  int arg0,
);

/// C function `sqlite3_realloc`.

ffi.Pointer<void> sqlite3_realloc(
  ffi.Pointer<void> arg0,
  int arg1,
) {
  return   _sqlite3_realloc(arg0, arg1);
}
final _sqlite3_realloc_Dart _sqlite3_realloc = _dl.lookupFunction<_sqlite3_realloc_C, _sqlite3_realloc_Dart>('sqlite3_realloc');
typedef _sqlite3_realloc_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<ffi.Void> arg0,
  int arg1,
);
typedef _sqlite3_realloc_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<void> arg0,
  int arg1,
);

/// C function `sqlite3_free`.

void sqlite3_free(
  ffi.Pointer<void> arg0,
) {
   _sqlite3_free(arg0);
}
final _sqlite3_free_Dart _sqlite3_free = _dl.lookupFunction<_sqlite3_free_C, _sqlite3_free_Dart>('sqlite3_free');
typedef _sqlite3_free_C = ffi.Void Function(
  ffi.Pointer<ffi.Void> arg0,
);
typedef _sqlite3_free_Dart = void Function(
  ffi.Pointer<void> arg0,
);

/// C function `sqlite3_memory_used`.

long long sqlite3_memory_used() {
  return   _sqlite3_memory_used();
}
final _sqlite3_memory_used_Dart _sqlite3_memory_used = _dl.lookupFunction<_sqlite3_memory_used_C, _sqlite3_memory_used_Dart>('sqlite3_memory_used');
typedef _sqlite3_memory_used_C = long long Function();
typedef _sqlite3_memory_used_Dart = long long Function();

/// C function `sqlite3_memory_highwater`.

long long sqlite3_memory_highwater(
  int resetFlag,
) {
  return   _sqlite3_memory_highwater(resetFlag);
}
final _sqlite3_memory_highwater_Dart _sqlite3_memory_highwater = _dl.lookupFunction<_sqlite3_memory_highwater_C, _sqlite3_memory_highwater_Dart>('sqlite3_memory_highwater');
typedef _sqlite3_memory_highwater_C = long long Function(
  int resetFlag,
);
typedef _sqlite3_memory_highwater_Dart = long long Function(
  int resetFlag,
);

/// C function `sqlite3_randomness`.

void sqlite3_randomness(
  int N,
  ffi.Pointer<void> P,
) {
   _sqlite3_randomness(N, P);
}
final _sqlite3_randomness_Dart _sqlite3_randomness = _dl.lookupFunction<_sqlite3_randomness_C, _sqlite3_randomness_Dart>('sqlite3_randomness');
typedef _sqlite3_randomness_C = ffi.Void Function(
  int N,
  ffi.Pointer<ffi.Void> P,
);
typedef _sqlite3_randomness_Dart = void Function(
  int N,
  ffi.Pointer<void> P,
);

/// C function `sqlite3_set_authorizer`.

int sqlite3_set_authorizer(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *, int,  char *,  char *,  char *,  char *) xAuth,
  ffi.Pointer<void> pUserData,
) {
  return   _sqlite3_set_authorizer(arg0, xAuth, pUserData);
}
final _sqlite3_set_authorizer_Dart _sqlite3_set_authorizer = _dl.lookupFunction<_sqlite3_set_authorizer_C, _sqlite3_set_authorizer_Dart>('sqlite3_set_authorizer');
typedef _sqlite3_set_authorizer_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *, int,  char *,  char *,  char *,  char *) xAuth,
  ffi.Pointer<ffi.Void> pUserData,
);
typedef _sqlite3_set_authorizer_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *, int,  char *,  char *,  char *,  char *) xAuth,
  ffi.Pointer<void> pUserData,
);

/// C function `sqlite3_trace`.

ffi.Pointer<void> sqlite3_trace(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *,  char *) xTrace,
  ffi.Pointer<void> arg2,
) {
  return   _sqlite3_trace(arg0, xTrace, arg2);
}
final _sqlite3_trace_Dart _sqlite3_trace = _dl.lookupFunction<_sqlite3_trace_C, _sqlite3_trace_Dart>('sqlite3_trace');
typedef _sqlite3_trace_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *,  char *) xTrace,
  ffi.Pointer<ffi.Void> arg2,
);
typedef _sqlite3_trace_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *,  char *) xTrace,
  ffi.Pointer<void> arg2,
);

/// C function `sqlite3_profile`.

ffi.Pointer<void> sqlite3_profile(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *,  char *,  long long) xProfile,
  ffi.Pointer<void> arg2,
) {
  return   _sqlite3_profile(arg0, xProfile, arg2);
}
final _sqlite3_profile_Dart _sqlite3_profile = _dl.lookupFunction<_sqlite3_profile_C, _sqlite3_profile_Dart>('sqlite3_profile');
typedef _sqlite3_profile_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *,  char *,  long long) xProfile,
  ffi.Pointer<ffi.Void> arg2,
);
typedef _sqlite3_profile_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *,  char *,  long long) xProfile,
  ffi.Pointer<void> arg2,
);

/// C function `sqlite3_progress_handler`.

void sqlite3_progress_handler(
  ffi.Pointer<sqlite3> arg0,
  int arg1,
  int (*)(void *) arg2,
  ffi.Pointer<void> arg3,
) {
   _sqlite3_progress_handler(arg0, arg1, arg2, arg3);
}
final _sqlite3_progress_handler_Dart _sqlite3_progress_handler = _dl.lookupFunction<_sqlite3_progress_handler_C, _sqlite3_progress_handler_Dart>('sqlite3_progress_handler');
typedef _sqlite3_progress_handler_C = ffi.Void Function(
  ffi.Pointer<sqlite3> arg0,
  int arg1,
  int (*)(void *) arg2,
  ffi.Pointer<ffi.Void> arg3,
);
typedef _sqlite3_progress_handler_Dart = void Function(
  ffi.Pointer<sqlite3> arg0,
  int arg1,
  int (*)(void *) arg2,
  ffi.Pointer<void> arg3,
);

/// C function `sqlite3_open`.

int sqlite3_open(
  ffi.Pointer<int> filename,
  ffi.Pointer<ffi.Pointer<sqlite3>> ppDb,
) {
  return   _sqlite3_open(filename, ppDb);
}
final _sqlite3_open_Dart _sqlite3_open = _dl.lookupFunction<_sqlite3_open_C, _sqlite3_open_Dart>('sqlite3_open');
typedef _sqlite3_open_C = int Function(
  ffi.Pointer<ffi.Uint8> filename,
  ffi.Pointer<ffi.Pointer<sqlite3>> ppDb,
);
typedef _sqlite3_open_Dart = int Function(
  ffi.Pointer<int> filename,
  ffi.Pointer<ffi.Pointer<sqlite3>> ppDb,
);

/// C function `sqlite3_open16`.

int sqlite3_open16(
  ffi.Pointer<void> filename,
  ffi.Pointer<ffi.Pointer<sqlite3>> ppDb,
) {
  return   _sqlite3_open16(filename, ppDb);
}
final _sqlite3_open16_Dart _sqlite3_open16 = _dl.lookupFunction<_sqlite3_open16_C, _sqlite3_open16_Dart>('sqlite3_open16');
typedef _sqlite3_open16_C = int Function(
  ffi.Pointer<ffi.Void> filename,
  ffi.Pointer<ffi.Pointer<sqlite3>> ppDb,
);
typedef _sqlite3_open16_Dart = int Function(
  ffi.Pointer<void> filename,
  ffi.Pointer<ffi.Pointer<sqlite3>> ppDb,
);

/// C function `sqlite3_open_v2`.

int sqlite3_open_v2(
  ffi.Pointer<int> filename,
  ffi.Pointer<ffi.Pointer<sqlite3>> ppDb,
  int flags,
  ffi.Pointer<int> zVfs,
) {
  return   _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}
final _sqlite3_open_v2_Dart _sqlite3_open_v2 = _dl.lookupFunction<_sqlite3_open_v2_C, _sqlite3_open_v2_Dart>('sqlite3_open_v2');
typedef _sqlite3_open_v2_C = int Function(
  ffi.Pointer<ffi.Uint8> filename,
  ffi.Pointer<ffi.Pointer<sqlite3>> ppDb,
  int flags,
  ffi.Pointer<ffi.Uint8> zVfs,
);
typedef _sqlite3_open_v2_Dart = int Function(
  ffi.Pointer<int> filename,
  ffi.Pointer<ffi.Pointer<sqlite3>> ppDb,
  int flags,
  ffi.Pointer<int> zVfs,
);

/// C function `sqlite3_uri_parameter`.

ffi.Pointer<int> sqlite3_uri_parameter(
  ffi.Pointer<int> zFilename,
  ffi.Pointer<int> zParam,
) {
  return   _sqlite3_uri_parameter(zFilename, zParam);
}
final _sqlite3_uri_parameter_Dart _sqlite3_uri_parameter = _dl.lookupFunction<_sqlite3_uri_parameter_C, _sqlite3_uri_parameter_Dart>('sqlite3_uri_parameter');
typedef _sqlite3_uri_parameter_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<ffi.Uint8> zFilename,
  ffi.Pointer<ffi.Uint8> zParam,
);
typedef _sqlite3_uri_parameter_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<int> zFilename,
  ffi.Pointer<int> zParam,
);

/// C function `sqlite3_errcode`.

int sqlite3_errcode(
  ffi.Pointer<sqlite3> db,
) {
  return   _sqlite3_errcode(db);
}
final _sqlite3_errcode_Dart _sqlite3_errcode = _dl.lookupFunction<_sqlite3_errcode_C, _sqlite3_errcode_Dart>('sqlite3_errcode');
typedef _sqlite3_errcode_C = int Function(
  ffi.Pointer<sqlite3> db,
);
typedef _sqlite3_errcode_Dart = int Function(
  ffi.Pointer<sqlite3> db,
);

/// C function `sqlite3_extended_errcode`.

int sqlite3_extended_errcode(
  ffi.Pointer<sqlite3> db,
) {
  return   _sqlite3_extended_errcode(db);
}
final _sqlite3_extended_errcode_Dart _sqlite3_extended_errcode = _dl.lookupFunction<_sqlite3_extended_errcode_C, _sqlite3_extended_errcode_Dart>('sqlite3_extended_errcode');
typedef _sqlite3_extended_errcode_C = int Function(
  ffi.Pointer<sqlite3> db,
);
typedef _sqlite3_extended_errcode_Dart = int Function(
  ffi.Pointer<sqlite3> db,
);

/// C function `sqlite3_errmsg`.

ffi.Pointer<int> sqlite3_errmsg(
  ffi.Pointer<sqlite3> arg0,
) {
  return   _sqlite3_errmsg(arg0);
}
final _sqlite3_errmsg_Dart _sqlite3_errmsg = _dl.lookupFunction<_sqlite3_errmsg_C, _sqlite3_errmsg_Dart>('sqlite3_errmsg');
typedef _sqlite3_errmsg_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<sqlite3> arg0,
);
typedef _sqlite3_errmsg_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<sqlite3> arg0,
);

/// C function `sqlite3_errmsg16`.

ffi.Pointer<void> sqlite3_errmsg16(
  ffi.Pointer<sqlite3> arg0,
) {
  return   _sqlite3_errmsg16(arg0);
}
final _sqlite3_errmsg16_Dart _sqlite3_errmsg16 = _dl.lookupFunction<_sqlite3_errmsg16_C, _sqlite3_errmsg16_Dart>('sqlite3_errmsg16');
typedef _sqlite3_errmsg16_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3> arg0,
);
typedef _sqlite3_errmsg16_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3> arg0,
);

/// C function `sqlite3_limit`.

int sqlite3_limit(
  ffi.Pointer<sqlite3> arg0,
  int id,
  int newVal,
) {
  return   _sqlite3_limit(arg0, id, newVal);
}
final _sqlite3_limit_Dart _sqlite3_limit = _dl.lookupFunction<_sqlite3_limit_C, _sqlite3_limit_Dart>('sqlite3_limit');
typedef _sqlite3_limit_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  int id,
  int newVal,
);
typedef _sqlite3_limit_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  int id,
  int newVal,
);

/// C function `sqlite3_prepare`.

int sqlite3_prepare(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<int>> pzTail,
) {
  return   _sqlite3_prepare(db, zSql, nByte, ppStmt, pzTail);
}
final _sqlite3_prepare_Dart _sqlite3_prepare = _dl.lookupFunction<_sqlite3_prepare_C, _sqlite3_prepare_Dart>('sqlite3_prepare');
typedef _sqlite3_prepare_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> pzTail,
);
typedef _sqlite3_prepare_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<int>> pzTail,
);

/// C function `sqlite3_prepare_v2`.

int sqlite3_prepare_v2(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<int>> pzTail,
) {
  return   _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}
final _sqlite3_prepare_v2_Dart _sqlite3_prepare_v2 = _dl.lookupFunction<_sqlite3_prepare_v2_C, _sqlite3_prepare_v2_Dart>('sqlite3_prepare_v2');
typedef _sqlite3_prepare_v2_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> pzTail,
);
typedef _sqlite3_prepare_v2_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<int>> pzTail,
);

/// C function `sqlite3_prepare16`.

int sqlite3_prepare16(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<void> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<void>> pzTail,
) {
  return   _sqlite3_prepare16(db, zSql, nByte, ppStmt, pzTail);
}
final _sqlite3_prepare16_Dart _sqlite3_prepare16 = _dl.lookupFunction<_sqlite3_prepare16_C, _sqlite3_prepare16_Dart>('sqlite3_prepare16');
typedef _sqlite3_prepare16_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Void> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<ffi.Void>> pzTail,
);
typedef _sqlite3_prepare16_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<void> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<void>> pzTail,
);

/// C function `sqlite3_prepare16_v2`.

int sqlite3_prepare16_v2(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<void> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<void>> pzTail,
) {
  return   _sqlite3_prepare16_v2(db, zSql, nByte, ppStmt, pzTail);
}
final _sqlite3_prepare16_v2_Dart _sqlite3_prepare16_v2 = _dl.lookupFunction<_sqlite3_prepare16_v2_C, _sqlite3_prepare16_v2_Dart>('sqlite3_prepare16_v2');
typedef _sqlite3_prepare16_v2_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Void> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<ffi.Void>> pzTail,
);
typedef _sqlite3_prepare16_v2_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<void> zSql,
  int nByte,
  ffi.Pointer<ffi.Pointer<sqlite3_stmt>> ppStmt,
  ffi.Pointer<ffi.Pointer<void>> pzTail,
);

/// C function `sqlite3_sql`.

ffi.Pointer<int> sqlite3_sql(
  ffi.Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_sql(pStmt);
}
final _sqlite3_sql_Dart _sqlite3_sql = _dl.lookupFunction<_sqlite3_sql_C, _sqlite3_sql_Dart>('sqlite3_sql');
typedef _sqlite3_sql_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_sql_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_stmt_readonly`.

int sqlite3_stmt_readonly(
  ffi.Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_stmt_readonly(pStmt);
}
final _sqlite3_stmt_readonly_Dart _sqlite3_stmt_readonly = _dl.lookupFunction<_sqlite3_stmt_readonly_C, _sqlite3_stmt_readonly_Dart>('sqlite3_stmt_readonly');
typedef _sqlite3_stmt_readonly_C = int Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_stmt_readonly_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_bind_blob`.

int sqlite3_bind_blob(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<void> arg2,
  int n,
  void (*)(void *) arg4,
) {
  return   _sqlite3_bind_blob(arg0, arg1, arg2, n, arg4);
}
final _sqlite3_bind_blob_Dart _sqlite3_bind_blob = _dl.lookupFunction<_sqlite3_bind_blob_C, _sqlite3_bind_blob_Dart>('sqlite3_bind_blob');
typedef _sqlite3_bind_blob_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<ffi.Void> arg2,
  int n,
  void (*)(void *) arg4,
);
typedef _sqlite3_bind_blob_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<void> arg2,
  int n,
  void (*)(void *) arg4,
);

/// C function `sqlite3_bind_double`.

int sqlite3_bind_double(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  double arg2,
) {
  return   _sqlite3_bind_double(arg0, arg1, arg2);
}
final _sqlite3_bind_double_Dart _sqlite3_bind_double = _dl.lookupFunction<_sqlite3_bind_double_C, _sqlite3_bind_double_Dart>('sqlite3_bind_double');
typedef _sqlite3_bind_double_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Double arg2,
);
typedef _sqlite3_bind_double_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  double arg2,
);

/// C function `sqlite3_bind_int`.

int sqlite3_bind_int(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  int arg2,
) {
  return   _sqlite3_bind_int(arg0, arg1, arg2);
}
final _sqlite3_bind_int_Dart _sqlite3_bind_int = _dl.lookupFunction<_sqlite3_bind_int_C, _sqlite3_bind_int_Dart>('sqlite3_bind_int');
typedef _sqlite3_bind_int_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  int arg2,
);
typedef _sqlite3_bind_int_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  int arg2,
);

/// C function `sqlite3_bind_int64`.

int sqlite3_bind_int64(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  long long arg2,
) {
  return   _sqlite3_bind_int64(arg0, arg1, arg2);
}
final _sqlite3_bind_int64_Dart _sqlite3_bind_int64 = _dl.lookupFunction<_sqlite3_bind_int64_C, _sqlite3_bind_int64_Dart>('sqlite3_bind_int64');
typedef _sqlite3_bind_int64_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  long long arg2,
);
typedef _sqlite3_bind_int64_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  long long arg2,
);

/// C function `sqlite3_bind_null`.

int sqlite3_bind_null(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_bind_null(arg0, arg1);
}
final _sqlite3_bind_null_Dart _sqlite3_bind_null = _dl.lookupFunction<_sqlite3_bind_null_C, _sqlite3_bind_null_Dart>('sqlite3_bind_null');
typedef _sqlite3_bind_null_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);
typedef _sqlite3_bind_null_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_bind_text`.

int sqlite3_bind_text(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<int> arg2,
  int n,
  void (*)(void *) arg4,
) {
  return   _sqlite3_bind_text(arg0, arg1, arg2, n, arg4);
}
final _sqlite3_bind_text_Dart _sqlite3_bind_text = _dl.lookupFunction<_sqlite3_bind_text_C, _sqlite3_bind_text_Dart>('sqlite3_bind_text');
typedef _sqlite3_bind_text_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<ffi.Uint8> arg2,
  int n,
  void (*)(void *) arg4,
);
typedef _sqlite3_bind_text_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<int> arg2,
  int n,
  void (*)(void *) arg4,
);

/// C function `sqlite3_bind_text16`.

int sqlite3_bind_text16(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<void> arg2,
  int arg3,
  void (*)(void *) arg4,
) {
  return   _sqlite3_bind_text16(arg0, arg1, arg2, arg3, arg4);
}
final _sqlite3_bind_text16_Dart _sqlite3_bind_text16 = _dl.lookupFunction<_sqlite3_bind_text16_C, _sqlite3_bind_text16_Dart>('sqlite3_bind_text16');
typedef _sqlite3_bind_text16_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<ffi.Void> arg2,
  int arg3,
  void (*)(void *) arg4,
);
typedef _sqlite3_bind_text16_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<void> arg2,
  int arg3,
  void (*)(void *) arg4,
);

/// C function `sqlite3_bind_value`.

int sqlite3_bind_value(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<mem> arg2,
) {
  return   _sqlite3_bind_value(arg0, arg1, arg2);
}
final _sqlite3_bind_value_Dart _sqlite3_bind_value = _dl.lookupFunction<_sqlite3_bind_value_C, _sqlite3_bind_value_Dart>('sqlite3_bind_value');
typedef _sqlite3_bind_value_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<mem> arg2,
);
typedef _sqlite3_bind_value_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  ffi.Pointer<mem> arg2,
);

/// C function `sqlite3_bind_zeroblob`.

int sqlite3_bind_zeroblob(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  int n,
) {
  return   _sqlite3_bind_zeroblob(arg0, arg1, n);
}
final _sqlite3_bind_zeroblob_Dart _sqlite3_bind_zeroblob = _dl.lookupFunction<_sqlite3_bind_zeroblob_C, _sqlite3_bind_zeroblob_Dart>('sqlite3_bind_zeroblob');
typedef _sqlite3_bind_zeroblob_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  int n,
);
typedef _sqlite3_bind_zeroblob_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
  int n,
);

/// C function `sqlite3_bind_parameter_count`.

int sqlite3_bind_parameter_count(
  ffi.Pointer<sqlite3_stmt> arg0,
) {
  return   _sqlite3_bind_parameter_count(arg0);
}
final _sqlite3_bind_parameter_count_Dart _sqlite3_bind_parameter_count = _dl.lookupFunction<_sqlite3_bind_parameter_count_C, _sqlite3_bind_parameter_count_Dart>('sqlite3_bind_parameter_count');
typedef _sqlite3_bind_parameter_count_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
);
typedef _sqlite3_bind_parameter_count_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
);

/// C function `sqlite3_bind_parameter_name`.

ffi.Pointer<int> sqlite3_bind_parameter_name(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_bind_parameter_name(arg0, arg1);
}
final _sqlite3_bind_parameter_name_Dart _sqlite3_bind_parameter_name = _dl.lookupFunction<_sqlite3_bind_parameter_name_C, _sqlite3_bind_parameter_name_Dart>('sqlite3_bind_parameter_name');
typedef _sqlite3_bind_parameter_name_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);
typedef _sqlite3_bind_parameter_name_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_bind_parameter_index`.

int sqlite3_bind_parameter_index(
  ffi.Pointer<sqlite3_stmt> arg0,
  ffi.Pointer<int> zName,
) {
  return   _sqlite3_bind_parameter_index(arg0, zName);
}
final _sqlite3_bind_parameter_index_Dart _sqlite3_bind_parameter_index = _dl.lookupFunction<_sqlite3_bind_parameter_index_C, _sqlite3_bind_parameter_index_Dart>('sqlite3_bind_parameter_index');
typedef _sqlite3_bind_parameter_index_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  ffi.Pointer<ffi.Uint8> zName,
);
typedef _sqlite3_bind_parameter_index_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  ffi.Pointer<int> zName,
);

/// C function `sqlite3_clear_bindings`.

int sqlite3_clear_bindings(
  ffi.Pointer<sqlite3_stmt> arg0,
) {
  return   _sqlite3_clear_bindings(arg0);
}
final _sqlite3_clear_bindings_Dart _sqlite3_clear_bindings = _dl.lookupFunction<_sqlite3_clear_bindings_C, _sqlite3_clear_bindings_Dart>('sqlite3_clear_bindings');
typedef _sqlite3_clear_bindings_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
);
typedef _sqlite3_clear_bindings_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
);

/// C function `sqlite3_column_count`.

int sqlite3_column_count(
  ffi.Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_column_count(pStmt);
}
final _sqlite3_column_count_Dart _sqlite3_column_count = _dl.lookupFunction<_sqlite3_column_count_C, _sqlite3_column_count_Dart>('sqlite3_column_count');
typedef _sqlite3_column_count_C = int Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_column_count_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_column_name`.

ffi.Pointer<int> sqlite3_column_name(
  ffi.Pointer<sqlite3_stmt> arg0,
  int N,
) {
  return   _sqlite3_column_name(arg0, N);
}
final _sqlite3_column_name_Dart _sqlite3_column_name = _dl.lookupFunction<_sqlite3_column_name_C, _sqlite3_column_name_Dart>('sqlite3_column_name');
typedef _sqlite3_column_name_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int N,
);
typedef _sqlite3_column_name_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int N,
);

/// C function `sqlite3_column_name16`.

ffi.Pointer<void> sqlite3_column_name16(
  ffi.Pointer<sqlite3_stmt> arg0,
  int N,
) {
  return   _sqlite3_column_name16(arg0, N);
}
final _sqlite3_column_name16_Dart _sqlite3_column_name16 = _dl.lookupFunction<_sqlite3_column_name16_C, _sqlite3_column_name16_Dart>('sqlite3_column_name16');
typedef _sqlite3_column_name16_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int N,
);
typedef _sqlite3_column_name16_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int N,
);

/// C function `sqlite3_column_database_name`.

ffi.Pointer<int> sqlite3_column_database_name(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_database_name(arg0, arg1);
}
final _sqlite3_column_database_name_Dart _sqlite3_column_database_name = _dl.lookupFunction<_sqlite3_column_database_name_C, _sqlite3_column_database_name_Dart>('sqlite3_column_database_name');
typedef _sqlite3_column_database_name_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);
typedef _sqlite3_column_database_name_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_database_name16`.

ffi.Pointer<void> sqlite3_column_database_name16(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_database_name16(arg0, arg1);
}
final _sqlite3_column_database_name16_Dart _sqlite3_column_database_name16 = _dl.lookupFunction<_sqlite3_column_database_name16_C, _sqlite3_column_database_name16_Dart>('sqlite3_column_database_name16');
typedef _sqlite3_column_database_name16_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);
typedef _sqlite3_column_database_name16_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_table_name`.

ffi.Pointer<int> sqlite3_column_table_name(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_table_name(arg0, arg1);
}
final _sqlite3_column_table_name_Dart _sqlite3_column_table_name = _dl.lookupFunction<_sqlite3_column_table_name_C, _sqlite3_column_table_name_Dart>('sqlite3_column_table_name');
typedef _sqlite3_column_table_name_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);
typedef _sqlite3_column_table_name_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_table_name16`.

ffi.Pointer<void> sqlite3_column_table_name16(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_table_name16(arg0, arg1);
}
final _sqlite3_column_table_name16_Dart _sqlite3_column_table_name16 = _dl.lookupFunction<_sqlite3_column_table_name16_C, _sqlite3_column_table_name16_Dart>('sqlite3_column_table_name16');
typedef _sqlite3_column_table_name16_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);
typedef _sqlite3_column_table_name16_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_origin_name`.

ffi.Pointer<int> sqlite3_column_origin_name(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_origin_name(arg0, arg1);
}
final _sqlite3_column_origin_name_Dart _sqlite3_column_origin_name = _dl.lookupFunction<_sqlite3_column_origin_name_C, _sqlite3_column_origin_name_Dart>('sqlite3_column_origin_name');
typedef _sqlite3_column_origin_name_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);
typedef _sqlite3_column_origin_name_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_origin_name16`.

ffi.Pointer<void> sqlite3_column_origin_name16(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_origin_name16(arg0, arg1);
}
final _sqlite3_column_origin_name16_Dart _sqlite3_column_origin_name16 = _dl.lookupFunction<_sqlite3_column_origin_name16_C, _sqlite3_column_origin_name16_Dart>('sqlite3_column_origin_name16');
typedef _sqlite3_column_origin_name16_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);
typedef _sqlite3_column_origin_name16_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_decltype`.

ffi.Pointer<int> sqlite3_column_decltype(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_decltype(arg0, arg1);
}
final _sqlite3_column_decltype_Dart _sqlite3_column_decltype = _dl.lookupFunction<_sqlite3_column_decltype_C, _sqlite3_column_decltype_Dart>('sqlite3_column_decltype');
typedef _sqlite3_column_decltype_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);
typedef _sqlite3_column_decltype_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_column_decltype16`.

ffi.Pointer<void> sqlite3_column_decltype16(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
) {
  return   _sqlite3_column_decltype16(arg0, arg1);
}
final _sqlite3_column_decltype16_Dart _sqlite3_column_decltype16 = _dl.lookupFunction<_sqlite3_column_decltype16_C, _sqlite3_column_decltype16_Dart>('sqlite3_column_decltype16');
typedef _sqlite3_column_decltype16_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);
typedef _sqlite3_column_decltype16_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int arg1,
);

/// C function `sqlite3_step`.

int sqlite3_step(
  ffi.Pointer<sqlite3_stmt> arg0,
) {
  return   _sqlite3_step(arg0);
}
final _sqlite3_step_Dart _sqlite3_step = _dl.lookupFunction<_sqlite3_step_C, _sqlite3_step_Dart>('sqlite3_step');
typedef _sqlite3_step_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
);
typedef _sqlite3_step_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
);

/// C function `sqlite3_data_count`.

int sqlite3_data_count(
  ffi.Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_data_count(pStmt);
}
final _sqlite3_data_count_Dart _sqlite3_data_count = _dl.lookupFunction<_sqlite3_data_count_C, _sqlite3_data_count_Dart>('sqlite3_data_count');
typedef _sqlite3_data_count_C = int Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_data_count_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_column_blob`.

ffi.Pointer<void> sqlite3_column_blob(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_blob(arg0, iCol);
}
final _sqlite3_column_blob_Dart _sqlite3_column_blob = _dl.lookupFunction<_sqlite3_column_blob_C, _sqlite3_column_blob_Dart>('sqlite3_column_blob');
typedef _sqlite3_column_blob_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);
typedef _sqlite3_column_blob_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_bytes`.

int sqlite3_column_bytes(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_bytes(arg0, iCol);
}
final _sqlite3_column_bytes_Dart _sqlite3_column_bytes = _dl.lookupFunction<_sqlite3_column_bytes_C, _sqlite3_column_bytes_Dart>('sqlite3_column_bytes');
typedef _sqlite3_column_bytes_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);
typedef _sqlite3_column_bytes_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_bytes16`.

int sqlite3_column_bytes16(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_bytes16(arg0, iCol);
}
final _sqlite3_column_bytes16_Dart _sqlite3_column_bytes16 = _dl.lookupFunction<_sqlite3_column_bytes16_C, _sqlite3_column_bytes16_Dart>('sqlite3_column_bytes16');
typedef _sqlite3_column_bytes16_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);
typedef _sqlite3_column_bytes16_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_double`.

double sqlite3_column_double(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_double(arg0, iCol);
}
final _sqlite3_column_double_Dart _sqlite3_column_double = _dl.lookupFunction<_sqlite3_column_double_C, _sqlite3_column_double_Dart>('sqlite3_column_double');
typedef _sqlite3_column_double_C = ffi.Double Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);
typedef _sqlite3_column_double_Dart = double Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_int`.

int sqlite3_column_int(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_int(arg0, iCol);
}
final _sqlite3_column_int_Dart _sqlite3_column_int = _dl.lookupFunction<_sqlite3_column_int_C, _sqlite3_column_int_Dart>('sqlite3_column_int');
typedef _sqlite3_column_int_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);
typedef _sqlite3_column_int_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_int64`.

long long sqlite3_column_int64(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_int64(arg0, iCol);
}
final _sqlite3_column_int64_Dart _sqlite3_column_int64 = _dl.lookupFunction<_sqlite3_column_int64_C, _sqlite3_column_int64_Dart>('sqlite3_column_int64');
typedef _sqlite3_column_int64_C = long long Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);
typedef _sqlite3_column_int64_Dart = long long Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_text`.

ffi.Pointer<int> sqlite3_column_text(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_text(arg0, iCol);
}
final _sqlite3_column_text_Dart _sqlite3_column_text = _dl.lookupFunction<_sqlite3_column_text_C, _sqlite3_column_text_Dart>('sqlite3_column_text');
typedef _sqlite3_column_text_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);
typedef _sqlite3_column_text_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_text16`.

ffi.Pointer<void> sqlite3_column_text16(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_text16(arg0, iCol);
}
final _sqlite3_column_text16_Dart _sqlite3_column_text16 = _dl.lookupFunction<_sqlite3_column_text16_C, _sqlite3_column_text16_Dart>('sqlite3_column_text16');
typedef _sqlite3_column_text16_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);
typedef _sqlite3_column_text16_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_type`.

int sqlite3_column_type(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_type(arg0, iCol);
}
final _sqlite3_column_type_Dart _sqlite3_column_type = _dl.lookupFunction<_sqlite3_column_type_C, _sqlite3_column_type_Dart>('sqlite3_column_type');
typedef _sqlite3_column_type_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);
typedef _sqlite3_column_type_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_column_value`.

ffi.Pointer<mem> sqlite3_column_value(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
) {
  return   _sqlite3_column_value(arg0, iCol);
}
final _sqlite3_column_value_Dart _sqlite3_column_value = _dl.lookupFunction<_sqlite3_column_value_C, _sqlite3_column_value_Dart>('sqlite3_column_value');
typedef _sqlite3_column_value_C = ffi.Pointer<mem> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);
typedef _sqlite3_column_value_Dart = ffi.Pointer<mem> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int iCol,
);

/// C function `sqlite3_finalize`.

int sqlite3_finalize(
  ffi.Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_finalize(pStmt);
}
final _sqlite3_finalize_Dart _sqlite3_finalize = _dl.lookupFunction<_sqlite3_finalize_C, _sqlite3_finalize_Dart>('sqlite3_finalize');
typedef _sqlite3_finalize_C = int Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_finalize_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_reset`.

int sqlite3_reset(
  ffi.Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_reset(pStmt);
}
final _sqlite3_reset_Dart _sqlite3_reset = _dl.lookupFunction<_sqlite3_reset_C, _sqlite3_reset_Dart>('sqlite3_reset');
typedef _sqlite3_reset_C = int Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_reset_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_create_function`.

int sqlite3_create_function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zFunctionName,
  int nArg,
  int eTextRep,
  ffi.Pointer<void> pApp,
  void (*)( sqlite3_context *, int,  mem **) xFunc,
  void (*)( sqlite3_context *, int,  mem **) xStep,
  void (*)( sqlite3_context *) xFinal,
) {
  return   _sqlite3_create_function(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal);
}
final _sqlite3_create_function_Dart _sqlite3_create_function = _dl.lookupFunction<_sqlite3_create_function_C, _sqlite3_create_function_Dart>('sqlite3_create_function');
typedef _sqlite3_create_function_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zFunctionName,
  int nArg,
  int eTextRep,
  ffi.Pointer<ffi.Void> pApp,
  void (*)( sqlite3_context *, int,  mem **) xFunc,
  void (*)( sqlite3_context *, int,  mem **) xStep,
  void (*)( sqlite3_context *) xFinal,
);
typedef _sqlite3_create_function_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zFunctionName,
  int nArg,
  int eTextRep,
  ffi.Pointer<void> pApp,
  void (*)( sqlite3_context *, int,  mem **) xFunc,
  void (*)( sqlite3_context *, int,  mem **) xStep,
  void (*)( sqlite3_context *) xFinal,
);

/// C function `sqlite3_create_function16`.

int sqlite3_create_function16(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<void> zFunctionName,
  int nArg,
  int eTextRep,
  ffi.Pointer<void> pApp,
  void (*)( sqlite3_context *, int,  mem **) xFunc,
  void (*)( sqlite3_context *, int,  mem **) xStep,
  void (*)( sqlite3_context *) xFinal,
) {
  return   _sqlite3_create_function16(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal);
}
final _sqlite3_create_function16_Dart _sqlite3_create_function16 = _dl.lookupFunction<_sqlite3_create_function16_C, _sqlite3_create_function16_Dart>('sqlite3_create_function16');
typedef _sqlite3_create_function16_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Void> zFunctionName,
  int nArg,
  int eTextRep,
  ffi.Pointer<ffi.Void> pApp,
  void (*)( sqlite3_context *, int,  mem **) xFunc,
  void (*)( sqlite3_context *, int,  mem **) xStep,
  void (*)( sqlite3_context *) xFinal,
);
typedef _sqlite3_create_function16_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<void> zFunctionName,
  int nArg,
  int eTextRep,
  ffi.Pointer<void> pApp,
  void (*)( sqlite3_context *, int,  mem **) xFunc,
  void (*)( sqlite3_context *, int,  mem **) xStep,
  void (*)( sqlite3_context *) xFinal,
);

/// C function `sqlite3_create_function_v2`.

int sqlite3_create_function_v2(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zFunctionName,
  int nArg,
  int eTextRep,
  ffi.Pointer<void> pApp,
  void (*)( sqlite3_context *, int,  mem **) xFunc,
  void (*)( sqlite3_context *, int,  mem **) xStep,
  void (*)( sqlite3_context *) xFinal,
  void (*)(void *) xDestroy,
) {
  return   _sqlite3_create_function_v2(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal, xDestroy);
}
final _sqlite3_create_function_v2_Dart _sqlite3_create_function_v2 = _dl.lookupFunction<_sqlite3_create_function_v2_C, _sqlite3_create_function_v2_Dart>('sqlite3_create_function_v2');
typedef _sqlite3_create_function_v2_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zFunctionName,
  int nArg,
  int eTextRep,
  ffi.Pointer<ffi.Void> pApp,
  void (*)( sqlite3_context *, int,  mem **) xFunc,
  void (*)( sqlite3_context *, int,  mem **) xStep,
  void (*)( sqlite3_context *) xFinal,
  void (*)(void *) xDestroy,
);
typedef _sqlite3_create_function_v2_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zFunctionName,
  int nArg,
  int eTextRep,
  ffi.Pointer<void> pApp,
  void (*)( sqlite3_context *, int,  mem **) xFunc,
  void (*)( sqlite3_context *, int,  mem **) xStep,
  void (*)( sqlite3_context *) xFinal,
  void (*)(void *) xDestroy,
);

/// C function `sqlite3_aggregate_count`.

int sqlite3_aggregate_count(
  ffi.Pointer<sqlite3_context> arg0,
) {
  return   _sqlite3_aggregate_count(arg0);
}
final _sqlite3_aggregate_count_Dart _sqlite3_aggregate_count = _dl.lookupFunction<_sqlite3_aggregate_count_C, _sqlite3_aggregate_count_Dart>('sqlite3_aggregate_count');
typedef _sqlite3_aggregate_count_C = int Function(
  ffi.Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_aggregate_count_Dart = int Function(
  ffi.Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_expired`.

int sqlite3_expired(
  ffi.Pointer<sqlite3_stmt> arg0,
) {
  return   _sqlite3_expired(arg0);
}
final _sqlite3_expired_Dart _sqlite3_expired = _dl.lookupFunction<_sqlite3_expired_C, _sqlite3_expired_Dart>('sqlite3_expired');
typedef _sqlite3_expired_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
);
typedef _sqlite3_expired_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
);

/// C function `sqlite3_transfer_bindings`.

int sqlite3_transfer_bindings(
  ffi.Pointer<sqlite3_stmt> arg0,
  ffi.Pointer<sqlite3_stmt> arg1,
) {
  return   _sqlite3_transfer_bindings(arg0, arg1);
}
final _sqlite3_transfer_bindings_Dart _sqlite3_transfer_bindings = _dl.lookupFunction<_sqlite3_transfer_bindings_C, _sqlite3_transfer_bindings_Dart>('sqlite3_transfer_bindings');
typedef _sqlite3_transfer_bindings_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  ffi.Pointer<sqlite3_stmt> arg1,
);
typedef _sqlite3_transfer_bindings_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  ffi.Pointer<sqlite3_stmt> arg1,
);

/// C function `sqlite3_global_recover`.

int sqlite3_global_recover() {
  return   _sqlite3_global_recover();
}
final _sqlite3_global_recover_Dart _sqlite3_global_recover = _dl.lookupFunction<_sqlite3_global_recover_C, _sqlite3_global_recover_Dart>('sqlite3_global_recover');
typedef _sqlite3_global_recover_C = int Function();
typedef _sqlite3_global_recover_Dart = int Function();

/// C function `sqlite3_thread_cleanup`.

void sqlite3_thread_cleanup() {
   _sqlite3_thread_cleanup();
}
final _sqlite3_thread_cleanup_Dart _sqlite3_thread_cleanup = _dl.lookupFunction<_sqlite3_thread_cleanup_C, _sqlite3_thread_cleanup_Dart>('sqlite3_thread_cleanup');
typedef _sqlite3_thread_cleanup_C = ffi.Void Function();
typedef _sqlite3_thread_cleanup_Dart = void Function();

/// C function `sqlite3_memory_alarm`.

int sqlite3_memory_alarm(
  void (*)(void *, long long, int) arg0,
  ffi.Pointer<void> arg1,
  long long arg2,
) {
  return   _sqlite3_memory_alarm(arg0, arg1, arg2);
}
final _sqlite3_memory_alarm_Dart _sqlite3_memory_alarm = _dl.lookupFunction<_sqlite3_memory_alarm_C, _sqlite3_memory_alarm_Dart>('sqlite3_memory_alarm');
typedef _sqlite3_memory_alarm_C = int Function(
  void (*)(void *, long long, int) arg0,
  ffi.Pointer<ffi.Void> arg1,
  long long arg2,
);
typedef _sqlite3_memory_alarm_Dart = int Function(
  void (*)(void *, long long, int) arg0,
  ffi.Pointer<void> arg1,
  long long arg2,
);

/// C function `sqlite3_value_blob`.

ffi.Pointer<void> sqlite3_value_blob(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_blob(arg0);
}
final _sqlite3_value_blob_Dart _sqlite3_value_blob = _dl.lookupFunction<_sqlite3_value_blob_C, _sqlite3_value_blob_Dart>('sqlite3_value_blob');
typedef _sqlite3_value_blob_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_blob_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_bytes`.

int sqlite3_value_bytes(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_bytes(arg0);
}
final _sqlite3_value_bytes_Dart _sqlite3_value_bytes = _dl.lookupFunction<_sqlite3_value_bytes_C, _sqlite3_value_bytes_Dart>('sqlite3_value_bytes');
typedef _sqlite3_value_bytes_C = int Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_bytes_Dart = int Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_bytes16`.

int sqlite3_value_bytes16(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_bytes16(arg0);
}
final _sqlite3_value_bytes16_Dart _sqlite3_value_bytes16 = _dl.lookupFunction<_sqlite3_value_bytes16_C, _sqlite3_value_bytes16_Dart>('sqlite3_value_bytes16');
typedef _sqlite3_value_bytes16_C = int Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_bytes16_Dart = int Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_double`.

double sqlite3_value_double(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_double(arg0);
}
final _sqlite3_value_double_Dart _sqlite3_value_double = _dl.lookupFunction<_sqlite3_value_double_C, _sqlite3_value_double_Dart>('sqlite3_value_double');
typedef _sqlite3_value_double_C = ffi.Double Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_double_Dart = double Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_int`.

int sqlite3_value_int(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_int(arg0);
}
final _sqlite3_value_int_Dart _sqlite3_value_int = _dl.lookupFunction<_sqlite3_value_int_C, _sqlite3_value_int_Dart>('sqlite3_value_int');
typedef _sqlite3_value_int_C = int Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_int_Dart = int Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_int64`.

long long sqlite3_value_int64(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_int64(arg0);
}
final _sqlite3_value_int64_Dart _sqlite3_value_int64 = _dl.lookupFunction<_sqlite3_value_int64_C, _sqlite3_value_int64_Dart>('sqlite3_value_int64');
typedef _sqlite3_value_int64_C = long long Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_int64_Dart = long long Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_text`.

ffi.Pointer<int> sqlite3_value_text(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_text(arg0);
}
final _sqlite3_value_text_Dart _sqlite3_value_text = _dl.lookupFunction<_sqlite3_value_text_C, _sqlite3_value_text_Dart>('sqlite3_value_text');
typedef _sqlite3_value_text_C = ffi.Pointer<ffi.Uint8> Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_text_Dart = ffi.Pointer<int> Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_text16`.

ffi.Pointer<void> sqlite3_value_text16(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_text16(arg0);
}
final _sqlite3_value_text16_Dart _sqlite3_value_text16 = _dl.lookupFunction<_sqlite3_value_text16_C, _sqlite3_value_text16_Dart>('sqlite3_value_text16');
typedef _sqlite3_value_text16_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_text16_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_text16le`.

ffi.Pointer<void> sqlite3_value_text16le(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_text16le(arg0);
}
final _sqlite3_value_text16le_Dart _sqlite3_value_text16le = _dl.lookupFunction<_sqlite3_value_text16le_C, _sqlite3_value_text16le_Dart>('sqlite3_value_text16le');
typedef _sqlite3_value_text16le_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_text16le_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_text16be`.

ffi.Pointer<void> sqlite3_value_text16be(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_text16be(arg0);
}
final _sqlite3_value_text16be_Dart _sqlite3_value_text16be = _dl.lookupFunction<_sqlite3_value_text16be_C, _sqlite3_value_text16be_Dart>('sqlite3_value_text16be');
typedef _sqlite3_value_text16be_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_text16be_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_type`.

int sqlite3_value_type(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_type(arg0);
}
final _sqlite3_value_type_Dart _sqlite3_value_type = _dl.lookupFunction<_sqlite3_value_type_C, _sqlite3_value_type_Dart>('sqlite3_value_type');
typedef _sqlite3_value_type_C = int Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_type_Dart = int Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_value_numeric_type`.

int sqlite3_value_numeric_type(
  ffi.Pointer<mem> arg0,
) {
  return   _sqlite3_value_numeric_type(arg0);
}
final _sqlite3_value_numeric_type_Dart _sqlite3_value_numeric_type = _dl.lookupFunction<_sqlite3_value_numeric_type_C, _sqlite3_value_numeric_type_Dart>('sqlite3_value_numeric_type');
typedef _sqlite3_value_numeric_type_C = int Function(
  ffi.Pointer<mem> arg0,
);
typedef _sqlite3_value_numeric_type_Dart = int Function(
  ffi.Pointer<mem> arg0,
);

/// C function `sqlite3_aggregate_context`.

ffi.Pointer<void> sqlite3_aggregate_context(
  ffi.Pointer<sqlite3_context> arg0,
  int nBytes,
) {
  return   _sqlite3_aggregate_context(arg0, nBytes);
}
final _sqlite3_aggregate_context_Dart _sqlite3_aggregate_context = _dl.lookupFunction<_sqlite3_aggregate_context_C, _sqlite3_aggregate_context_Dart>('sqlite3_aggregate_context');
typedef _sqlite3_aggregate_context_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3_context> arg0,
  int nBytes,
);
typedef _sqlite3_aggregate_context_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3_context> arg0,
  int nBytes,
);

/// C function `sqlite3_user_data`.

ffi.Pointer<void> sqlite3_user_data(
  ffi.Pointer<sqlite3_context> arg0,
) {
  return   _sqlite3_user_data(arg0);
}
final _sqlite3_user_data_Dart _sqlite3_user_data = _dl.lookupFunction<_sqlite3_user_data_C, _sqlite3_user_data_Dart>('sqlite3_user_data');
typedef _sqlite3_user_data_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_user_data_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_context_db_handle`.

ffi.Pointer<sqlite3> sqlite3_context_db_handle(
  ffi.Pointer<sqlite3_context> arg0,
) {
  return   _sqlite3_context_db_handle(arg0);
}
final _sqlite3_context_db_handle_Dart _sqlite3_context_db_handle = _dl.lookupFunction<_sqlite3_context_db_handle_C, _sqlite3_context_db_handle_Dart>('sqlite3_context_db_handle');
typedef _sqlite3_context_db_handle_C = ffi.Pointer<sqlite3> Function(
  ffi.Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_context_db_handle_Dart = ffi.Pointer<sqlite3> Function(
  ffi.Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_get_auxdata`.

ffi.Pointer<void> sqlite3_get_auxdata(
  ffi.Pointer<sqlite3_context> arg0,
  int N,
) {
  return   _sqlite3_get_auxdata(arg0, N);
}
final _sqlite3_get_auxdata_Dart _sqlite3_get_auxdata = _dl.lookupFunction<_sqlite3_get_auxdata_C, _sqlite3_get_auxdata_Dart>('sqlite3_get_auxdata');
typedef _sqlite3_get_auxdata_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3_context> arg0,
  int N,
);
typedef _sqlite3_get_auxdata_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3_context> arg0,
  int N,
);

/// C function `sqlite3_set_auxdata`.

void sqlite3_set_auxdata(
  ffi.Pointer<sqlite3_context> arg0,
  int N,
  ffi.Pointer<void> arg2,
  void (*)(void *) arg3,
) {
   _sqlite3_set_auxdata(arg0, N, arg2, arg3);
}
final _sqlite3_set_auxdata_Dart _sqlite3_set_auxdata = _dl.lookupFunction<_sqlite3_set_auxdata_C, _sqlite3_set_auxdata_Dart>('sqlite3_set_auxdata');
typedef _sqlite3_set_auxdata_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  int N,
  ffi.Pointer<ffi.Void> arg2,
  void (*)(void *) arg3,
);
typedef _sqlite3_set_auxdata_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  int N,
  ffi.Pointer<void> arg2,
  void (*)(void *) arg3,
);

/// C function `sqlite3_result_blob`.

void sqlite3_result_blob(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<void> arg1,
  int arg2,
  void (*)(void *) arg3,
) {
   _sqlite3_result_blob(arg0, arg1, arg2, arg3);
}
final _sqlite3_result_blob_Dart _sqlite3_result_blob = _dl.lookupFunction<_sqlite3_result_blob_C, _sqlite3_result_blob_Dart>('sqlite3_result_blob');
typedef _sqlite3_result_blob_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<ffi.Void> arg1,
  int arg2,
  void (*)(void *) arg3,
);
typedef _sqlite3_result_blob_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<void> arg1,
  int arg2,
  void (*)(void *) arg3,
);

/// C function `sqlite3_result_double`.

void sqlite3_result_double(
  ffi.Pointer<sqlite3_context> arg0,
  double arg1,
) {
   _sqlite3_result_double(arg0, arg1);
}
final _sqlite3_result_double_Dart _sqlite3_result_double = _dl.lookupFunction<_sqlite3_result_double_C, _sqlite3_result_double_Dart>('sqlite3_result_double');
typedef _sqlite3_result_double_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Double arg1,
);
typedef _sqlite3_result_double_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  double arg1,
);

/// C function `sqlite3_result_error`.

void sqlite3_result_error(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<int> arg1,
  int arg2,
) {
   _sqlite3_result_error(arg0, arg1, arg2);
}
final _sqlite3_result_error_Dart _sqlite3_result_error = _dl.lookupFunction<_sqlite3_result_error_C, _sqlite3_result_error_Dart>('sqlite3_result_error');
typedef _sqlite3_result_error_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  int arg2,
);
typedef _sqlite3_result_error_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<int> arg1,
  int arg2,
);

/// C function `sqlite3_result_error16`.

void sqlite3_result_error16(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<void> arg1,
  int arg2,
) {
   _sqlite3_result_error16(arg0, arg1, arg2);
}
final _sqlite3_result_error16_Dart _sqlite3_result_error16 = _dl.lookupFunction<_sqlite3_result_error16_C, _sqlite3_result_error16_Dart>('sqlite3_result_error16');
typedef _sqlite3_result_error16_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<ffi.Void> arg1,
  int arg2,
);
typedef _sqlite3_result_error16_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<void> arg1,
  int arg2,
);

/// C function `sqlite3_result_error_toobig`.

void sqlite3_result_error_toobig(
  ffi.Pointer<sqlite3_context> arg0,
) {
   _sqlite3_result_error_toobig(arg0);
}
final _sqlite3_result_error_toobig_Dart _sqlite3_result_error_toobig = _dl.lookupFunction<_sqlite3_result_error_toobig_C, _sqlite3_result_error_toobig_Dart>('sqlite3_result_error_toobig');
typedef _sqlite3_result_error_toobig_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_result_error_toobig_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_result_error_nomem`.

void sqlite3_result_error_nomem(
  ffi.Pointer<sqlite3_context> arg0,
) {
   _sqlite3_result_error_nomem(arg0);
}
final _sqlite3_result_error_nomem_Dart _sqlite3_result_error_nomem = _dl.lookupFunction<_sqlite3_result_error_nomem_C, _sqlite3_result_error_nomem_Dart>('sqlite3_result_error_nomem');
typedef _sqlite3_result_error_nomem_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_result_error_nomem_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_result_error_code`.

void sqlite3_result_error_code(
  ffi.Pointer<sqlite3_context> arg0,
  int arg1,
) {
   _sqlite3_result_error_code(arg0, arg1);
}
final _sqlite3_result_error_code_Dart _sqlite3_result_error_code = _dl.lookupFunction<_sqlite3_result_error_code_C, _sqlite3_result_error_code_Dart>('sqlite3_result_error_code');
typedef _sqlite3_result_error_code_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  int arg1,
);
typedef _sqlite3_result_error_code_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  int arg1,
);

/// C function `sqlite3_result_int`.

void sqlite3_result_int(
  ffi.Pointer<sqlite3_context> arg0,
  int arg1,
) {
   _sqlite3_result_int(arg0, arg1);
}
final _sqlite3_result_int_Dart _sqlite3_result_int = _dl.lookupFunction<_sqlite3_result_int_C, _sqlite3_result_int_Dart>('sqlite3_result_int');
typedef _sqlite3_result_int_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  int arg1,
);
typedef _sqlite3_result_int_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  int arg1,
);

/// C function `sqlite3_result_int64`.

void sqlite3_result_int64(
  ffi.Pointer<sqlite3_context> arg0,
  long long arg1,
) {
   _sqlite3_result_int64(arg0, arg1);
}
final _sqlite3_result_int64_Dart _sqlite3_result_int64 = _dl.lookupFunction<_sqlite3_result_int64_C, _sqlite3_result_int64_Dart>('sqlite3_result_int64');
typedef _sqlite3_result_int64_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  long long arg1,
);
typedef _sqlite3_result_int64_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  long long arg1,
);

/// C function `sqlite3_result_null`.

void sqlite3_result_null(
  ffi.Pointer<sqlite3_context> arg0,
) {
   _sqlite3_result_null(arg0);
}
final _sqlite3_result_null_Dart _sqlite3_result_null = _dl.lookupFunction<_sqlite3_result_null_C, _sqlite3_result_null_Dart>('sqlite3_result_null');
typedef _sqlite3_result_null_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
);
typedef _sqlite3_result_null_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
);

/// C function `sqlite3_result_text`.

void sqlite3_result_text(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<int> arg1,
  int arg2,
  void (*)(void *) arg3,
) {
   _sqlite3_result_text(arg0, arg1, arg2, arg3);
}
final _sqlite3_result_text_Dart _sqlite3_result_text = _dl.lookupFunction<_sqlite3_result_text_C, _sqlite3_result_text_Dart>('sqlite3_result_text');
typedef _sqlite3_result_text_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  int arg2,
  void (*)(void *) arg3,
);
typedef _sqlite3_result_text_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<int> arg1,
  int arg2,
  void (*)(void *) arg3,
);

/// C function `sqlite3_result_text16`.

void sqlite3_result_text16(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<void> arg1,
  int arg2,
  void (*)(void *) arg3,
) {
   _sqlite3_result_text16(arg0, arg1, arg2, arg3);
}
final _sqlite3_result_text16_Dart _sqlite3_result_text16 = _dl.lookupFunction<_sqlite3_result_text16_C, _sqlite3_result_text16_Dart>('sqlite3_result_text16');
typedef _sqlite3_result_text16_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<ffi.Void> arg1,
  int arg2,
  void (*)(void *) arg3,
);
typedef _sqlite3_result_text16_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<void> arg1,
  int arg2,
  void (*)(void *) arg3,
);

/// C function `sqlite3_result_text16le`.

void sqlite3_result_text16le(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<void> arg1,
  int arg2,
  void (*)(void *) arg3,
) {
   _sqlite3_result_text16le(arg0, arg1, arg2, arg3);
}
final _sqlite3_result_text16le_Dart _sqlite3_result_text16le = _dl.lookupFunction<_sqlite3_result_text16le_C, _sqlite3_result_text16le_Dart>('sqlite3_result_text16le');
typedef _sqlite3_result_text16le_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<ffi.Void> arg1,
  int arg2,
  void (*)(void *) arg3,
);
typedef _sqlite3_result_text16le_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<void> arg1,
  int arg2,
  void (*)(void *) arg3,
);

/// C function `sqlite3_result_text16be`.

void sqlite3_result_text16be(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<void> arg1,
  int arg2,
  void (*)(void *) arg3,
) {
   _sqlite3_result_text16be(arg0, arg1, arg2, arg3);
}
final _sqlite3_result_text16be_Dart _sqlite3_result_text16be = _dl.lookupFunction<_sqlite3_result_text16be_C, _sqlite3_result_text16be_Dart>('sqlite3_result_text16be');
typedef _sqlite3_result_text16be_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<ffi.Void> arg1,
  int arg2,
  void (*)(void *) arg3,
);
typedef _sqlite3_result_text16be_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<void> arg1,
  int arg2,
  void (*)(void *) arg3,
);

/// C function `sqlite3_result_value`.

void sqlite3_result_value(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<mem> arg1,
) {
   _sqlite3_result_value(arg0, arg1);
}
final _sqlite3_result_value_Dart _sqlite3_result_value = _dl.lookupFunction<_sqlite3_result_value_C, _sqlite3_result_value_Dart>('sqlite3_result_value');
typedef _sqlite3_result_value_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<mem> arg1,
);
typedef _sqlite3_result_value_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  ffi.Pointer<mem> arg1,
);

/// C function `sqlite3_result_zeroblob`.

void sqlite3_result_zeroblob(
  ffi.Pointer<sqlite3_context> arg0,
  int n,
) {
   _sqlite3_result_zeroblob(arg0, n);
}
final _sqlite3_result_zeroblob_Dart _sqlite3_result_zeroblob = _dl.lookupFunction<_sqlite3_result_zeroblob_C, _sqlite3_result_zeroblob_Dart>('sqlite3_result_zeroblob');
typedef _sqlite3_result_zeroblob_C = ffi.Void Function(
  ffi.Pointer<sqlite3_context> arg0,
  int n,
);
typedef _sqlite3_result_zeroblob_Dart = void Function(
  ffi.Pointer<sqlite3_context> arg0,
  int n,
);

/// C function `sqlite3_create_collation`.

int sqlite3_create_collation(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zName,
  int eTextRep,
  ffi.Pointer<void> pArg,
  int (*)(void *, int,  void *, int,  void *) xCompare,
) {
  return   _sqlite3_create_collation(arg0, zName, eTextRep, pArg, xCompare);
}
final _sqlite3_create_collation_Dart _sqlite3_create_collation = _dl.lookupFunction<_sqlite3_create_collation_C, _sqlite3_create_collation_Dart>('sqlite3_create_collation');
typedef _sqlite3_create_collation_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<ffi.Uint8> zName,
  int eTextRep,
  ffi.Pointer<ffi.Void> pArg,
  int (*)(void *, int,  void *, int,  void *) xCompare,
);
typedef _sqlite3_create_collation_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zName,
  int eTextRep,
  ffi.Pointer<void> pArg,
  int (*)(void *, int,  void *, int,  void *) xCompare,
);

/// C function `sqlite3_create_collation_v2`.

int sqlite3_create_collation_v2(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zName,
  int eTextRep,
  ffi.Pointer<void> pArg,
  int (*)(void *, int,  void *, int,  void *) xCompare,
  void (*)(void *) xDestroy,
) {
  return   _sqlite3_create_collation_v2(arg0, zName, eTextRep, pArg, xCompare, xDestroy);
}
final _sqlite3_create_collation_v2_Dart _sqlite3_create_collation_v2 = _dl.lookupFunction<_sqlite3_create_collation_v2_C, _sqlite3_create_collation_v2_Dart>('sqlite3_create_collation_v2');
typedef _sqlite3_create_collation_v2_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<ffi.Uint8> zName,
  int eTextRep,
  ffi.Pointer<ffi.Void> pArg,
  int (*)(void *, int,  void *, int,  void *) xCompare,
  void (*)(void *) xDestroy,
);
typedef _sqlite3_create_collation_v2_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zName,
  int eTextRep,
  ffi.Pointer<void> pArg,
  int (*)(void *, int,  void *, int,  void *) xCompare,
  void (*)(void *) xDestroy,
);

/// C function `sqlite3_create_collation16`.

int sqlite3_create_collation16(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<void> zName,
  int eTextRep,
  ffi.Pointer<void> pArg,
  int (*)(void *, int,  void *, int,  void *) xCompare,
) {
  return   _sqlite3_create_collation16(arg0, zName, eTextRep, pArg, xCompare);
}
final _sqlite3_create_collation16_Dart _sqlite3_create_collation16 = _dl.lookupFunction<_sqlite3_create_collation16_C, _sqlite3_create_collation16_Dart>('sqlite3_create_collation16');
typedef _sqlite3_create_collation16_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<ffi.Void> zName,
  int eTextRep,
  ffi.Pointer<ffi.Void> pArg,
  int (*)(void *, int,  void *, int,  void *) xCompare,
);
typedef _sqlite3_create_collation16_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<void> zName,
  int eTextRep,
  ffi.Pointer<void> pArg,
  int (*)(void *, int,  void *, int,  void *) xCompare,
);

/// C function `sqlite3_collation_needed`.

int sqlite3_collation_needed(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<void> arg1,
  void (*)(void *,  sqlite3 *, int,  char *) arg2,
) {
  return   _sqlite3_collation_needed(arg0, arg1, arg2);
}
final _sqlite3_collation_needed_Dart _sqlite3_collation_needed = _dl.lookupFunction<_sqlite3_collation_needed_C, _sqlite3_collation_needed_Dart>('sqlite3_collation_needed');
typedef _sqlite3_collation_needed_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<ffi.Void> arg1,
  void (*)(void *,  sqlite3 *, int,  char *) arg2,
);
typedef _sqlite3_collation_needed_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<void> arg1,
  void (*)(void *,  sqlite3 *, int,  char *) arg2,
);

/// C function `sqlite3_collation_needed16`.

int sqlite3_collation_needed16(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<void> arg1,
  void (*)(void *,  sqlite3 *, int,  void *) arg2,
) {
  return   _sqlite3_collation_needed16(arg0, arg1, arg2);
}
final _sqlite3_collation_needed16_Dart _sqlite3_collation_needed16 = _dl.lookupFunction<_sqlite3_collation_needed16_C, _sqlite3_collation_needed16_Dart>('sqlite3_collation_needed16');
typedef _sqlite3_collation_needed16_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<ffi.Void> arg1,
  void (*)(void *,  sqlite3 *, int,  void *) arg2,
);
typedef _sqlite3_collation_needed16_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<void> arg1,
  void (*)(void *,  sqlite3 *, int,  void *) arg2,
);

/// C function `sqlite3_sleep`.

int sqlite3_sleep(
  int arg0,
) {
  return   _sqlite3_sleep(arg0);
}
final _sqlite3_sleep_Dart _sqlite3_sleep = _dl.lookupFunction<_sqlite3_sleep_C, _sqlite3_sleep_Dart>('sqlite3_sleep');
typedef _sqlite3_sleep_C = int Function(
  int arg0,
);
typedef _sqlite3_sleep_Dart = int Function(
  int arg0,
);

/// C function `sqlite3_get_autocommit`.

int sqlite3_get_autocommit(
  ffi.Pointer<sqlite3> arg0,
) {
  return   _sqlite3_get_autocommit(arg0);
}
final _sqlite3_get_autocommit_Dart _sqlite3_get_autocommit = _dl.lookupFunction<_sqlite3_get_autocommit_C, _sqlite3_get_autocommit_Dart>('sqlite3_get_autocommit');
typedef _sqlite3_get_autocommit_C = int Function(
  ffi.Pointer<sqlite3> arg0,
);
typedef _sqlite3_get_autocommit_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
);

/// C function `sqlite3_db_handle`.

ffi.Pointer<sqlite3> sqlite3_db_handle(
  ffi.Pointer<sqlite3_stmt> arg0,
) {
  return   _sqlite3_db_handle(arg0);
}
final _sqlite3_db_handle_Dart _sqlite3_db_handle = _dl.lookupFunction<_sqlite3_db_handle_C, _sqlite3_db_handle_Dart>('sqlite3_db_handle');
typedef _sqlite3_db_handle_C = ffi.Pointer<sqlite3> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
);
typedef _sqlite3_db_handle_Dart = ffi.Pointer<sqlite3> Function(
  ffi.Pointer<sqlite3_stmt> arg0,
);

/// C function `sqlite3_next_stmt`.

ffi.Pointer<sqlite3_stmt> sqlite3_next_stmt(
  ffi.Pointer<sqlite3> pDb,
  ffi.Pointer<sqlite3_stmt> pStmt,
) {
  return   _sqlite3_next_stmt(pDb, pStmt);
}
final _sqlite3_next_stmt_Dart _sqlite3_next_stmt = _dl.lookupFunction<_sqlite3_next_stmt_C, _sqlite3_next_stmt_Dart>('sqlite3_next_stmt');
typedef _sqlite3_next_stmt_C = ffi.Pointer<sqlite3_stmt> Function(
  ffi.Pointer<sqlite3> pDb,
  ffi.Pointer<sqlite3_stmt> pStmt,
);
typedef _sqlite3_next_stmt_Dart = ffi.Pointer<sqlite3_stmt> Function(
  ffi.Pointer<sqlite3> pDb,
  ffi.Pointer<sqlite3_stmt> pStmt,
);

/// C function `sqlite3_commit_hook`.

ffi.Pointer<void> sqlite3_commit_hook(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *) arg1,
  ffi.Pointer<void> arg2,
) {
  return   _sqlite3_commit_hook(arg0, arg1, arg2);
}
final _sqlite3_commit_hook_Dart _sqlite3_commit_hook = _dl.lookupFunction<_sqlite3_commit_hook_C, _sqlite3_commit_hook_Dart>('sqlite3_commit_hook');
typedef _sqlite3_commit_hook_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *) arg1,
  ffi.Pointer<ffi.Void> arg2,
);
typedef _sqlite3_commit_hook_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *) arg1,
  ffi.Pointer<void> arg2,
);

/// C function `sqlite3_rollback_hook`.

ffi.Pointer<void> sqlite3_rollback_hook(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *) arg1,
  ffi.Pointer<void> arg2,
) {
  return   _sqlite3_rollback_hook(arg0, arg1, arg2);
}
final _sqlite3_rollback_hook_Dart _sqlite3_rollback_hook = _dl.lookupFunction<_sqlite3_rollback_hook_C, _sqlite3_rollback_hook_Dart>('sqlite3_rollback_hook');
typedef _sqlite3_rollback_hook_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *) arg1,
  ffi.Pointer<ffi.Void> arg2,
);
typedef _sqlite3_rollback_hook_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *) arg1,
  ffi.Pointer<void> arg2,
);

/// C function `sqlite3_update_hook`.

ffi.Pointer<void> sqlite3_update_hook(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *, int,  char *,  char *, long long) arg1,
  ffi.Pointer<void> arg2,
) {
  return   _sqlite3_update_hook(arg0, arg1, arg2);
}
final _sqlite3_update_hook_Dart _sqlite3_update_hook = _dl.lookupFunction<_sqlite3_update_hook_C, _sqlite3_update_hook_Dart>('sqlite3_update_hook');
typedef _sqlite3_update_hook_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *, int,  char *,  char *, long long) arg1,
  ffi.Pointer<ffi.Void> arg2,
);
typedef _sqlite3_update_hook_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3> arg0,
  void (*)(void *, int,  char *,  char *, long long) arg1,
  ffi.Pointer<void> arg2,
);

/// C function `sqlite3_enable_shared_cache`.

int sqlite3_enable_shared_cache(
  int arg0,
) {
  return   _sqlite3_enable_shared_cache(arg0);
}
final _sqlite3_enable_shared_cache_Dart _sqlite3_enable_shared_cache = _dl.lookupFunction<_sqlite3_enable_shared_cache_C, _sqlite3_enable_shared_cache_Dart>('sqlite3_enable_shared_cache');
typedef _sqlite3_enable_shared_cache_C = int Function(
  int arg0,
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
typedef _sqlite3_release_memory_C = int Function(
  int arg0,
);
typedef _sqlite3_release_memory_Dart = int Function(
  int arg0,
);

/// C function `sqlite3_soft_heap_limit64`.

long long sqlite3_soft_heap_limit64(
  long long N,
) {
  return   _sqlite3_soft_heap_limit64(N);
}
final _sqlite3_soft_heap_limit64_Dart _sqlite3_soft_heap_limit64 = _dl.lookupFunction<_sqlite3_soft_heap_limit64_C, _sqlite3_soft_heap_limit64_Dart>('sqlite3_soft_heap_limit64');
typedef _sqlite3_soft_heap_limit64_C = long long Function(
  long long N,
);
typedef _sqlite3_soft_heap_limit64_Dart = long long Function(
  long long N,
);

/// C function `sqlite3_soft_heap_limit`.

void sqlite3_soft_heap_limit(
  int N,
) {
   _sqlite3_soft_heap_limit(N);
}
final _sqlite3_soft_heap_limit_Dart _sqlite3_soft_heap_limit = _dl.lookupFunction<_sqlite3_soft_heap_limit_C, _sqlite3_soft_heap_limit_Dart>('sqlite3_soft_heap_limit');
typedef _sqlite3_soft_heap_limit_C = ffi.Void Function(
  int N,
);
typedef _sqlite3_soft_heap_limit_Dart = void Function(
  int N,
);

/// C function `sqlite3_table_column_metadata`.

int sqlite3_table_column_metadata(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zDbName,
  ffi.Pointer<int> zTableName,
  ffi.Pointer<int> zColumnName,
  ffi.Pointer<ffi.Pointer<int>> pzDataType,
  ffi.Pointer<ffi.Pointer<int>> pzCollSeq,
  ffi.Pointer<int> pNotNull,
  ffi.Pointer<int> pPrimaryKey,
  ffi.Pointer<int> pAutoinc,
) {
  return   _sqlite3_table_column_metadata(db, zDbName, zTableName, zColumnName, pzDataType, pzCollSeq, pNotNull, pPrimaryKey, pAutoinc);
}
final _sqlite3_table_column_metadata_Dart _sqlite3_table_column_metadata = _dl.lookupFunction<_sqlite3_table_column_metadata_C, _sqlite3_table_column_metadata_Dart>('sqlite3_table_column_metadata');
typedef _sqlite3_table_column_metadata_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zDbName,
  ffi.Pointer<ffi.Uint8> zTableName,
  ffi.Pointer<ffi.Uint8> zColumnName,
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> pzDataType,
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> pzCollSeq,
  ffi.Pointer<int> pNotNull,
  ffi.Pointer<int> pPrimaryKey,
  ffi.Pointer<int> pAutoinc,
);
typedef _sqlite3_table_column_metadata_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zDbName,
  ffi.Pointer<int> zTableName,
  ffi.Pointer<int> zColumnName,
  ffi.Pointer<ffi.Pointer<int>> pzDataType,
  ffi.Pointer<ffi.Pointer<int>> pzCollSeq,
  ffi.Pointer<int> pNotNull,
  ffi.Pointer<int> pPrimaryKey,
  ffi.Pointer<int> pAutoinc,
);

/// C function `sqlite3_load_extension`.

int sqlite3_load_extension(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zFile,
  ffi.Pointer<int> zProc,
  ffi.Pointer<ffi.Pointer<int>> pzErrMsg,
) {
  return   _sqlite3_load_extension(db, zFile, zProc, pzErrMsg);
}
final _sqlite3_load_extension_Dart _sqlite3_load_extension = _dl.lookupFunction<_sqlite3_load_extension_C, _sqlite3_load_extension_Dart>('sqlite3_load_extension');
typedef _sqlite3_load_extension_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zFile,
  ffi.Pointer<ffi.Uint8> zProc,
  ffi.Pointer<ffi.Pointer<ffi.Uint8>> pzErrMsg,
);
typedef _sqlite3_load_extension_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zFile,
  ffi.Pointer<int> zProc,
  ffi.Pointer<ffi.Pointer<int>> pzErrMsg,
);

/// C function `sqlite3_enable_load_extension`.

int sqlite3_enable_load_extension(
  ffi.Pointer<sqlite3> db,
  int onoff,
) {
  return   _sqlite3_enable_load_extension(db, onoff);
}
final _sqlite3_enable_load_extension_Dart _sqlite3_enable_load_extension = _dl.lookupFunction<_sqlite3_enable_load_extension_C, _sqlite3_enable_load_extension_Dart>('sqlite3_enable_load_extension');
typedef _sqlite3_enable_load_extension_C = int Function(
  ffi.Pointer<sqlite3> db,
  int onoff,
);
typedef _sqlite3_enable_load_extension_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  int onoff,
);

/// C function `sqlite3_auto_extension`.

int sqlite3_auto_extension(
  void (*)(void) xEntryPoint,
) {
  return   _sqlite3_auto_extension(xEntryPoint);
}
final _sqlite3_auto_extension_Dart _sqlite3_auto_extension = _dl.lookupFunction<_sqlite3_auto_extension_C, _sqlite3_auto_extension_Dart>('sqlite3_auto_extension');
typedef _sqlite3_auto_extension_C = int Function(
  void (*)(void) xEntryPoint,
);
typedef _sqlite3_auto_extension_Dart = int Function(
  void (*)(void) xEntryPoint,
);

/// C function `sqlite3_reset_auto_extension`.

void sqlite3_reset_auto_extension() {
   _sqlite3_reset_auto_extension();
}
final _sqlite3_reset_auto_extension_Dart _sqlite3_reset_auto_extension = _dl.lookupFunction<_sqlite3_reset_auto_extension_C, _sqlite3_reset_auto_extension_Dart>('sqlite3_reset_auto_extension');
typedef _sqlite3_reset_auto_extension_C = ffi.Void Function();
typedef _sqlite3_reset_auto_extension_Dart = void Function();

/// C function `sqlite3_create_module`.

int sqlite3_create_module(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zName,
  ffi.Pointer<sqlite3_module> p,
  ffi.Pointer<void> pClientData,
) {
  return   _sqlite3_create_module(db, zName, p, pClientData);
}
final _sqlite3_create_module_Dart _sqlite3_create_module = _dl.lookupFunction<_sqlite3_create_module_C, _sqlite3_create_module_Dart>('sqlite3_create_module');
typedef _sqlite3_create_module_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zName,
  ffi.Pointer<sqlite3_module> p,
  ffi.Pointer<ffi.Void> pClientData,
);
typedef _sqlite3_create_module_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zName,
  ffi.Pointer<sqlite3_module> p,
  ffi.Pointer<void> pClientData,
);

/// C function `sqlite3_create_module_v2`.

int sqlite3_create_module_v2(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zName,
  ffi.Pointer<sqlite3_module> p,
  ffi.Pointer<void> pClientData,
  void (*)(void *) xDestroy,
) {
  return   _sqlite3_create_module_v2(db, zName, p, pClientData, xDestroy);
}
final _sqlite3_create_module_v2_Dart _sqlite3_create_module_v2 = _dl.lookupFunction<_sqlite3_create_module_v2_C, _sqlite3_create_module_v2_Dart>('sqlite3_create_module_v2');
typedef _sqlite3_create_module_v2_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zName,
  ffi.Pointer<sqlite3_module> p,
  ffi.Pointer<ffi.Void> pClientData,
  void (*)(void *) xDestroy,
);
typedef _sqlite3_create_module_v2_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zName,
  ffi.Pointer<sqlite3_module> p,
  ffi.Pointer<void> pClientData,
  void (*)(void *) xDestroy,
);

/// C function `sqlite3_declare_vtab`.

int sqlite3_declare_vtab(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zSQL,
) {
  return   _sqlite3_declare_vtab(arg0, zSQL);
}
final _sqlite3_declare_vtab_Dart _sqlite3_declare_vtab = _dl.lookupFunction<_sqlite3_declare_vtab_C, _sqlite3_declare_vtab_Dart>('sqlite3_declare_vtab');
typedef _sqlite3_declare_vtab_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<ffi.Uint8> zSQL,
);
typedef _sqlite3_declare_vtab_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zSQL,
);

/// C function `sqlite3_overload_function`.

int sqlite3_overload_function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zFuncName,
  int nArg,
) {
  return   _sqlite3_overload_function(arg0, zFuncName, nArg);
}
final _sqlite3_overload_function_Dart _sqlite3_overload_function = _dl.lookupFunction<_sqlite3_overload_function_C, _sqlite3_overload_function_Dart>('sqlite3_overload_function');
typedef _sqlite3_overload_function_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<ffi.Uint8> zFuncName,
  int nArg,
);
typedef _sqlite3_overload_function_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zFuncName,
  int nArg,
);

/// C function `sqlite3_blob_open`.

int sqlite3_blob_open(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zDb,
  ffi.Pointer<int> zTable,
  ffi.Pointer<int> zColumn,
  long long iRow,
  int flags,
  ffi.Pointer<ffi.Pointer<sqlite3_blob>> ppBlob,
) {
  return   _sqlite3_blob_open(arg0, zDb, zTable, zColumn, iRow, flags, ppBlob);
}
final _sqlite3_blob_open_Dart _sqlite3_blob_open = _dl.lookupFunction<_sqlite3_blob_open_C, _sqlite3_blob_open_Dart>('sqlite3_blob_open');
typedef _sqlite3_blob_open_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<ffi.Uint8> zDb,
  ffi.Pointer<ffi.Uint8> zTable,
  ffi.Pointer<ffi.Uint8> zColumn,
  long long iRow,
  int flags,
  ffi.Pointer<ffi.Pointer<sqlite3_blob>> ppBlob,
);
typedef _sqlite3_blob_open_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zDb,
  ffi.Pointer<int> zTable,
  ffi.Pointer<int> zColumn,
  long long iRow,
  int flags,
  ffi.Pointer<ffi.Pointer<sqlite3_blob>> ppBlob,
);

/// C function `sqlite3_blob_reopen`.

int sqlite3_blob_reopen(
  ffi.Pointer<sqlite3_blob> arg0,
  long long arg1,
) {
  return   _sqlite3_blob_reopen(arg0, arg1);
}
final _sqlite3_blob_reopen_Dart _sqlite3_blob_reopen = _dl.lookupFunction<_sqlite3_blob_reopen_C, _sqlite3_blob_reopen_Dart>('sqlite3_blob_reopen');
typedef _sqlite3_blob_reopen_C = int Function(
  ffi.Pointer<sqlite3_blob> arg0,
  long long arg1,
);
typedef _sqlite3_blob_reopen_Dart = int Function(
  ffi.Pointer<sqlite3_blob> arg0,
  long long arg1,
);

/// C function `sqlite3_blob_close`.

int sqlite3_blob_close(
  ffi.Pointer<sqlite3_blob> arg0,
) {
  return   _sqlite3_blob_close(arg0);
}
final _sqlite3_blob_close_Dart _sqlite3_blob_close = _dl.lookupFunction<_sqlite3_blob_close_C, _sqlite3_blob_close_Dart>('sqlite3_blob_close');
typedef _sqlite3_blob_close_C = int Function(
  ffi.Pointer<sqlite3_blob> arg0,
);
typedef _sqlite3_blob_close_Dart = int Function(
  ffi.Pointer<sqlite3_blob> arg0,
);

/// C function `sqlite3_blob_bytes`.

int sqlite3_blob_bytes(
  ffi.Pointer<sqlite3_blob> arg0,
) {
  return   _sqlite3_blob_bytes(arg0);
}
final _sqlite3_blob_bytes_Dart _sqlite3_blob_bytes = _dl.lookupFunction<_sqlite3_blob_bytes_C, _sqlite3_blob_bytes_Dart>('sqlite3_blob_bytes');
typedef _sqlite3_blob_bytes_C = int Function(
  ffi.Pointer<sqlite3_blob> arg0,
);
typedef _sqlite3_blob_bytes_Dart = int Function(
  ffi.Pointer<sqlite3_blob> arg0,
);

/// C function `sqlite3_blob_read`.

int sqlite3_blob_read(
  ffi.Pointer<sqlite3_blob> arg0,
  ffi.Pointer<void> Z,
  int N,
  int iOffset,
) {
  return   _sqlite3_blob_read(arg0, Z, N, iOffset);
}
final _sqlite3_blob_read_Dart _sqlite3_blob_read = _dl.lookupFunction<_sqlite3_blob_read_C, _sqlite3_blob_read_Dart>('sqlite3_blob_read');
typedef _sqlite3_blob_read_C = int Function(
  ffi.Pointer<sqlite3_blob> arg0,
  ffi.Pointer<ffi.Void> Z,
  int N,
  int iOffset,
);
typedef _sqlite3_blob_read_Dart = int Function(
  ffi.Pointer<sqlite3_blob> arg0,
  ffi.Pointer<void> Z,
  int N,
  int iOffset,
);

/// C function `sqlite3_blob_write`.

int sqlite3_blob_write(
  ffi.Pointer<sqlite3_blob> arg0,
  ffi.Pointer<void> z,
  int n,
  int iOffset,
) {
  return   _sqlite3_blob_write(arg0, z, n, iOffset);
}
final _sqlite3_blob_write_Dart _sqlite3_blob_write = _dl.lookupFunction<_sqlite3_blob_write_C, _sqlite3_blob_write_Dart>('sqlite3_blob_write');
typedef _sqlite3_blob_write_C = int Function(
  ffi.Pointer<sqlite3_blob> arg0,
  ffi.Pointer<ffi.Void> z,
  int n,
  int iOffset,
);
typedef _sqlite3_blob_write_Dart = int Function(
  ffi.Pointer<sqlite3_blob> arg0,
  ffi.Pointer<void> z,
  int n,
  int iOffset,
);

/// C function `sqlite3_vfs_find`.

ffi.Pointer<sqlite3_vfs> sqlite3_vfs_find(
  ffi.Pointer<int> zVfsName,
) {
  return   _sqlite3_vfs_find(zVfsName);
}
final _sqlite3_vfs_find_Dart _sqlite3_vfs_find = _dl.lookupFunction<_sqlite3_vfs_find_C, _sqlite3_vfs_find_Dart>('sqlite3_vfs_find');
typedef _sqlite3_vfs_find_C = ffi.Pointer<sqlite3_vfs> Function(
  ffi.Pointer<ffi.Uint8> zVfsName,
);
typedef _sqlite3_vfs_find_Dart = ffi.Pointer<sqlite3_vfs> Function(
  ffi.Pointer<int> zVfsName,
);

/// C function `sqlite3_vfs_register`.

int sqlite3_vfs_register(
  ffi.Pointer<sqlite3_vfs> arg0,
  int makeDflt,
) {
  return   _sqlite3_vfs_register(arg0, makeDflt);
}
final _sqlite3_vfs_register_Dart _sqlite3_vfs_register = _dl.lookupFunction<_sqlite3_vfs_register_C, _sqlite3_vfs_register_Dart>('sqlite3_vfs_register');
typedef _sqlite3_vfs_register_C = int Function(
  ffi.Pointer<sqlite3_vfs> arg0,
  int makeDflt,
);
typedef _sqlite3_vfs_register_Dart = int Function(
  ffi.Pointer<sqlite3_vfs> arg0,
  int makeDflt,
);

/// C function `sqlite3_vfs_unregister`.

int sqlite3_vfs_unregister(
  ffi.Pointer<sqlite3_vfs> arg0,
) {
  return   _sqlite3_vfs_unregister(arg0);
}
final _sqlite3_vfs_unregister_Dart _sqlite3_vfs_unregister = _dl.lookupFunction<_sqlite3_vfs_unregister_C, _sqlite3_vfs_unregister_Dart>('sqlite3_vfs_unregister');
typedef _sqlite3_vfs_unregister_C = int Function(
  ffi.Pointer<sqlite3_vfs> arg0,
);
typedef _sqlite3_vfs_unregister_Dart = int Function(
  ffi.Pointer<sqlite3_vfs> arg0,
);

/// C function `sqlite3_mutex_alloc`.

ffi.Pointer<sqlite3_mutex> sqlite3_mutex_alloc(
  int arg0,
) {
  return   _sqlite3_mutex_alloc(arg0);
}
final _sqlite3_mutex_alloc_Dart _sqlite3_mutex_alloc = _dl.lookupFunction<_sqlite3_mutex_alloc_C, _sqlite3_mutex_alloc_Dart>('sqlite3_mutex_alloc');
typedef _sqlite3_mutex_alloc_C = ffi.Pointer<sqlite3_mutex> Function(
  int arg0,
);
typedef _sqlite3_mutex_alloc_Dart = ffi.Pointer<sqlite3_mutex> Function(
  int arg0,
);

/// C function `sqlite3_mutex_free`.

void sqlite3_mutex_free(
  ffi.Pointer<sqlite3_mutex> arg0,
) {
   _sqlite3_mutex_free(arg0);
}
final _sqlite3_mutex_free_Dart _sqlite3_mutex_free = _dl.lookupFunction<_sqlite3_mutex_free_C, _sqlite3_mutex_free_Dart>('sqlite3_mutex_free');
typedef _sqlite3_mutex_free_C = ffi.Void Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_free_Dart = void Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_mutex_enter`.

void sqlite3_mutex_enter(
  ffi.Pointer<sqlite3_mutex> arg0,
) {
   _sqlite3_mutex_enter(arg0);
}
final _sqlite3_mutex_enter_Dart _sqlite3_mutex_enter = _dl.lookupFunction<_sqlite3_mutex_enter_C, _sqlite3_mutex_enter_Dart>('sqlite3_mutex_enter');
typedef _sqlite3_mutex_enter_C = ffi.Void Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_enter_Dart = void Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_mutex_try`.

int sqlite3_mutex_try(
  ffi.Pointer<sqlite3_mutex> arg0,
) {
  return   _sqlite3_mutex_try(arg0);
}
final _sqlite3_mutex_try_Dart _sqlite3_mutex_try = _dl.lookupFunction<_sqlite3_mutex_try_C, _sqlite3_mutex_try_Dart>('sqlite3_mutex_try');
typedef _sqlite3_mutex_try_C = int Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_try_Dart = int Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_mutex_leave`.

void sqlite3_mutex_leave(
  ffi.Pointer<sqlite3_mutex> arg0,
) {
   _sqlite3_mutex_leave(arg0);
}
final _sqlite3_mutex_leave_Dart _sqlite3_mutex_leave = _dl.lookupFunction<_sqlite3_mutex_leave_C, _sqlite3_mutex_leave_Dart>('sqlite3_mutex_leave');
typedef _sqlite3_mutex_leave_C = ffi.Void Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_leave_Dart = void Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_mutex_held`.

int sqlite3_mutex_held(
  ffi.Pointer<sqlite3_mutex> arg0,
) {
  return   _sqlite3_mutex_held(arg0);
}
final _sqlite3_mutex_held_Dart _sqlite3_mutex_held = _dl.lookupFunction<_sqlite3_mutex_held_C, _sqlite3_mutex_held_Dart>('sqlite3_mutex_held');
typedef _sqlite3_mutex_held_C = int Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_held_Dart = int Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_mutex_notheld`.

int sqlite3_mutex_notheld(
  ffi.Pointer<sqlite3_mutex> arg0,
) {
  return   _sqlite3_mutex_notheld(arg0);
}
final _sqlite3_mutex_notheld_Dart _sqlite3_mutex_notheld = _dl.lookupFunction<_sqlite3_mutex_notheld_C, _sqlite3_mutex_notheld_Dart>('sqlite3_mutex_notheld');
typedef _sqlite3_mutex_notheld_C = int Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);
typedef _sqlite3_mutex_notheld_Dart = int Function(
  ffi.Pointer<sqlite3_mutex> arg0,
);

/// C function `sqlite3_db_mutex`.

ffi.Pointer<sqlite3_mutex> sqlite3_db_mutex(
  ffi.Pointer<sqlite3> arg0,
) {
  return   _sqlite3_db_mutex(arg0);
}
final _sqlite3_db_mutex_Dart _sqlite3_db_mutex = _dl.lookupFunction<_sqlite3_db_mutex_C, _sqlite3_db_mutex_Dart>('sqlite3_db_mutex');
typedef _sqlite3_db_mutex_C = ffi.Pointer<sqlite3_mutex> Function(
  ffi.Pointer<sqlite3> arg0,
);
typedef _sqlite3_db_mutex_Dart = ffi.Pointer<sqlite3_mutex> Function(
  ffi.Pointer<sqlite3> arg0,
);

/// C function `sqlite3_file_control`.

int sqlite3_file_control(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zDbName,
  int op,
  ffi.Pointer<void> arg3,
) {
  return   _sqlite3_file_control(arg0, zDbName, op, arg3);
}
final _sqlite3_file_control_Dart _sqlite3_file_control = _dl.lookupFunction<_sqlite3_file_control_C, _sqlite3_file_control_Dart>('sqlite3_file_control');
typedef _sqlite3_file_control_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<ffi.Uint8> zDbName,
  int op,
  ffi.Pointer<ffi.Void> arg3,
);
typedef _sqlite3_file_control_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  ffi.Pointer<int> zDbName,
  int op,
  ffi.Pointer<void> arg3,
);

/// C function `sqlite3_test_control`.

int sqlite3_test_control(
  int op,
) {
  return   _sqlite3_test_control(op);
}
final _sqlite3_test_control_Dart _sqlite3_test_control = _dl.lookupFunction<_sqlite3_test_control_C, _sqlite3_test_control_Dart>('sqlite3_test_control');
typedef _sqlite3_test_control_C = int Function(
  int op,
);
typedef _sqlite3_test_control_Dart = int Function(
  int op,
);

/// C function `sqlite3_status`.

int sqlite3_status(
  int op,
  ffi.Pointer<int> pCurrent,
  ffi.Pointer<int> pHighwater,
  int resetFlag,
) {
  return   _sqlite3_status(op, pCurrent, pHighwater, resetFlag);
}
final _sqlite3_status_Dart _sqlite3_status = _dl.lookupFunction<_sqlite3_status_C, _sqlite3_status_Dart>('sqlite3_status');
typedef _sqlite3_status_C = int Function(
  int op,
  ffi.Pointer<int> pCurrent,
  ffi.Pointer<int> pHighwater,
  int resetFlag,
);
typedef _sqlite3_status_Dart = int Function(
  int op,
  ffi.Pointer<int> pCurrent,
  ffi.Pointer<int> pHighwater,
  int resetFlag,
);

/// C function `sqlite3_db_status`.

int sqlite3_db_status(
  ffi.Pointer<sqlite3> arg0,
  int op,
  ffi.Pointer<int> pCur,
  ffi.Pointer<int> pHiwtr,
  int resetFlg,
) {
  return   _sqlite3_db_status(arg0, op, pCur, pHiwtr, resetFlg);
}
final _sqlite3_db_status_Dart _sqlite3_db_status = _dl.lookupFunction<_sqlite3_db_status_C, _sqlite3_db_status_Dart>('sqlite3_db_status');
typedef _sqlite3_db_status_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  int op,
  ffi.Pointer<int> pCur,
  ffi.Pointer<int> pHiwtr,
  int resetFlg,
);
typedef _sqlite3_db_status_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  int op,
  ffi.Pointer<int> pCur,
  ffi.Pointer<int> pHiwtr,
  int resetFlg,
);

/// C function `sqlite3_stmt_status`.

int sqlite3_stmt_status(
  ffi.Pointer<sqlite3_stmt> arg0,
  int op,
  int resetFlg,
) {
  return   _sqlite3_stmt_status(arg0, op, resetFlg);
}
final _sqlite3_stmt_status_Dart _sqlite3_stmt_status = _dl.lookupFunction<_sqlite3_stmt_status_C, _sqlite3_stmt_status_Dart>('sqlite3_stmt_status');
typedef _sqlite3_stmt_status_C = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int op,
  int resetFlg,
);
typedef _sqlite3_stmt_status_Dart = int Function(
  ffi.Pointer<sqlite3_stmt> arg0,
  int op,
  int resetFlg,
);

/// C function `sqlite3_backup_init`.

ffi.Pointer<sqlite3_backup> sqlite3_backup_init(
  ffi.Pointer<sqlite3> pDest,
  ffi.Pointer<int> zDestName,
  ffi.Pointer<sqlite3> pSource,
  ffi.Pointer<int> zSourceName,
) {
  return   _sqlite3_backup_init(pDest, zDestName, pSource, zSourceName);
}
final _sqlite3_backup_init_Dart _sqlite3_backup_init = _dl.lookupFunction<_sqlite3_backup_init_C, _sqlite3_backup_init_Dart>('sqlite3_backup_init');
typedef _sqlite3_backup_init_C = ffi.Pointer<sqlite3_backup> Function(
  ffi.Pointer<sqlite3> pDest,
  ffi.Pointer<ffi.Uint8> zDestName,
  ffi.Pointer<sqlite3> pSource,
  ffi.Pointer<ffi.Uint8> zSourceName,
);
typedef _sqlite3_backup_init_Dart = ffi.Pointer<sqlite3_backup> Function(
  ffi.Pointer<sqlite3> pDest,
  ffi.Pointer<int> zDestName,
  ffi.Pointer<sqlite3> pSource,
  ffi.Pointer<int> zSourceName,
);

/// C function `sqlite3_backup_step`.

int sqlite3_backup_step(
  ffi.Pointer<sqlite3_backup> p,
  int nPage,
) {
  return   _sqlite3_backup_step(p, nPage);
}
final _sqlite3_backup_step_Dart _sqlite3_backup_step = _dl.lookupFunction<_sqlite3_backup_step_C, _sqlite3_backup_step_Dart>('sqlite3_backup_step');
typedef _sqlite3_backup_step_C = int Function(
  ffi.Pointer<sqlite3_backup> p,
  int nPage,
);
typedef _sqlite3_backup_step_Dart = int Function(
  ffi.Pointer<sqlite3_backup> p,
  int nPage,
);

/// C function `sqlite3_backup_finish`.

int sqlite3_backup_finish(
  ffi.Pointer<sqlite3_backup> p,
) {
  return   _sqlite3_backup_finish(p);
}
final _sqlite3_backup_finish_Dart _sqlite3_backup_finish = _dl.lookupFunction<_sqlite3_backup_finish_C, _sqlite3_backup_finish_Dart>('sqlite3_backup_finish');
typedef _sqlite3_backup_finish_C = int Function(
  ffi.Pointer<sqlite3_backup> p,
);
typedef _sqlite3_backup_finish_Dart = int Function(
  ffi.Pointer<sqlite3_backup> p,
);

/// C function `sqlite3_backup_remaining`.

int sqlite3_backup_remaining(
  ffi.Pointer<sqlite3_backup> p,
) {
  return   _sqlite3_backup_remaining(p);
}
final _sqlite3_backup_remaining_Dart _sqlite3_backup_remaining = _dl.lookupFunction<_sqlite3_backup_remaining_C, _sqlite3_backup_remaining_Dart>('sqlite3_backup_remaining');
typedef _sqlite3_backup_remaining_C = int Function(
  ffi.Pointer<sqlite3_backup> p,
);
typedef _sqlite3_backup_remaining_Dart = int Function(
  ffi.Pointer<sqlite3_backup> p,
);

/// C function `sqlite3_backup_pagecount`.

int sqlite3_backup_pagecount(
  ffi.Pointer<sqlite3_backup> p,
) {
  return   _sqlite3_backup_pagecount(p);
}
final _sqlite3_backup_pagecount_Dart _sqlite3_backup_pagecount = _dl.lookupFunction<_sqlite3_backup_pagecount_C, _sqlite3_backup_pagecount_Dart>('sqlite3_backup_pagecount');
typedef _sqlite3_backup_pagecount_C = int Function(
  ffi.Pointer<sqlite3_backup> p,
);
typedef _sqlite3_backup_pagecount_Dart = int Function(
  ffi.Pointer<sqlite3_backup> p,
);

/// C function `sqlite3_unlock_notify`.

int sqlite3_unlock_notify(
  ffi.Pointer<sqlite3> pBlocked,
  void (*)(void **, int) xNotify,
  ffi.Pointer<void> pNotifyArg,
) {
  return   _sqlite3_unlock_notify(pBlocked, xNotify, pNotifyArg);
}
final _sqlite3_unlock_notify_Dart _sqlite3_unlock_notify = _dl.lookupFunction<_sqlite3_unlock_notify_C, _sqlite3_unlock_notify_Dart>('sqlite3_unlock_notify');
typedef _sqlite3_unlock_notify_C = int Function(
  ffi.Pointer<sqlite3> pBlocked,
  void (*)(void **, int) xNotify,
  ffi.Pointer<ffi.Void> pNotifyArg,
);
typedef _sqlite3_unlock_notify_Dart = int Function(
  ffi.Pointer<sqlite3> pBlocked,
  void (*)(void **, int) xNotify,
  ffi.Pointer<void> pNotifyArg,
);

/// C function `sqlite3_strnicmp`.

int sqlite3_strnicmp(
  ffi.Pointer<int> arg0,
  ffi.Pointer<int> arg1,
  int arg2,
) {
  return   _sqlite3_strnicmp(arg0, arg1, arg2);
}
final _sqlite3_strnicmp_Dart _sqlite3_strnicmp = _dl.lookupFunction<_sqlite3_strnicmp_C, _sqlite3_strnicmp_Dart>('sqlite3_strnicmp');
typedef _sqlite3_strnicmp_C = int Function(
  ffi.Pointer<ffi.Uint8> arg0,
  ffi.Pointer<ffi.Uint8> arg1,
  int arg2,
);
typedef _sqlite3_strnicmp_Dart = int Function(
  ffi.Pointer<int> arg0,
  ffi.Pointer<int> arg1,
  int arg2,
);

/// C function `sqlite3_log`.

void sqlite3_log(
  int iErrCode,
  ffi.Pointer<int> zFormat,
) {
   _sqlite3_log(iErrCode, zFormat);
}
final _sqlite3_log_Dart _sqlite3_log = _dl.lookupFunction<_sqlite3_log_C, _sqlite3_log_Dart>('sqlite3_log');
typedef _sqlite3_log_C = ffi.Void Function(
  int iErrCode,
  ffi.Pointer<ffi.Uint8> zFormat,
);
typedef _sqlite3_log_Dart = void Function(
  int iErrCode,
  ffi.Pointer<int> zFormat,
);

/// C function `sqlite3_wal_hook`.

ffi.Pointer<void> sqlite3_wal_hook(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *,  sqlite3 *,  char *, int) arg1,
  ffi.Pointer<void> arg2,
) {
  return   _sqlite3_wal_hook(arg0, arg1, arg2);
}
final _sqlite3_wal_hook_Dart _sqlite3_wal_hook = _dl.lookupFunction<_sqlite3_wal_hook_C, _sqlite3_wal_hook_Dart>('sqlite3_wal_hook');
typedef _sqlite3_wal_hook_C = ffi.Pointer<ffi.Void> Function(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *,  sqlite3 *,  char *, int) arg1,
  ffi.Pointer<ffi.Void> arg2,
);
typedef _sqlite3_wal_hook_Dart = ffi.Pointer<void> Function(
  ffi.Pointer<sqlite3> arg0,
  int (*)(void *,  sqlite3 *,  char *, int) arg1,
  ffi.Pointer<void> arg2,
);

/// C function `sqlite3_wal_autocheckpoint`.

int sqlite3_wal_autocheckpoint(
  ffi.Pointer<sqlite3> db,
  int N,
) {
  return   _sqlite3_wal_autocheckpoint(db, N);
}
final _sqlite3_wal_autocheckpoint_Dart _sqlite3_wal_autocheckpoint = _dl.lookupFunction<_sqlite3_wal_autocheckpoint_C, _sqlite3_wal_autocheckpoint_Dart>('sqlite3_wal_autocheckpoint');
typedef _sqlite3_wal_autocheckpoint_C = int Function(
  ffi.Pointer<sqlite3> db,
  int N,
);
typedef _sqlite3_wal_autocheckpoint_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  int N,
);

/// C function `sqlite3_wal_checkpoint`.

int sqlite3_wal_checkpoint(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zDb,
) {
  return   _sqlite3_wal_checkpoint(db, zDb);
}
final _sqlite3_wal_checkpoint_Dart _sqlite3_wal_checkpoint = _dl.lookupFunction<_sqlite3_wal_checkpoint_C, _sqlite3_wal_checkpoint_Dart>('sqlite3_wal_checkpoint');
typedef _sqlite3_wal_checkpoint_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zDb,
);
typedef _sqlite3_wal_checkpoint_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zDb,
);

/// C function `sqlite3_wal_checkpoint_v2`.

int sqlite3_wal_checkpoint_v2(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zDb,
  int eMode,
  ffi.Pointer<int> pnLog,
  ffi.Pointer<int> pnCkpt,
) {
  return   _sqlite3_wal_checkpoint_v2(db, zDb, eMode, pnLog, pnCkpt);
}
final _sqlite3_wal_checkpoint_v2_Dart _sqlite3_wal_checkpoint_v2 = _dl.lookupFunction<_sqlite3_wal_checkpoint_v2_C, _sqlite3_wal_checkpoint_v2_Dart>('sqlite3_wal_checkpoint_v2');
typedef _sqlite3_wal_checkpoint_v2_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zDb,
  int eMode,
  ffi.Pointer<int> pnLog,
  ffi.Pointer<int> pnCkpt,
);
typedef _sqlite3_wal_checkpoint_v2_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zDb,
  int eMode,
  ffi.Pointer<int> pnLog,
  ffi.Pointer<int> pnCkpt,
);

/// C function `sqlite3_vtab_config`.

int sqlite3_vtab_config(
  ffi.Pointer<sqlite3> arg0,
  int op,
) {
  return   _sqlite3_vtab_config(arg0, op);
}
final _sqlite3_vtab_config_Dart _sqlite3_vtab_config = _dl.lookupFunction<_sqlite3_vtab_config_C, _sqlite3_vtab_config_Dart>('sqlite3_vtab_config');
typedef _sqlite3_vtab_config_C = int Function(
  ffi.Pointer<sqlite3> arg0,
  int op,
);
typedef _sqlite3_vtab_config_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
  int op,
);

/// C function `sqlite3_vtab_on_conflict`.

int sqlite3_vtab_on_conflict(
  ffi.Pointer<sqlite3> arg0,
) {
  return   _sqlite3_vtab_on_conflict(arg0);
}
final _sqlite3_vtab_on_conflict_Dart _sqlite3_vtab_on_conflict = _dl.lookupFunction<_sqlite3_vtab_on_conflict_C, _sqlite3_vtab_on_conflict_Dart>('sqlite3_vtab_on_conflict');
typedef _sqlite3_vtab_on_conflict_C = int Function(
  ffi.Pointer<sqlite3> arg0,
);
typedef _sqlite3_vtab_on_conflict_Dart = int Function(
  ffi.Pointer<sqlite3> arg0,
);

/// C function `sqlite3_rtree_geometry_callback`.

int sqlite3_rtree_geometry_callback(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zGeom,
  int (*)( sqlite3_rtree_geometry *, int, double *, int *) xGeom,
  ffi.Pointer<void> pContext,
) {
  return   _sqlite3_rtree_geometry_callback(db, zGeom, xGeom, pContext);
}
final _sqlite3_rtree_geometry_callback_Dart _sqlite3_rtree_geometry_callback = _dl.lookupFunction<_sqlite3_rtree_geometry_callback_C, _sqlite3_rtree_geometry_callback_Dart>('sqlite3_rtree_geometry_callback');
typedef _sqlite3_rtree_geometry_callback_C = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<ffi.Uint8> zGeom,
  int (*)( sqlite3_rtree_geometry *, int, double *, int *) xGeom,
  ffi.Pointer<ffi.Void> pContext,
);
typedef _sqlite3_rtree_geometry_callback_Dart = int Function(
  ffi.Pointer<sqlite3> db,
  ffi.Pointer<int> zGeom,
  int (*)( sqlite3_rtree_geometry *, int, double *, int *) xGeom,
  ffi.Pointer<void> pContext,
);

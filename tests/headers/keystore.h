#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

void account_destroy(void *account);

int32_t error_message_utf8(char *buf, int32_t length);

void *keystore_account(void *keystore);

void keystore_destroy(void *keystore);

void *keystore_from_keyfile(const char *path);

int32_t keystore_generate(void *keystore, const char *password);

int32_t keystore_import(void *keystore, const char *phrase, const char *password);

int32_t keystore_lock(void *keystore);

void *keystore_new(void);

int32_t keystore_paper_backup(void *keystore);

const char *keystore_phrase(void *keystore, const char *password);

int32_t keystore_set_paper_backup(void *keystore);

int32_t keystore_status(const void *keystore);

int32_t keystore_unlock(void *keystore, const char *password);

int32_t last_error_length(void);

void phrase_destroy(char *phrase);
#include <stdint.h>

int64_t add(int64_t a, int64_t b);

int callback_test(
    int (*callback)(void *, int, char **, char **), /* Callback function */
);

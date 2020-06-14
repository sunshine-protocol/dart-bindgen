#include <stdint.h>

int64_t add(int64_t a, int64_t b);

typedef struct address
{
    char *name;
    char *street;
    char *city;
    char *state;
    int pin;
} address;

int callback_test(
    int (*callback)(void *, int, char **, char **), /* Callback function */
);

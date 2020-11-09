#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

enum NormalEnum {
    NormalValueA,
    NormalValueB,
    NormalValueC = 3,
    NormalValueD,
}

typedef enum {
  A,
  B,
  C,
  D,
  E,
  F,
} DefaultEnum;

typedef enum {
  G,
  H = 20,
  J = 55,
  K,
  L,
  M,
} ValuedEnum;


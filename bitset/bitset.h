/**
 * @author Amin Tahmasebi
 * @date 2023 
 * @class Bitset
*/

#ifndef BITSET_H_
#define BITSET_H_

#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>

#define BITSET_OUT_OF_RANGE -1
// #define BITSET_LOGGING_ENABLE

#ifdef BITSET_LOGGING_ENABLE
    #define BITSET_LOG(fmt, ...) \
        do { fprintf(stderr, "[BITSET LOG] " fmt "\n", ##__VA_ARGS__); } while (0)
#else
    #define BITSET_LOG(fmt, ...) do { } while (0)
#endif



typedef struct Bitset Bitset;

struct Bitset {
    unsigned char* bits;
    size_t size;
};

void bitset_set_from_string(Bitset* bs, const char* bits);
void bitset_print(const Bitset* bs);
void bitset_deallocate(Bitset* bs);

Bitset* bitset_create(size_t num_bits);
Bitset* bitset_set(Bitset* bs, size_t pos, bool value);
Bitset* bitset_reset(Bitset* bs, size_t pos);
Bitset* bitset_flip(Bitset* bs, size_t pos);
Bitset* bitset_flip_all(Bitset* bs);

bool bitset_all(const Bitset* bs);
bool bitset_any(const Bitset* bs);
bool bitset_none(const Bitset* bs);
bool bitset_test(const Bitset* bs, size_t pos);

size_t bitset_count(const Bitset* bs);
size_t bitset_size(const Bitset* bs);

unsigned long bitset_to_ulong(const Bitset* bs);
unsigned long long bitset_to_ullong(const Bitset* bs);

char* bitset_to_string(const Bitset* bs);

#endif 

#include "algorithm.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

static void swap(void *a, void *b, size_t size) {
    char *temp = (char*) malloc(sizeof(char) * size);
    if (temp) {
        memcpy(temp, a, size);
        memcpy(a, b, size);
        memcpy(b, temp, size);
        free(temp);  // Free the allocated memory
    } 
    else {
        perror("Can not allocate memory for swap");
        exit(-1);
    }
}

static void reverse(void *first, void *last, size_t size) {
    char *a = (char *)first;
    char *b = (char *)last - size;
    while (a < b) {
        swap(a, b, size);
        a += size;
        b -= size;
    }
}

static void quickSortInternal(void *base, size_t low, size_t high, size_t size, CompareFunc comp, void *temp) {
    if (low < high) {
        char* pivot = (char*)base + high * size;
        size_t i = low;

        for (size_t j = low; j < high; j++) {
            if (comp((char*)base + j * size, pivot) < 0) {
                memcpy(temp, (char*)base + j * size, size);
                memcpy((char*)base + j * size, (char*)base + i * size, size);
                memcpy((char*)base + i * size, temp, size);
                i++;
            }
        }

        memcpy(temp, (char*)base + i * size, size);
        memcpy((char*)base + i * size, pivot, size);
        memcpy(pivot, temp, size);

        if (i > 0) 
            quickSortInternal(base, low, i - 1, size, comp, temp);
        quickSortInternal(base, i + 1, high, size, comp, temp);
    }
}

void algorithm_sort(void *base, size_t num, size_t size, CompareFunc comp) {
    if (num > 1) {
        void* temp = malloc(size);
        if (temp) {
            quickSortInternal(base, 0, num - 1, size, comp, temp);
            free(temp);
        } 
        else {
            perror("Failed to allocate memory for sorting");
            exit(EXIT_FAILURE);
        }
    }
}

void *algorithm_find(const void *base, size_t num, size_t size, const void *val, CompareFunc comp) {
    const char *ptr = (const char*)base;

    for (size_t i = 0; i < num; i++) {
        if (comp(ptr + i * size, val) == 0) {
            return (void *)(ptr + i * size);
        }
    }

    return NULL;
}

void *algorithm_find_if(const void *base, size_t num, size_t size, BoolPredicateFunc pred) {
    const char *ptr = (const char*)base;

    for (size_t i = 0; i < num; i++) {
        if (pred(ptr + i * size)) {
            return (void *)(ptr + i * size);
        }
    }

    return NULL;
}

void *algorithm_find_if_not(const void *base, size_t num, size_t size, BoolPredicateFunc pred) {
    const char *ptr = (const char*)base;

    for (size_t i = 0; i < num; i++) {
        if (!pred(ptr + i * size)) {
            return (void *)(ptr + i * size);
        }
    }

    return NULL;
}

void *algorithm_find_end(const void *base1, size_t num1, size_t size1, const void *base2, size_t num2, size_t size2, CompareFunc comp) {
    if (num2 == 0) {
        return (void*)((char*)base1 + num1 * size1);
    }

    void *ret = NULL;
    const char *ptr1 = (const char*)base1;
    const char *ptr2 = (const char*)base2;

    for (size_t i = 0; i <= num1 - num2; ++i) {
        bool found = true;
        for (size_t j = 0; j < num2; ++j) {
            if (!comp(ptr1 + (i + j) * size1, ptr2 + j * size2)) {
                found = false;
                break;
            }
        }
        if (found) {
            ret = (void *)(ptr1 + i * size1);
        }
    }
    return ret;
}

void *algorithm_find_first_of(const void *base1, size_t num1, size_t size1, const void *base2, size_t num2, size_t size2, CompareFunc comp) {
    const char *ptr1 = (const char*)base1;
    const char *ptr2 = (const char*)base2;

    for (size_t i = 0; i < num1; ++i) {
        for (size_t j = 0; j < num2; ++j) {
            if (comp(ptr1 + i * size1, ptr2 + j * size2) == 0) {
                return (void *)(ptr1 + i * size1);
            }
        }
    }

    return NULL;
}

bool algorithm_binary_search(const void *base, size_t num, size_t size, const void *val, CompareFunc comp) {
    size_t low = 0;
    size_t high = num;

    while (low < high) {
        size_t mid = low + (high - low) / 2;
        const void *mid_elem = (const char *)base + mid * size;

        int result = comp(mid_elem, val);
        if (result < 0) {
            low = mid + 1;
        } 
        else if (result > 0) {
            high = mid;
        } 
        else {
            return true; // Element found
        }
    }
    return false; // Element not found
}

void *algorithm_max_element(const void *base, size_t num, size_t size, CompareFunc comp) {
    if (num == 0) {
        return NULL;
    }

    const char *max_element = (const char *)base;
    for (size_t i = 1; i < num; ++i) {
        const char *element = (const char *)base + i * size;
        if (comp(max_element, element) < 0) {
            max_element = element;
        }
    }
    return (void *)max_element;
}

void *algorithm_min_element(const void *base, size_t num, size_t size, CompareFunc comp) {
    if (num == 0) { 
        return NULL;
    }

    const char *min_element = (const char *)base;
    for (size_t i = 1; i < num; ++i) {
        const char *element = (const char *)base + i * size;
        if (comp(min_element, element) > 0) {
            min_element = element;
        }
    }
    return (void *)min_element;
}

void algorithm_for_each(void *base, size_t num, size_t size, ForEachOpFunc op) {
    char *ptr = (char *)base;
    for (size_t i = 0; i < num; ++i) {
        op(ptr + i * size);
    }
}

void algorithm_copy(const void *source, size_t num, size_t size, void *dest) {
    const char *src_ptr = (const char *)source;
    char *dest_ptr = (char *)dest;

    for (size_t i = 0; i < num; ++i) {
        memcpy(dest_ptr + i * size, src_ptr + i * size, size);
    }
}

void *algorithm_accumulate(const void *base, size_t num, size_t size, void *init, AccumulateOpFunc op) {
    char *result = (char *)init;
    const char *ptr = (const char *)base;

    for (size_t i = 0; i < num; ++i) {
        op(result, ptr + i * size);
    }
    return result;
}

bool algorithm_all_of(const void *base, size_t num, size_t size, BoolPredicateFunc pred) {
    const char *ptr = (const char *)base;

    for (size_t i = 0; i < num; ++i) {
        if (!pred(ptr + i * size)) {
            return false;
        }
    }

    return true;
}

bool algorithm_any_of(const void *base, size_t num, size_t size, BoolPredicateFunc pred) {
    const char *ptr = (const char *)base;

    for (size_t i = 0; i < num; ++i) {
        if (pred(ptr + i * size)) {
            return true;
        }
    }

    return false;
}

bool algorithm_none_of(const void *base, size_t num, size_t size, BoolPredicateFunc pred) {
    const char *ptr = (const char *)base;

    for (size_t i = 0; i < num; ++i) {
        if (pred(ptr + i * size)) {
            return false;
        }
    }

    return true;
}

void algorithm_fill(void *first, void *last, size_t size, const void *val) {
    for (char *ptr = first; ptr != last; ptr += size) {
        memcpy(ptr, val, size);
    }
}

void algorithm_fill_n(void *first, size_t n, size_t size, const void *val) {
    for (char *ptr = first; n > 0; ptr += size, n--) {
        memcpy(ptr, val, size);
    }
}

size_t algorithm_count(const void *base, size_t num, size_t size, const void *val, CompareFunc comp) {
    size_t count = 0;
    const char *ptr = (const char *)base;

    for (size_t i = 0; i < num; ++i) {
        if (comp(ptr + i * size, val) == 0) {
            ++count;
        }
    }

    return count;
}

size_t algorithm_count_if(const void *base, size_t num, size_t size, BoolPredicateFunc pred) {
    size_t count = 0;
    const char *ptr = (const char *)base;

    for (size_t i = 0; i < num; ++i) {
        if (pred(ptr + i * size)) {
            ++count;
        }
    }

    return count;
}

void algorithm_shuffle(void *base, size_t num, size_t size, UniformRandomNumberGenerator rng) {
    if (num > 1) {
        char *arr = (char *)base;
        char *temp = malloc(size);
        if (!temp) {
            perror("Failed to allocate memory for shuffle");
            exit(EXIT_FAILURE);
        }

        for (size_t i = num - 1; i > 0; i--) {
            size_t j = rng() % (i + 1);

            // Swap arr[i] and arr[j]
            memcpy(temp, arr + i * size, size);
            memcpy(arr + i * size, arr + j * size, size);
            memcpy(arr + j * size, temp, size);
        }

        free(temp);
    }
}

void *algorithm_lower_bound(const void *base, size_t num, size_t size, const void *val, CompareFunc comp) {
    size_t low = 0;
    size_t high = num;

    while (low < high) {
        size_t mid = low + (high - low) / 2;
        const void *mid_elem = (const char *)base + mid * size;

        if (comp(mid_elem, val) < 0) {
            low = mid + 1;
        } 
        else {
            high = mid;
        }
    }
    return (void *)((const char *)base + low * size);
}

void *algorithm_upper_bound(const void *base, size_t num, size_t size, const void *val, CompareFunc comp) {
    size_t low = 0;
    size_t high = num;

    while (low < high) {
        size_t mid = low + (high - low) / 2;
        const void *mid_elem = (const char *)base + mid * size;

        if (comp(mid_elem, val) <= 0) {
            low = mid + 1;
        } 
        else {
            high = mid;
        }
    }
    return (void *)((const char *)base + low * size);
}

void algorithm_transform(const void *base, size_t num, size_t size, void *result, TransformFunc op) {
    const char *input_ptr = (const char *)base;
    char *output_ptr = (char *)result;

    for (size_t i = 0; i < num; ++i) {
        op(output_ptr + i * size, input_ptr + i * size);
    }
}

void *algorithm_reduce(const void *base, size_t num, size_t size, void *init, ReduceFunc op) {
    const char *ptr = (const char *)base;
    char *result = (char *)init;

    for (size_t i = 0; i < num; ++i) {
        op(result, ptr + i * size);
    }
    return result;
}

size_t algorithm_unique(void *base, size_t num, size_t size, CompareFunc comp) {
    if (num == 0) {
        return 0;
    }

    size_t uniqueCount = 1; // First element is always unique
    char *array = (char *)base;

    for (size_t i = 1; i < num; ++i) {
        // Compare current element with the last unique element
        if (comp(array + (uniqueCount - 1) * size, array + i * size) != 0) {
            // If different, move it to the next unique position
            if (uniqueCount != i) {
                memcpy(array + uniqueCount * size, array + i * size, size);
            }
            uniqueCount++;
        }
    }
    return uniqueCount;
}

bool algorithm_equal(const void *base1, size_t num1, size_t size1, const void *base2, size_t num2, size_t size2, 
                     CompareFunc comp) {
    // If the number of elements or sizes differ, the ranges are not equal
    if (num1 != num2 || size1 != size2) {
        return false;
    }

    const char *ptr1 = (const char *)base1;
    const char *ptr2 = (const char *)base2;

    for (size_t i = 0; i < num1; ++i) {
        if (comp(ptr1 + i * size1, ptr2 + i * size2) != 0) {
            return false;
        }
    }

    return true;
}

bool algorithm_next_permutation(void *first, void *last, size_t size, CompareFuncBool comp) {
    if (first == last) {
        return false;
    }

    char *i = (char *)last - size;
    while (i != (char *)first) {
        char *j = i;
        i -= size;

        if (comp(i, j)) {
            char *k = (char *)last - size;
            while (!comp(i, k)) {
                k -= size;
            }
            swap(i, k, size);
            reverse(j, last, size);

            return true;
        }

        if (i == (char *)first) {
            reverse(first, last, size);
            return false;
        }
    }
    return false; // This should not be reached
}

bool algorithm_prev_permutation(void *first, void *last, size_t size, CompareFuncBool comp) {
    if (first == last) {
        return false;
    }

    char *i = (char *)last - size;
    while (i != (char *)first) {
        char *j = i;
        i -= size;

        if (comp(j, i)) {
            char *k = (char *)last - size;
            while (!comp(k, i)) {
                k -= size;
            }
            swap(i, k, size);
            reverse(j, last, size);
            return true;
        }

        if (i == (char *)first) {
            reverse(first, last, size);
            return false;
        }
    }
    return false;
}

void *algorithm_partition(void *base, size_t num, size_t size, BoolPredicateFunc pred) {
    char *first = (char *)base;
    char *last = first + num * size;

    while (first != last) {
        while (first != last && pred(first)) {
            first += size;
        }
        do {
            last -= size;
            if (first == last) 
                break;
        } while (!pred(last));

        if (first != last) {
            swap(first, last, size);
            first += size;
        }
    }
    return first;
}

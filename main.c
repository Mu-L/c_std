#include "fmt/fmt.h"
#include "string/std_string.h"


int main() {
    String* str = string_create("121");

    fmt_printf("%s is palindrome %d", string_c_str(str), string_is_palindrome(str));

    string_deallocate(str);
    return 0;
}
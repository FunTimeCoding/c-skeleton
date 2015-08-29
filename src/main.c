#include <stdio.h>

static char input[2048];

int main(int argc, char** argv) {
    puts("ctrl+c to exit");

    while (1) {
        fputs(">", stdout);
        fgets(input, 2048, stdin);
        printf("%s", input);
    }

    return 0;
}

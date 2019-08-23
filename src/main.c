#include <stdio.h>
#include <string.h>

static char input[2048];

int main(int argc, char **argv) {
    puts("ctrl+c to exit, or enter exit");

    while (1) {
        fputs(">", stdout);
        fgets(input, 2048, stdin);
        printf("%s", input);

        if (strcmp(input, "exit") == 0) {
            break;
        }
    }

    return 0;
}

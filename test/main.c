#include <stdio.h>

int AddGo(int,int);
int add_rust(int,int);
int add_zig(int,int);

int main() {
    int r1 = AddGo(10,20);
    int r2 = add_rust(10,20);
    int r3 = add_zig(10,20);

    printf("\n---- test ----\n");
    printf("go: %d\n", r1);
    printf("rust: %d\n", r2);
    printf("zig: %d\n", r3);

    return 0;
}

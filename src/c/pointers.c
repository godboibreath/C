#include<stdio.h>
#include<stdbool.h>

int main() {
    int x = 10;
    int *p;
    int *s;
    s = &x;
    p = s;
    printf("Pointer p: %p \tPointer s:%p\n", (void *)p, (void *)s);
    printf("%d\t%d\n", *p, *s);
    printf("%d\n", x);
    return 0;
}
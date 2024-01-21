#include <stdio.h>

int main() {

    int n[10]; /* n is an array of 10 integers*/

    int i, j;

    /* initalize elements of array 1 through 10*/

    for (i = 0; i < 10; i++) {
        n[i] = i + 100;
    }

    for (j = 0; j < 10; j++) {
        printf("Element[%d] = %d\n", j, n[j]);
    }

    return 0;
}
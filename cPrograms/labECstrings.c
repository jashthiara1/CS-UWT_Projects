// Jasharn Thiara
// TCSS 380
// Extra credit Lab

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *addCommas(char *);

int main(void) {
    
char myString[] = "12345678";
char *str = addCommas(myString);

printf("%s\n", str);
free(str);

return 0;


}

char *addCommas(char *original) {

    char temp[] = ",";
    int i, length = strlen(original);

    char *newString = malloc(sizeof(char) * (length + (length / 3) + 1));
    char *helper = newString;

    for (int i = 0; i < length; i++) {
        if ((i + 1) % 3 == 0) {
            *helper = temp[0];
            helper++;
        }
        *helper = original[i];
        helper++;

    }
    return newString;


}
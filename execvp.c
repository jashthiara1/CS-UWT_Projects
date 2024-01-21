#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define MAXSTR 255
#define ARGCNT 5

int main(int argc, char *arv[])
{

    char** args = (char**) malloc(ARGCNT * sizeof(char*));

    for (int i = 0; i <ARGCNT; i++) {
        args[i] = (char*) malloc(MAXSTR * sizeof(char));
    }

    char cmd[MAXSTR];
    char arg1[MAXSTR];
    char arg2[MAXSTR];
    char file[MAXSTR];

    printf("cmd->");
    fscanf(stdin, "%s", cmd);

    printf("arg1->");
    fscanf(stdin, "%s", arg1);

    printf("arg12>");
    fscanf(stdin, "%s", arg2);

    printf("file->");
    fscanf(stdin, "%s", file);

    *(args + 0) = cmd;
    *(args + 1) = arg1;
    *(args + 2) = arg2;
    *(args + 3) = file;
    *(args + 4) = NULL;


    execvp(cmd, args);

    perror("execvp");
    

    return 1;
}
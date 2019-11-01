/*
File di esercitazione con le stringhe 
*/

#include <stdio.h>
#include <string.h>

int main(){
    char A[] = "io sono una stringa";

    puts("copy first 5 byte of string A\n");
    char B[10];

    memcpy(B,A,5);
    printf("A: %s\nB: %s\n",A,B);
    puts("---------------------------------------");

    return 0;
}
#include <stdio.h>
#include <string.h>

int main(){
    char A[] = "abc";
    char B[] = "abc";

    int r = strcmp(A,B);

    if(r==0){
        puts("A and B are equal");
    }
    else if(r<0){
        puts("A is less than B");
    } 
    else{
        puts("A is bigger than B");
    }


    return 0;
}
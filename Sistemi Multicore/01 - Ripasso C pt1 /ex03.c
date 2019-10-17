/*
Si scriva un programma che legge in input un
numero intero “a”.

1) Il programma stampa tutti i numeri da 0 ad “a”
   in ordine crescente.

2) Il programma stampa tutti i numeri da 0 ad “a”
   in ordine decrescente.

N.B. per svolgere l’esercizio si utilizzino cicli WHILE
*/

#include <stdio.h>

void printNormal(int n){
    int i=0;
    while(i<=n){
        printf("%d ",i);
        i++;
    }
}

void printReverse(int n){
    int i = n;
    while(i>=0){
        printf("%d ",i);
        i--;
    }
}

int main(){
    int x;
    printf("Inserisci un numero intero: ");
    scanf("%d",&x);

    printNormal(x);
    printf("\n");
    printReverse(x);
    printf("\n");

    return 0;
}
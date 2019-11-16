/*
Si scriva un programma che legge in input un
numero intero "a".

1) Il programma stampa tutti i numeri da 0 ad
   "a" in ordine crescente.

2) Il programma stampa tutti i numeri da 0 ad
   "a" in ordine decrescente.

N.B. per svolgere l’esercizio si utilizzino cicli FOR
*/

#include <stdio.h>

void printNormal(int n){
    for(int i=0; i<=n;i++){
        printf("%d ",i);
    }
}

void printReverse(int n){
    for(int i=n; i>=0;i--){
        printf("%d ",i);
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
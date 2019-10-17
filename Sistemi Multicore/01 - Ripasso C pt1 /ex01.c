/*
Si scriva un programma che legge in input due
numeri interi.

1) Il programma deve stampare se il primo
   numero è maggiore, minore o uguale al
   secondo.

2) Il programma deve stampare la somma e il
   prodotto dei due numeri.
*/

#include <stdio.h>

// Stampa se il primo numero è maggiore minore o uguale al secondo
int compare(int a, int b){
    if(a > b){
        printf("%d è maggiore di %d\n",a,b);
        return 0;
    }
    if(a < b){
        printf("%d è minore di %d\n",a,b);
        return 0;
    }
    else{
        printf("%d è uguale a %d\n",a,b);
    }
    return 0;
}

// Stampa la somma dei due numeri in input
int sumNProd(int a, int b){
    printf("Somma di %d e %d = %d\n",a,b,a+b);
    printf("Prodotto di %d e %d = %d\n",a,b,a*b);
    return 0;
}

int main(){
    int x;
    int y;

    scanf("%d",&x);
    scanf("%d",&y);

    compare(x,y);
    sumNProd(x,y);
}
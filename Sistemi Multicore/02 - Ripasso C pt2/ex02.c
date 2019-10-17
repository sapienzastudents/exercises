/*
- Si scriva un programma che legge in input una
serie di numeri interi (finché l’utente non inserisce
l’intero 0) che vengono inseriti in un array in
modo dinamico
- Il programma deve poi stampare il minore e il
maggiore
*/

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main(){

    int *arr;
    int nEl = 0;
    int inp;
    int min = INT_MAX;
    int max = INT_MIN;

    arr = malloc(sizeof(int));

    if(arr==NULL){
        printf("Impossibile assegnare memoria...Terminazione\n");
        return 1;
    }

    while(1){
        printf("Immettere numero intero ad aggiungere all'array: ");
        scanf("%d",&inp);

        if(inp==0){
            break;
        }

        if(inp < min){
            min = inp;
        }
        if(inp > max){
            max = inp;
        }

        arr[nEl] = inp;
        nEl++;
        arr = realloc(arr, sizeof(int)*nEl);
    }

    printf("Valore minimo dell'array: %d\n",min);
    printf("Valore massimo dell'array: %d\n",max);

    return 0;
}
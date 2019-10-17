/*
- Si scriva un programma che legge in input una
  serie di numeri interi (finché l’utente non inserisce
  l’intero 0) che vengono inseriti in un array in
  modo dinamico
- Il programma deve poi stampare la somma di tutti
  gli interi
*/
#include <stdio.h>
#include <stdlib.h>

int main(){

    int *array;
    int input;
    int numEl = 0;

    array = malloc(sizeof(int)); // Allochiamo spazio per un elemento

    //L'allocazione di spazio potrebbe non andare a buon fine.. quindi controlliamo
    if(array==NULL){
        printf("Impossibile allocare memoria, terminazione...\n");
        return 1;
    }

    while(1){
        printf("Inserisci numero(0 per terminare): ");
        scanf("%d",&input);
        
        if(input==0){
            break;
        }

        array[numEl] = input;
        numEl++; 
        array = realloc(array, sizeof(int)*numEl);   //Aumentiamo lo spazio dell'array

    }

    printf("Si procede a stampare l'array...\n");
    for(int i=0;i<numEl;i++){
        printf("%d ", array[i]);
    }
    printf("\n");

    free(array);

    return 0;
}
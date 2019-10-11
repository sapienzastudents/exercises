/*
- Si scriva un programma che dichiara due Array di interi
  (array1 e array2) di 5 elementi e permette all’utente di
  riempirli
- Successivamente, tramite l’utilizzo di due puntatori,
  inverte il primo elemento di array1 con l’ultimo di
  array2, il secondo elemento di array1 con il penultimo
  di array2 e così via...
- Infine si stampino i due Array modificati
*/

#include <stdio.h>

int fillArray(int* A){
    for(int i=0;i<5;i++){
        scanf("%d",&A[i]);
    }

    return 0;
}

void swapEl(int *p1, int *p2){
    int x;
    int i=0;
    int j=4;
    while(i<5 && j>=0){
        x = *p1;
        *p1 = *p2;
        *p2 = x;
        p1++;
        p2--;
        i++;
        j--;
    }
}

void printArray(int* A){
    for(int i=0;i<5;i++){
        printf("%d ",A[i]);
    }
    printf("\n");
}


int main(){

    int array1[5];
    int array2[5];

    int *p1;
    int *p2;

    p1 = &array1[0];
    p2 = &array2[4];

    printf("Inserisci uno alla volta i 5 numeri per l'array1\n");
    fillArray(array1);

    printf("Inserisci uno alla volta i 5 numeri per l'array2\n");
    fillArray(array2);

    swapEl(p1,p2);

    printf("\n");
    printf("array1: ");
    printArray(array1);
    printf("array2: ");
    printArray(array2);

    return 0;
}
/*
Si scriva un programma che legge in input 5
numeri interi e li salva in un array

1) Il programma stampa il numero più grande e il
   numero più piccolo

2) Il programma stampa la somma di tutti I numeri
   N.B. per svolgere l’esercizio si deve utilizzare un
   array e I cicli FOR
*/

#include <stdio.h>
#include <limits.h>

void printMaxMin(int* arr){
    int min = INT_MAX;
    int max = INT_MIN;

    for(int i=0;i<5;i++){
        if(arr[i]< min){
            min = arr[i];
        }
        if(arr[i]>max){
            max = arr[i];
        }
        
    }

    printf("massimo: %d\n",max);
    printf("minimo: %d\n",min);
}

void printSum(int* arr){
    int sum = 0;
    for(int i=0; i<5;i++){
        sum += arr[i];
    }
    printf("somma di tutti i numeri nell'array: %d\n",sum);
}

int main(){
    int arr[5];
    int i;
    
    //prende i numeri da input e li salva nell'array
    for(i=0;i<5;i++){
        printf("inserisci un numero intero: ");
        scanf("%d",&arr[i]);
    }

    printMaxMin(arr);
    printSum(arr);

}
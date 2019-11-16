/*
Scrivere una funzione che dato un array di interi e un
valore x cerca il valore x nell’array. Se il valore x è
presente allora restituirà la posizione altrimenti un codice
di errore 404.
*/

#include <stdio.h>

int find(int* A, int n){
    size_t lenght = sizeof(A);  //Permette di conoscere il numero di elementi dell'array
    for(int i=0;i<lenght;i++){
        if(A[i]==n){
            return i;       // Se abbiamo trovato n nell'array ritorniamo la posizione
        }
    }
    return 404; 
}

int main(){
    int arr[] = {2,56,42,21,987,222,9};

    int x;

    printf("Inserisci numero da ricercare: ");
    scanf("%d",&x);
    
    int res = find(arr,x); 

    printf("\n Risultato della ricerca: %d\n",res);

    return 0;
}
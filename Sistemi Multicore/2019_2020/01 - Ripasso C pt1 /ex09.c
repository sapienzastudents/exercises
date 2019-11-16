/*
Modificare la funzione di ricerca (scritta in ex08.c) affinché restituisca
anche il numero di occorrenze del valore ricercato
*/

#include <stdio.h>

int find_plusOcc(int* A, int n){
    int occ = 0;
    int res = 404;
    size_t lenght = sizeof(A);  //Permette di conoscere il numero di elementi dell'array
    for(int i=0;i<=lenght;i++){
        if(A[i]==n){
            if(res==404){
                res = i;       // Se abbiamo trovato n nell'array ritorniamo la posizione
            }
            occ++;
        }
    }
    printf("\n Risultato della ricerca: %d\n",res);
    printf("\n Numero di occorrenze: %d\n",occ);
    return res; 
}

int main(){
    int arr[] = {2,56,42,2,987,222,9,42,42};

    int x;

    printf("Inserisci numero da ricercare: ");
    scanf("%d",&x);
    
    find_plusOcc(arr,x); 


    return 0;
}
/*
Scrivere una funzione int included(int A[],int n, int B[], int
m) che ritorna 1 se tutti i valori nel vettore A (di
dimensione n) sono anche contenuti nel vettore B (di
dimensione m), altrimenti ritorna 0. Ad esempio, se A =
{2, 1, 3, 2, 1} e B = {5, 1, 3, 2} allora la funzione ritorna 1,
se invece B = {5, 3, 2, 0} ritorna 0.
*/

#include <stdio.h>

int included(int* A, int n, int* B, int m){
    //Controlla se tutti gli elementi di A sono in B
    for(int i=0;i<n;i++){
        int j=0;
        while(j<m && B[j]!= A[i]){
            j++;
        }
        if(j==m){
            return 0;
        }
    }
    
    //Controlla se tutti gli elementi di B sono in A
    for(int i=0;i<m;i++){
        int j=0;
        while(j<n && A[j]!= B[i]){
            j++;
        }
        if(j==m){
            return 0;
        }
    }
    return 1;
}

int main(){
    int A[] = {2, 1, 3, 2, 1};
    int B[] = {5, 1, 3, 2};
    int C[] = {5, 3, 2, 0};
    int x = 5;
    int y = 4;

    printf("Risultato A intersecato B %d\n",included(A,x,B,y));  //Questo ritorna 1

    printf("Risultato A intersecato C %d\n",included(A,x,C,y));  //Questo ritorna 0

    return 0;
}
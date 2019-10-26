/*
Problema del lettore-scrittore: un thread si occupa di scrivere la stringa ciaociao, 
mentre altri tre si occupano della sua lettura. Non è possible avere letture 
e scritture contemporaneamente. Risolvere il problema usando i mutex.
*/

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#define N_THREAD 4


pthread_mutex_t mymutex = PTHREAD_MUTEX_INITIALIZER;
char* str[10];

void* *writeStr(void *p){
    pthread_mutex_lock(&mymutex);

    
    pthread_mutex_unlock(&mymutex);
    pthread_exit((void *)0);
}

void* *readStr(void *p){
    pthread_mutex_lock(&mymutex);

    pthread_mutex_unlock(&mymutex);
    pthread_exit((void *)0);
}

int main(){
    pthread_t threads[N_THREAD]; //Inizializziamo 4 thread
    int rc, i;  //variabili indice e return code
    
    //------- CREAZIONE DEI THREAD ------- 

    //Creazione del thread di scrittura
    if ( (rc = pthread_create(&threads[0],NULL, writeStr, &str)) ){
        printf("Errore nella creazione del thread: %d\n",rc);
        return rc;
    }
    i++;

    //Creazione dei thread di lettura
    for (i=1;i<N_THREAD;i++){
        if ( (rc = pthread_create(&threads[0],NULL, readStr, &str)) ){
            printf("Errore nella creazione del thread: %d\n",rc);
            return rc;
        }
    }

    return 0;
}
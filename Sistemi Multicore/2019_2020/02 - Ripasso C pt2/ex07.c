/*
Si scriva un programma che crea una lista di 20 elementi, ognuno composto da
un solo campo intero di nome valore
- Ogni elemento della lista deve impostare il valore alla rispettiva posizione nella
lista
- Es. il primo elemento deve avere valore 1, il secondo deve avere valore 2 ecc...
- Si dichiarino le seguenti funzioni:
  struct Elemento *creaLista();
  struct Elemento *eliminaPrimo(struct Elemento *p);
  void eliminaDecimo(struct Elemento *p);
  void eliminaUltimo(struct Elemento *p);
  void stampaLista(struct Elemento *p);

- Il programma, una volta creata la lista con la relativa funzione, usa le funzioni
  dichiarate rispettivamente per eliminare il primo, il decimo e l’ultimo elemento.
  Ogni volta che elimina un elemento (richiamando la funzione corretta), deve
  richiamare la funzione stampaLista per stampare l’intera lista modificata.
*/

#include <stdio.h>  //for io operations
#include <stdlib.h>  //used for dynamic memory managment

struct Elemento{
    int valore;
    struct Elemento *next;
};

struct Elemento *creaLista(){
    struct Elemento *startP;
    struct Elemento *pointer;
    
    startP = (struct Elemento*) malloc (sizeof(struct Elemento));
    if(startP==NULL){
        printf("Impossibile allocare memoria...\n");
        return NULL;
    }
    startP->valore = 1;
    pointer = startP;
    int i = 0;
    for(i=1;i<20;i++){

        pointer->next = (struct Elemento*)malloc(sizeof(struct Elemento));

        if(pointer->next==NULL){
            printf("Impossibile allocare memoria...\n");
            return NULL;
        }
        pointer = pointer->next;
        pointer->valore = i+1;
        pointer->next = NULL;
    }

    return startP;
};

struct Elemento *eliminaPrimo(struct Elemento *p){
    if(p==NULL){
        printf("Nessun elemento nella lista!\n");
        return NULL;
    }
    p = p->next;
    return p;
};

void eliminaDecimo(struct Elemento *p){
    while(p->next->valore != 10){
        p = p->next;
    }
    p->next = p->next->next;
};

void eliminaUltimo(struct Elemento *p){
    while(p->next->next!=NULL){
        p = p->next;
    }
    p->next = NULL;
};

void stampaLista(struct Elemento *p){
    while(p!=NULL){
        printf("-->%d\n",p->valore);
        p = p->next;
    }
}


int main(){
    struct Elemento *start, *ptr;
    ptr = creaLista();
    printf("\nSTAMPA LISTA APPENA CREATA\n");
    stampaLista(ptr);
    printf("\n----------------\n");

    ptr = eliminaPrimo(ptr);
    printf("\nSTAMPA LISTA PRIMO ELEMENTO ELIMINATO\n");
    stampaLista(ptr);
  

    printf("\n----------------\n");

    eliminaDecimo(ptr);
    printf("\nSTAMPA LISTA DECIMO ELEMENTO ELIMINATO\n");
    stampaLista(ptr); 

    printf("\n----------------\n");

    eliminaUltimo(ptr);
    printf("\nSTAMPA LISTA ULTIMO ELEMENTO ELIMINATO\n");
    stampaLista(ptr);
    
    return 0;
}
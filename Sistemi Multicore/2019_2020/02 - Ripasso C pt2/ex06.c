/*
- Si scriva un programma che permette all’utente di
  inserire delle Automobili (l’utente ne può inserire
  quante ne preferisce)
- Ogni auto deve contenere i campi prezzo e
  modello
- Alla fine il programma deve stampare tutte le auto
  inserite dall’utente
*/

#include <stdio.h>
#include <stdlib.h>

typedef struct Automobile{
    char modello[20];
    float prezzo; 
    struct Automobile *next;
}autom;


//Inizializza la lista
autom *initList(){
    autom *ret;
    ret = (autom*) malloc(sizeof(autom));
    return ret;
};


//Si occupa di aggiungere un elemento alla lista
int addElement(autom *p){

    int cont;
    printf("Vuoi continuare ad aggiungere Auto?\n0) si\n1) no\n> ");
    scanf("%d",&cont);

    //Controlla se l'utente vuole continuare ad aggiungere macchine
    if(cont==1){
        return 1;
    }

    p->next = (autom*) malloc(sizeof(autom));
    if(p->next==NULL){
        printf("Impossibile allocare memoria..Termino il programma");
        return 1;
    }

    printf("Inserisci modello: ");
    scanf("%s", &p->next->modello);

    printf("\nInserisci prezzo: ");
    scanf("%f", &p->next->prezzo);

    return 0;
}

//Stampa il contenuto della lista
int printList(autom *p){
    while(p!=NULL){
        printf("\nModello: %s\n", p->modello);
        printf("Prezzo: %f\n", p->prezzo);
        printf("--------------------");

        p = p->next;
    }
    return 0;
}

int main(){

    autom *startP = initList();
    if(startP==NULL){
        printf("Impossibile allocare memoria..Termino il programma");
        return 1;
    }

    printf("Inserisci modello: ");
    scanf("%s", &startP->modello);

    printf("\nInserisci prezzo: ");
    scanf("%f", &startP->prezzo);

    autom *pointer = startP;


    printf("\n##### INSERIMENTO AUTO #####\n");
    while(1){
        int v;
        v = addElement(pointer);
        pointer = pointer->next;
        if(v==1){
            break;
        }
    }

    pointer = startP;
    printf("\n##### STAMPA DELLA LISTA #####\n");
    printList(pointer);

    return 0;
}
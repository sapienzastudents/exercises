/* 
- Si dichiari una struttura di nome Automobile che
  contiene i seguenti campi: prezzo, modello,
  cilindrata, colore.
- Il programma deve permettere all’utente di salvare
  tre tipi di macchine differenti (quindi deve poter
  inserire in input tutti i campi delle tre rispettive
  macchine)
- Infine, si stampino tutti i campi delle tre macchine
*/

#include <stdio.h>

struct Automobile {
        int prezzo;
        char modello[100];
        int cilindrata;
        char colore[100];
};

void stampaAuto(struct Automobile a){
    printf("Prezzo: %d\n", a.prezzo);
    printf("Modello: %s\n", a.modello);
    printf("Cilindrata: %d\n", a.cilindrata);
    printf("Colore: %s\n", a.colore);
    printf("---------------------\n");
}

struct Automobile creaAuto(struct Automobile a){
    printf("--- Costruzione automobile ---\n");
    
    printf("Inserisci un intero per il prezzo: ");
    scanf("%d",&a.prezzo);
    
    printf("Inserisci una stringa per il modello: ");
    scanf("%s",&a.modello);
    
    printf("Inserisci un intero per la cilindrata: ");
    scanf("%d",&a.cilindrata);
    
    printf("Inserisci una stringa per il colore: ");
    scanf("%s",&a.colore);

    return a;

}

int main(){

    struct Automobile a1,a2,a3;

    printf("### CREAZIONE DELLE AUTO ###\n\n");
    a1 = creaAuto(a1); printf("\n");
    a2 = creaAuto(a2); printf("\n");
    a3 = creaAuto(a3); printf("\n");

    printf("### STAMPA DELLE AUTO ###\n\n");
    stampaAuto(a1);
    stampaAuto(a2);
    stampaAuto(a3);

    return 0;
}


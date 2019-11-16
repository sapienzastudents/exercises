/*
- Si scriva un programma che dichiara una struttura
  di nome Libro con due campi: titolo e prezzo
- Si dichiari una funzione che prende in input due
  libri e ritorna 0 se hanno gli stessi valori nei due
  rispettivi campi, 1 altrimenti
- N.B. i valori dei campi delle strutture devono
  essere inseriti in input dall’utente
*/

#include <stdio.h>
#include <string.h>

typedef struct Libro {
    char titolo[20];
    float prezzo;
}libro;

int sameBook(libro a, libro b){
    if(strcmp(a.titolo,b.titolo)==0 && a.prezzo == b.prezzo){
        printf("I libri sono uguali!\n");
        return 1;
    }
    printf("I libri sono diversi...\n");
    return 0;
}

libro insBook(){
    libro l;

    printf("Inserisci il titolo del  libro: ");
    scanf("%s", &l.titolo);

    printf("Inserisci il prezzo del libro: ");
    scanf("%f", &l.prezzo);

    return l;
}

int main(){
    libro libro1 = insBook();
    libro libro2 = insBook();

    return sameBook(libro1,libro2);
}
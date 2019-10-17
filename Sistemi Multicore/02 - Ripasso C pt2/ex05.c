/*
- Si scriva un programma che dichiara una struttura
di nome Persona con i seguenti campi: nome,
cognome, eta, dataNascita
- N.B. dataNascita deve essere un’altra struttura
composta dai campi giorno, mese e anno.
- Si crei un Array di cinque posizioni di tipo Persona
- Permettere all’utente di inserire in input i dati di
tutte le persone
- Infine stampare tutti i dati inseriti
*/

#include <stdio.h>

typedef struct Persona {
    char nome[20];
    char cognome[20];
    int eta;
    struct DataNascita{
        int giorno;
        int mese;
        int anno;
    }data;
}persona;

int main(){
    
    persona people[5];
    printf("\n###INSERIMENTO DATI PERSONE###\n");
    for(int i=0;i<5;i++){
        printf("\nInserisci Nome e Cognome: ");
        scanf("%s %s",&people[i].nome,&people[i].cognome);

        printf("\nInserisci Età: ");
        scanf("%d",&people[i].eta);

        printf("\nInserisci giorno,mese,anno di nascita: ");
        scanf("%d %d %d",&people[i].data.giorno, &people[i].data.mese, &people[i].data.anno);
        printf("----------------------------");
    }

    printf("\n###STAMPA DATI PERSONE###\n");
    for(int i=0;i<5;i++){
        printf("\nNome e Cognome: %s %s",people[i].nome, people[i].cognome);
        printf("\nEtà: %d",people[i].eta);
        printf("\nd/m/y: %d %d %d",people[i].data.giorno, people[i].data.mese, people[i].data.anno);
        printf("----------------------------");
    }


    return 0;
}
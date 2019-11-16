/*
- Si scriva un programma che definisce due funzioni:
- char * leggiStringa() –legge una stringa in input memorizzandola
  dinamicamente e ritorna un puntatore a questa stringa
- void sostituisciNumeri(char *p) – prende come parametro un puntatore
  ad una stringa e sostituisce tutti i numeri con il carattere * (asterisco)
- Infine si dichiari la funzione main che per prima cosa chiama la funzione
  leggiStringa(), stampa la stringa inserita in input, chiama la funzione
  sostituisciNumeri ed infine stampa la stringa modificata

Per fare l’esercizio si utilizzi l’allocazione dinamica.
N.B. ricordarsi che le stringhe devono terminare sempre con il carattere
terminatore stringa, ovvero ‘\0’
*/

#include <stdio.h>
#include <stdlib.h>

char *leggiStringa(){
    printf("Inserire la stringa: ");
    char c,*str;
    scanf("%c",&c);

    str = (char*)malloc(sizeof(char));
    if(str==NULL){
        printf("Impossibile allocare memoria...");
        return NULL;
    }
    
    int i;
    for (i=0;c!='\n';i++){
        str[i]=c;
        if(!(str = realloc(str, (i+2)*sizeof(char)))){
            printf("Errore nell'allocazione di memoria\n");
            return str;
        };

        scanf("%c",&c);
    }
    str[i]='\0';

    return str;
};

void sostituisciNumeri(char *p){
    int i=0;
    while(p[i]!='\0'){
         if (p[i]<='9' && p[i]>='0'){
             p[i]='*';
         }
        i++;
    }
};

int main(){
    char *stringa;
    
    stringa = (char*)malloc(sizeof(char));
    if (stringa==NULL){
        printf("Impossibile allocare memoria\n");
        return 1;
    }


    stringa = leggiStringa();
    printf("Stringa originale -> %s\n",stringa);
    
    sostituisciNumeri(stringa);
    printf("Stringa modificata -> %s\n",stringa);
    
    return 0;
};
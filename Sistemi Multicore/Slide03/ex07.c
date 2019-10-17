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
    int pos;
    struct Elemento *next;
};

struct Elemento *crealista(){

};

struct Elemento *eliminaPrimo(struct Elemento *p){

};

void eliminaDecimo(struct Elemento *p){

};

void eliminaUltimo(struct Elemento *p){

};

void stampaLista(struct Elemento *p){

}


int main(){
    return 0;
}
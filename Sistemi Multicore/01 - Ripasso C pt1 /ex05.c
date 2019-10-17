/*
Si scriva un programma che legge in input una
stringa e la salva in un Array di char di 20
elementi.
- Il programma deve sostituire tutte le cifre che
  compaiono nella stringa con il carattere *
- Infine deve stampare la stringa modificata
- N.B. per controllare se il char c è un numero:
- (c >= '0' && c <= '9' )
*/

#include <stdio.h>

void checkStr(char* arr){
    int i=0;
    while(arr[i] != '\0'){
        char x = (arr[i]<='9' && arr[i]>='0')? '*' : arr[i];
        printf("%c",x);
        i++;
    }
    printf("\n");
}

int main(){
    char str[20];
    printf("Immetti una stringa (non piu' di 20 caratteri): ");
    scanf("%[^\n]",&str); //"%[^\n]" questa notazione significa: leggi fino a che non trovi un nl (cosi' facendo si potrà immettere una stringa con spazi) 
    checkStr(str);
    return 0;
}
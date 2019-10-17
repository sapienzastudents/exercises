/*
- Si scriva un programma che dichiara un Array di char di
  10 caratteri e permetta all’utente di inserire in input una
  stringa che verrà salvata nell’Array
- Il programma deve dichiarare un puntatore di tipo char
  che punta all’Array
- Successivamente, attraverso il puntatore, deve
  sostituire ogni elemento dell’Array che è una cifra con il
  carattere *
- Infine stampare l’Array di char
*/

#include <stdio.h>

int main(){
   char arr[10];
   scanf("%[^\n]",&arr);

   char *p;
   p = &arr[0];
   while(*p != '\0'){
       if(*p >= '0' && *p <= '9'){
           *p = '*';
       }
       p++;
   }

   int i = 0;
   while(arr[i] != '\0'){
       printf("%c", arr[i]);
       i++;
   }

   return 0;
}
/*
 * Fade effect self made
*/
int led = 11; //Il led che useremo è il numero 13 della scheda arduino
int up = 1; //se 1 indica di usare effetto fade da 0 a 255 altrimenti fa il contrario

void setup() {
  pinMode(led,OUTPUT);
}

void loop() {
  //Fade increase
  for(int i=0;i<255;i++){
    analogWrite(led,i);
    delay(10);
  }

  //Fade decrease
  for(int i=255;i>0;i--){
    analogWrite(led,i);
    delay(10);
  }
  delay(3000);
  
}

int RED = 8;
int YELLOW = 12;
int GREEN = 7;
int interrCount = 0;

void setup() {
  pinMode(RED,OUTPUT);
  pinMode(YELLOW,OUTPUT);
  pinMode(GREEN,OUTPUT);

  digitalWrite(RED, LOW);
  digitalWrite(GREEN, LOW);
  digitalWrite(YELLOW, LOW);

  attachInterrupt(0,yellowInterrupt,RISING);
}

void loop() {
  interrCount++;
  digitalWrite(RED,HIGH);
  digitalWrite(GREEN,LOW);
  delay(300);
  digitalWrite(RED,LOW);
  digitalWrite(GREEN,HIGH);
  delay(300);

  if(interrCount == 10){
    interrCount = 0;
    digitalWrite(YELLOW,LOW);
  }
  
}

void yellowInterrupt(){
  digitalWrite(YELLOW,HIGH);
}

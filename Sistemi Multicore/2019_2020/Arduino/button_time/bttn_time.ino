void setup() {
  pinMode(13,OUTPUT);
  pinMode(2,INPUT);
  pinMode(4,INPUT);
  pinMode(7,INPUT);

}

void loop() {
  if(digitalRead(7) == HIGH){
    digitalWrite(13,HIGH);
    delay(10000);
    digitalWrite(13,LOW);
  }

  else if(digitalRead(4) == HIGH){
    digitalWrite(13,HIGH);
    delay(5000);
    digitalWrite(13,LOW);
  }

  else if(digitalRead(2) == HIGH){
    digitalWrite(13,HIGH);
    delay(2000);
    digitalWrite(13,LOW);
  }
  else{
    digitalWrite(13,LOW);
  }

}

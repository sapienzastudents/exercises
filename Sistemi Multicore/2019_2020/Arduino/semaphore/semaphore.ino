void setup() {
  pinMode(2,OUTPUT); // LED verde
  pinMode(4,OUTPUT); // LED giallo
  pinMode(7,OUTPUT); // LED rosso

}

void loop() {
  digitalWrite(2,HIGH);
  delay(3000);
  digitalWrite(2,LOW);
  digitalWrite(4,HIGH);
  delay(3000);
  digitalWrite(4,LOW);
  digitalWrite(7,HIGH);
  delay(3000);
  digitalWrite(7,LOW);
  
}

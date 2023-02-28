void setup() {
  // initialize the serial communication:
  Serial.begin(115200);
  pinMode(10, INPUT); // Setup for leads off detection LO +
  pinMode(11, INPUT); // Setup for leads off detection LO -
  

}

void loop() {
  
  if((digitalRead(10) == 1)||(digitalRead(11) == 1)){
    Serial.print('0');
    Serial.print(',');
  }
  else{
    // send the value of analog input 0:
    Serial.print(String(analogRead(A0)));
    Serial.print(',');
  }
  float test = analogRead(A1);
  if(test > 0)
  Serial.println(String(test));
  else{
     Serial.println('0');
    }
  //Wait for a bit to keep serial data from saturating
  delay(10);
}
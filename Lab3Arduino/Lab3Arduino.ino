//18.55 //normal
//19.77 tip toe
// 18.00 heel
#include <MPU6050_tockn.h>
#include <Wire.h>
MPU6050 mpu6050(Wire);
unsigned long timer = 0;
void setup() {

  // initialize the serial communication:
  Serial.begin(115200);
  Wire.begin();
  mpu6050.begin();
  mpu6050.calcGyroOffsets();
  pinMode(3,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(9,OUTPUT);
 

}

void loop() {
 mpu6050.update();
 int MF = analogRead(A0);
 int LF = analogRead(A1);
 int MM=analogRead(A2);
 int HEEL=analogRead(A3);
 if((millis()-timer)>10){
    analogWrite(3,MF/4);
 analogWrite(5,LF/4);
 analogWrite(6,MM/4);
 analogWrite(9,HEEL/4);
  Serial.println(String(MF)+ "," + String(LF) +","+ String(MM) + "," + String(HEEL)+","+String(mpu6050.getAccX())+","+String(mpu6050.getAccY())+","+String(mpu6050.getAccZ()));
  timer = millis();
 }
}
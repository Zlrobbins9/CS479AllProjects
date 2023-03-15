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
 if(MF == NULL){
   MF = 0;
 }
 int LF = analogRead(A1);
  if(LF == NULL){
   LF = 0;
 }
 int MM=analogRead(A2);
  if(MM == NULL){
   MM = 0;
 }

 int HEEL=analogRead(A3);
  if(HEEL == NULL){
   HEEL = 0;
 }
 if((millis()-timer)>100){
    analogWrite(3,MF/4);
 analogWrite(5,LF/4);
 analogWrite(6,MM/4);
 analogWrite(9,HEEL/4);
 float x = mpu6050.getAccX();
   if(x == NULL){
   x = 0;
 }
 float y = mpu6050.getAccY();
    if(y == NULL){
   y = 0;
 }
 float z = mpu6050.getAccZ();
    if(z == NULL){
   z = 0;
 }
  Serial.println(String(MF)+ "," + String(LF) +","+ String(MM) + "," + String(HEEL)+","+String(x)+","+String(y)+","+String(z));
  timer = millis();
 }
}
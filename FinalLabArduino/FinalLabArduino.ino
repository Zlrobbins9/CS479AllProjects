#include <MPU6050_tockn.h>
#include <SparkFun_Bio_Sensor_Hub_Library.h>
#include <Wire.h>

MPU6050 mpu6050(Wire);
int resPin = 4;
int mfioPin = 5;
SparkFun_Bio_Sensor_Hub bioHub(resPin, mfioPin); 
bioData body;  
#define LED_PIN1  6
#define LED_PIN2  10
#define LED_PIN3  9
#define BUZZER 12

long timer = 0;
void setup() {
  pinMode(LED_PIN1, OUTPUT);
  pinMode(LED_PIN2,OUTPUT);
  pinMode(LED_PIN3,OUTPUT);
  pinMode(BUZZER,OUTPUT);
  Serial.begin(115200);
  Wire.begin();
  mpu6050.begin();
  mpu6050.calcGyroOffsets(true);
  int result = bioHub.begin();
   int error = bioHub.configBpm(MODE_ONE);
   if(error == 0){ // Zero errors!
    Serial.println("Sensor configured.");
  }
  else {
    Serial.println("Error configuring sensor.");
    Serial.print("Error: "); 
    Serial.println(error); 
  }
}
void loop() {
  mpu6050.update();
  body = bioHub.readBpm();
  if(Serial.available()>0){
    String incoming = Serial.readString();
    char test = incoming[0];
   // int numIncoming = 
    //Serial.print(test);
    if(test == '1'){
      digitalWrite(LED_PIN1,HIGH);
      delay(1000);
      digitalWrite(LED_PIN1,LOW);

    }
    else if(test == '2'){
      digitalWrite(LED_PIN2,HIGH);
      delay(1000);
      digitalWrite(LED_PIN2,LOW);
    }
    else if(test == '3'){
      digitalWrite(LED_PIN3,HIGH);
      delay(1000);
      digitalWrite(LED_PIN3,LOW);
    }
    else if(test == '4'){
      tone(BUZZER,2500,1000);
    }
    
  }
  if(millis() - timer > 1000){
    
   // Serial.println("=======================================================");
    //Serial.print("temp : ");Serial.println(mpu6050.getTemp());
    //Serial.print("accX : ");
    Serial.print(mpu6050.getAccX());Serial.print(", ");
    Serial.print(mpu6050.getAccY());Serial.print(", ");
    Serial.print(mpu6050.getAccZ());Serial.print(", ");
    
    Serial.print(mpu6050.getGyroX());Serial.print(", ");
    Serial.print(mpu6050.getGyroY());Serial.print(", ");
    Serial.print(mpu6050.getGyroZ());Serial.print(", ");
   
    Serial.print(mpu6050.getAccAngleX());Serial.print(", ");
    Serial.print(mpu6050.getAccAngleY());Serial.print(", ");

    Serial.print(mpu6050.getGyroAngleX());Serial.print(", ");
    Serial.print(mpu6050.getGyroAngleY());Serial.print(", ");
    Serial.print(mpu6050.getGyroAngleZ());Serial.print(", ");

    Serial.print(mpu6050.getAngleX());Serial.print(", ");
     Serial.print(mpu6050.getAngleY());Serial.print(", ");
      Serial.print(mpu6050.getAngleZ());Serial.print(", ");
   
    Serial.print(body.heartRate);Serial.print(", ");
    Serial.println(analogRead(A1)); // pressure sensor

    
   // Serial.println("=======================================================\n");
    timer = millis();
    
  }

}
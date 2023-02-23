#include <Wire.h>

#include <SparkFun_Bio_Sensor_Hub_Library.h>

// No other Address options.
#define DEF_ADDR 0x55





// Reset pin, MFIO pin
const int resPin = 4;
const int mfioPin = 5;
const int buzz = 12;
int val = 0;

// Takes address, reset pin, and MFIO pin.
SparkFun_Bio_Sensor_Hub bioHub(resPin, mfioPin); 

bioData body;  

void setup(){

  Serial.begin(115200);

  Wire.begin();
  int result = bioHub.begin();
  pinMode(buzz,OUTPUT);
  /*
  if (!result)
    Serial.println("Sensor started!");
  else
    Serial.println("Could not communicate with the sensor!!!");

  Serial.println("Configuring Sensor...."); 
  */
  int error = bioHub.configBpm(MODE_ONE); // Configuring just the BPM settings. 
  /*
  if(!error){
    Serial.println("Sensor configured.");
  }
  else {
    Serial.println("Error configuring sensor.");
    Serial.print("Error: "); 
    Serial.println(error); 
  }
  */
  // Data lags a bit behind the sensor, if you're finger is on the sensor when
  // it's being configured this delay will give some time for the data to catch
  // up. 
  delay(4000); 

}

void loop(){
    // Information from the readBpm function will be saved to our "body"
    // variable.  
    body = bioHub.readBpm();
    if(body.heartRate != 0 && body.oxygen != 0){
      Serial.print(body.heartRate);
      Serial.print(", "); 
      Serial.print(body.oxygen); 
      Serial.print(", ");
      Serial.println(body.confidence);
      delay(250); // Slowing it down, we don't need to break our necks here.
    }
    
    if(Serial.available()){
        val = Serial.read();
      }
      if(val == '1'){
        digitalWrite(buzz,HIGH);
        delay(100);
        digitalWrite(buzz,LOW);
        delay(100);
        digitalWrite(buzz,HIGH);
        delay(100);
        digitalWrite(buzz,LOW); 
        }
        else{
          digitalWrite(buzz,LOW); 
          }
    
}

*/
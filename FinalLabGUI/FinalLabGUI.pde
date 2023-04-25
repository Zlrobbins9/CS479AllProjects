import org.gicentre.utils.stat.*;
import processing.serial.*;

float inByte = 0;
Serial myPort; // The serial port
float[] accel, gyro, gyroAngle, accelAngle, angle;
String tab = "intro";
boolean sensorConfigured = false;
float HR = 0, buttonPressure = 0;


void setup() {
  fullScreen();
  gameSetup();
  accel = new float[3];
  gyro = new float[3];
  accelAngle = new float[2];
  angle = new float[3];
  gyroAngle = new float[3];
  /*
  // List all the available serial ports
  for(int i = 0; i < Serial.list().length; i++)
  {
    println(Serial.list()[i]);
  }
  */
  String portName = "COM5"; //changer
  delay(1000);
  myPort = new Serial(this, portName, 115200);  // Open whatever port is the one you're using.
  
  myPort.bufferUntil('\n');  // don't generate a serialEvent() unless you get a newline character:
}

void draw() {
  switch(tab)
  {
    case "intro":
    introDraw();
    break;
    case "game":
      gameDraw();
    break;
    case "lose":
      loseDraw();
  }
  
  
  
  }

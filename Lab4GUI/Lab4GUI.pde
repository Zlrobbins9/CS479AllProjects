import org.gicentre.utils.stat.*;
import processing.serial.*;

float inByte = 0;
Serial myPort; // The serial port

String tab = "intro";
boolean up = false, down = false, left = false, right = false;
boolean speak = false, fight = false, travel = false;
float x,y;

void setup() {
  fullScreen();
  x = width/2;
  y = height/2;
  /*
  // List all the available serial ports
  for(int i = 0; i < Serial.list().length; i++)
  {
    println(Serial.list()[i]);
  }
  */
  
  gameSetup();
  String portName = "COM5"; //changer
  delay(1000);
  /*
  myPort = new Serial(this, portName, 115200);  // Open whatever port is the one you're using.
  
  myPort.bufferUntil('\n');  // don't generate a serialEvent() unless you get a newline character:
  */
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
  }
  
  
  
  }

void serialEvent(Serial myPort) {
  String tempVal = myPort.readStringUntil('\n');
  if(tempVal == null){
    return;
  }
  println("tempval is:" + tempVal );
  tempVal = tempVal.trim();
  switch(tempVal)
  {
    case "3 touched":
     up = true;
     println("0 recognized");
    break;
    case "3 released":
      up = false;
    break;
    
    case "4 touched":
     left = true;
    break;
    case "4 released":
      left = false;
    break;
    
    case "5 touched":
      down = true;
    break;
    case "5 released":
      down = false;
    break;
    
    case "6 touched":
      right = true;
    break;
    case "6 released":
      right = false;
    break;
    
    
    case "1 touched":
     speak = true;
    break;
    case "1 released":
      speak = false;
    break;
    
    case "0 touched":
      fight = true;
    break;
    case "0 released":
      fight = false;
    break;
    
    case "2 touched":
      travel = true;
    break;
    case "2 released":
      travel = false;
    break;
    
    
    default:
    println("no input :(");
    break;
  }
  }

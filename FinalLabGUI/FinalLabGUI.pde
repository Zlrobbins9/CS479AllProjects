import org.gicentre.utils.stat.*;
import processing.serial.*;

float inByte = 0;
Serial myPort; // The serial port

String tab = "intro";
boolean up = false, down = false, left = false, right = false;
boolean speak = false, fight = false, move = false;
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
  
  intro = loadImage("Title.jpg");
  intro.resize(width, height);
  gameSetup();
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
  }
  
  
  
  }

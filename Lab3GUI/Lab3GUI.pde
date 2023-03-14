import org.gicentre.utils.stat.*;
import processing.serial.*;

float inByte = 0;
Serial myPort; // The serial port

String tab = "graph";
ArrayList<Float> restingRateList = new ArrayList<Float>(0);
float CurMF = 0, CurLF = 0, CurMM = 0, CurHeel = 0, CurMFP = 0;
FloatList MFPressureList = new FloatList(), LFPressureList = new FloatList(), MMPressureList = new FloatList(), HeelPressureList = new FloatList(), MFPList = new FloatList();
FloatList FeetSensor_XVals = new FloatList();
int FeetSensorCount = 0;

float curPressure;
float prevPressure;


void setup() {
  fullScreen();
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
  
  dance_setup();
  graph_setup();
  curPressure = 150;
}

void draw() {
  if (tab == "intro"){
    intro_draw();
  }else if (tab == "graph"){
    graph_draw();
  }else if(tab == "dance"){
    dance_draw();
  }
}

void serialEvent(Serial myPort) {
  String tempVal = myPort.readStringUntil('\n');
  println("tempval is: " + tempVal);
  String inputs[] = split(tempVal, ",");
  CurMF = float(inputs[0]); //curPressure = float(inputs[1]);
  CurLF = float(inputs[1]);
  CurMM = float(inputs[2]);
  CurHeel= float(inputs[3]);
  float x = float(inputs[4]);
  float y = float(inputs[5]);
  float z = float(inputs[6]);
  update_feetgraphs();
  //delay(500);
  }

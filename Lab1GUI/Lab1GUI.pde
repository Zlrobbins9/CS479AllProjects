import org.gicentre.utils.stat.*;
import processing.serial.*;


Serial myPort;

String tab = "intro";

float heartRate = -99;
float RHRAvg = -99;
float bloodOxygen;
float confidence;
float restingRate = 0.0;
ArrayList<Float> restingRateList = new ArrayList<Float>(0);


void setup() {
  fullScreen();
  /*
  for(int i = 0; i < Serial.list().length; i++)
  {
    println(Serial.list()[i]);
  }
  */
  String portName = "COM5"; //changer
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
  
  size(500, 200);
  
  high_low_setup();
  graph_setup();
}

void draw() {
  //println(tab);
  if (tab == "intro"){
    intro_draw();
  }else if (tab == "high_low"){
    //high_low_draw();
    pushStyle();
    background(200);
    textSize(30);
    fill(204, 102, 0);
    textAlign(CENTER, CENTER);
    text("Heart rate: " + heartRate, width/2,height/3);
    text("Time between beats: " + (heartRate/60.0), width/2,height/2);
    text("Confidence: " + confidence, width/2, 50);
    popStyle();
    
  }else if (tab == "graph"){
    graph_draw();
  }else if(tab == "rest"){
    rest_draw();
  }else if(tab == "relax"){
    relax_draw();
  }
}
void serialEvent(Serial myPort) {
  String tempVal = myPort.readStringUntil('\n');
  String inputs[] = split(tempVal, ", ");
  inputs[inputs.length-1] = inputs[inputs.length-1].trim();
  heartRate = float(inputs[0]);
  bloodOxygen = float(inputs[1]);
  confidence = float(inputs[2]);
  if (tempVal != null) {
    tempVal = trim(tempVal);
    float val = float(tempVal);
    high_low_serialEvent(val);
    graph_serialEvent(val);
   println(heartRate);
  }
}

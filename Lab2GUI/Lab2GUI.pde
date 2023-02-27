import org.gicentre.utils.stat.*;
import processing.serial.*;


Serial myPort; // The serial port

String tab = "intro";

boolean stressed = false;
float heartRate = 100;
float RHRAvg = -99;
float bloodOxygen;
float confidence;
float restingRate = 0.0;
ArrayList<Float> restingRateList = new ArrayList<Float>(0);
float curPressure;
float prevPressure;
boolean isFakeBreathing = false;
int exhaleMode = 5;
float pressureFloor = 1500; //tracks the lowest pressure recorded, set to 1500 because the device's maximum input is 1000.


void setup() {
  fullScreen();
  /*
  // List all the available serial ports
  for(int i = 0; i < Serial.list().length; i++)
  {
    println(Serial.list()[i]);
  }
  */
  /*
  String portName = "COM5"; //changer
  myPort = new Serial(this, portName, 115200);  // Open whatever port is the one you're using.
  myPort.bufferUntil('\n');  // don't generate a serialEvent() unless you get a newline character:
  */
  
  graph_setup();
  curPressure = 150;
}

void draw() {
  //println(tab);
  prevPressure = curPressure;
  //curPressure = floor(100*sin(tempCounter/60.0)+250);
  if(isFakeBreathing)
  {
    curPressure+=5;
  }else if(curPressure >= 150)
  {
    curPressure-=exhaleMode;
  }
  if(curPressure <= pressureFloor && curPressure > 10) //record a lowest value if its not a blatant misread
  {
    pressureFloor = curPressure;
  }
  //println("current pressure is: " + curPressure);
  
  heartRate = random(99, 102);
  if(millis() % 10 == 0)
  {
    graph_serialEvent(heartRate);
  }
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
  }else if(tab == "meditation"){
    meditation_draw();
  }else if(tab == "bird"){
    bird_draw();
  }else if(tab == "loser"){
     loser_draw(); 
  }
}

void serialEvent (Serial myPort) 
{
  
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) 
  {
    // trim off any whitespace:
    inString = trim(inString);

    // If leads off detection is true notify with blue line
    if (inString.equals("!")) 
    { 
      stroke(0, 0, 0xff); //Set stroke to blue ( R, G, B)
      inByte = 512;  // middle of the ADC range (Flat Line)
    }
    // If the data is good let it through
    else 
    {
      stroke(0xff, 0, 0); //Set stroke to red ( R, G, B)
      inByte = float(inString); 
      
      // BPM calculation check
      if (inByte > threshold && belowThreshold == true)
      {
        calculateBPM();
        belowThreshold = false;
      }
      else if(inByte < threshold)
      {
        belowThreshold = true;
      }
    }
  }
}
/*
//old serialevent code
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
    graph_serialEvent(heartRate);
   println(heartRate);
  }
}*/
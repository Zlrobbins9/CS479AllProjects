import org.gicentre.utils.stat.*;
import processing.serial.*;

int xPos = 1;         // horizontal position of the graph

float inByte = 0;
float curPressure;
int BPM = 0;
int beatIndex;
boolean belowThreshold = true;



Serial myPort; // The serial port

String tab = "intro";
boolean stressed = false;
ArrayList<Float> restingRateList = new ArrayList<Float>(0);
ArrayList<Float> MFPressureList = new ArrayList<Float>(0);
ArrayList<Float> LFPressureList = new ArrayList<Float>(0);
ArrayList<Float> MMPressureList = new ArrayList<Float>(0);
ArrayList<Float> HeelPressureList = new ArrayList<Float>(0);

float prevPressure;
boolean isFakeBreathing = false;
int exhaleMode = 5;
int counter = 0;
float pressureFloor = 0; //tracks the lowest pressure recorded, set to 1500 because the device's maximum input is 1000.


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
  //myPort = new Serial(this, portName, 115200);  // Open whatever port is the one you're using.
  //myPort.bufferUntil('\n');  // don't generate a serialEvent() unless you get a newline character:
  
  
  graph_setup();
  curPressure = 150;
}

void draw() {
  //println(tab);
  //prevPressure = curPressure;
  //curPressure = floor(100*sin(tempCounter/60.0)+250);
  /*
  //debugging use
  if(isFakeBreathing)
  {
    curPressure+=5;
  }else if(curPressure >= 5)
  {
    curPressure-=exhaleMode;
  }
  if(curPressure <= pressureFloor && curPressure > 10) //record a lowest value if its not a blatant misread
  {
    pressureFloor = curPressure;
  }
  */
  //println("current pressure is: " + curPressure);
  
  /*
  // heartRate = random(150, 155); //fka eheart rate for debugging
  if(millis() % 10 == 0)
  {
    graph_serialEvent(heartRate);
  }
  */
  
  if (tab == "intro"){
    intro_draw();
  }else if (tab == "graph"){
    graph_draw();
  }else if(tab == "bird"){
    bird_draw();
  }else if(tab == "loser"){
     loser_draw(); 
  }
}

void serialEvent (Serial myPort) 
{
  // get the ASCII string:
  String input = myPort.readStringUntil('\n');
  //println(input);
  String inputs[] = split(input, ",");
  String inString = inputs[0];
  prevPressure =curPressure;
  curPressure = float(inputs[1]);
  //println(curPressure);
  
  //if(pressure >currBreath && inhale != true){
  //  timer(); 
  //  inhale = true;
  //}

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
    }
  }
}

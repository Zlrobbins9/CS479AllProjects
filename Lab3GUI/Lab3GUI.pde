import org.gicentre.utils.stat.*;
import processing.serial.*;

float inByte = 0;
Serial myPort; // The serial port

String tab = "intro";
ArrayList<Float> restingRateList = new ArrayList<Float>(0);
float CurMF = 25, CurLF = 50, CurMM = 75, CurHeel = 100, CurMFP = 0;
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
  //myPort = new Serial(this, portName, 115200);  // Open whatever port is the one you're using.
  //myPort.bufferUntil('\n');  // don't generate a serialEvent() unless you get a newline character:
  
  
  graph_setup();
  curPressure = 150;
}

void draw() {
  
  update_feetgraphs(); //TODO: move this to SerialEvent once the cur pressure values are being updated
  
  if (tab == "intro"){
    intro_draw();
  }else if (tab == "graph"){
    graph_draw();
  }else if(tab == "bird"){
    //bird_draw();
  }else if(tab == "loser"){
     //loser_draw(); 
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

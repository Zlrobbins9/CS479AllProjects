void keyPressed() {
  switch (key) {
    case 't':
      if(tab != "game")
      {
      tab = "game";
      }else
      {

      }
      break;
  }
  
}

void serialEvent(Serial myPort) {
  String tempVal = myPort.readStringUntil('\n');
  
  if(tempVal == null){
    return;
  }
  tempVal = tempVal.trim();
  println("tempval is:" + tempVal + "<----" );
  
    if(sensorConfigured){
      String inputs[] = split(tempVal, ",");
      
      for(int i=0; i < inputs.length; i++){
        inputs[i] = inputs[i].trim();
          println("the value at index " + i + " is-->" + inputs[i]);
      }
      accel[0] = float(inputs[0]); //curPressure = float(inputs[1]);
      accel[1] = float(inputs[1]);
      accel[2] = float(inputs[2]);
      gyro[0] = float(inputs[3]);
      gyro[1] = float(inputs[4]);
      gyro[2] = float(inputs[5]);
      accelAngle[0] = float(inputs[6]);
      accelAngle[1] = float(inputs[7]);
      gyroAngle[0] = float(inputs[8]); //curPressure = float(inputs[1]);
      gyroAngle[1] = float(inputs[9]);
      gyroAngle[2] = float(inputs[10]);
      angle[0] = float(inputs[11]);
      angle[1] = float(inputs[12]);
      angle[2] = float(inputs[13]);
      HR = float(inputs[14]);
      buttonPressure = float(inputs[15]);
    }
    
    if(tempVal.equals("========================================Sensor configured.")){
      sensorConfigured = true;
      println("configuration complete! taking in values...");
    }
  }

void mousePressed()
{
  
}

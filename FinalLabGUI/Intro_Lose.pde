PImage intro;
void introDraw()
{
  background(0);
  fill(255);
  textSize(40);
  textAlign(CENTER);
    
   if(sensorConfigured){
     //text("Press T to begin... for now", width/2, height/2);
     
     
     
     textAlign(CORNER);
       text("Accel X is "+ accel[0], 0, height/16);
       text("Accel Y is "+ accel[1], 0, height/8);
       text("Accel Z is "+ accel[2], 0, 3*height/16);
       
       text("Gyro X is "+ gyro[0], 0, 4*height/16);
       text("Gyro Y is "+ gyro[1], 0, 5*height/16);
       text("Gyro Z is "+ gyro[2], 0, 6*height/16);
       
       text("GyroAngle X is "+ gyroAngle[0], 0, 7*height/16);
       text("GyroAngle Y is "+ gyroAngle[1], 0, 8*height/16);
       text("GyroAngle Z is "+ gyroAngle[2], 0, 9*height/16);
       
       textAlign(CENTER);
       text("Angle X is "+ angle[0], width/2, 1*height/16);
       text("Angle Y is "+ angle[1], width/2, 2*height/16);
       text("Angle Z is "+ angle[2], width/2, 3*height/16);
       
       text("accelAngle X is "+ accelAngle[0], width/2, 4*height/16);
       text("accelAngle Y is "+ accelAngle[1], width/2, 5*height/16);
       text("pressure is "+ buttonPressure, width/2, 6*height/16);
       
       ellipse(width/2, 3*height/4, 200,200);
   }else{
    text("loading. please keep your arm still...", width/2, height/2); 
   }
    
}


void loseDraw(){
  background(200,50,50);
  fill(0);
  text("press P to return to the game", width/2, height/2);
  text("Final score: " + timer, width/2, 6*height/10);
  
}

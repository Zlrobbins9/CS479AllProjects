void relax_draw(){
  background(0, 100, 255);
  fill(255);
  textSize(45);
  textAlign(CENTER, CENTER);
  
  text("Keep tracking your heartrate and we will tell you if you are stressed!",width/2, height/2);
  //checking to see if you are stressed
  if(heartRate > RHRAvg+5){
    
   background(125,10,10);
    fill(255);
    text("You are stressed!",width/2, height/2);
    if(stressed == false){
      myPort.write('1');
      stressed = true;
    }
    
  }//checking to see if you are relaxed
  else if(heartRate < RHRAvg-5){
   background(125,10,125);
    fill(255);
    text("You are relaxed!",width/2, height/2);
    stressed = false;
    
  }//checking to see if you heartrate is average
  else{
    background(10,10,255);
    fill(0);
    text("You are just normal!",width/2, height/2);
    stressed = false;
  }
}

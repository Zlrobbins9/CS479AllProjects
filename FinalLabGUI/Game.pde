float playX,  playY;
float timer = 0;
float fallTimer = 0;
float stressTimer = 0;
String wind = "none";
lightBarrier barrier1;
PImage windL, windR;
windParticle[] leftWinds;
windParticle[] rightWinds;
ropeSegment[] fullRope = new ropeSegment[16];

void gameSetup(){
  barrier1 = new lightBarrier();
  playX = width/2;
  playY = height/2;
  windL = loadImage("windL.png");
  windL.resize(width/10, height/10);
  windR = loadImage("windR.png");
  windR.resize(width/10, height/10);
  
  for(int i=0; i < 16; i++){
    fullRope[i] = new ropeSegment(i*height/15);
  }
  
  leftWinds = new windParticle[]{new windParticle("left"),new windParticle("left"),new windParticle("left"),new windParticle("left"),new windParticle("left"),new windParticle("left"),new windParticle("left"),new windParticle("left"),new windParticle("left"),new windParticle("left")};
  rightWinds = new windParticle[]{new windParticle("right"),new windParticle("right"),new windParticle("right"),new windParticle("right"),new windParticle("right"), new windParticle("right"),new windParticle("right"),new windParticle("right"),new windParticle("right"),new windParticle("right")};
}

void gameDraw(){
  //println(buttonPressure);
  
  
   if(timer % 1200.0 == 120.0) 
  {
    barrier1.active = true;
    barrier1.pattern = 1;
    myPort.write('1');
  }
  background(163, 56, 7);
  
  strokeWeight(0);
  rectMode(CORNER);
  fill(242, 155, 34);
  rect(width/3,0,width/3, height);
  fill(255,0,0);
  rect(2*width/5,0,width/5, height);
  fill(120, 58, 7);
  rect(4*width/5, 0, width/5, height);
  rect(0, 0, width/5, height);
  
  strokeWeight(3);
  //stroke(255);
  //line(width/2, 0, width/2, height);
   for(int i=0; i < 16; i++){
     fullRope[i].ropeDraw();
   }
   
   fill(138, 228, 230);
   stroke(0);
   strokeWeight(10);
  ellipse(playX, playY, 100, 100);
  
  barrier1.barrierDraw();
  if(playY > height){
    tab = "lose";
  }
    
    if(timer % 600.0 == 300.0){
      int nextWind = int(random(3));
      if(nextWind == 0){
        wind = "none";
      }else if(nextWind == 1){
        wind = "left";
      }else{
        wind = "right";
      }
    }
    
  if(wind.equals("none")){
      if(angle[1] <= -125){
        fallTimer = 0;
      }else{
        fallTimer++;
      } 
  }else if(wind.equals("left")){
    
    for(int i = 0; i < 10; i++){
      leftWinds[i].windDraw();
    }
    if(angle[1] > -125 && angle[1] < -25){
        fallTimer = 0;
      }else{
        fallTimer++;
      } 
  }else if(wind.equals("right")){
    for(int i = 0; i < 10; i++){
      rightWinds[i].windDraw();
    }
    if(angle[1] >= -25){
        fallTimer = 0;
      }else{
        fallTimer++;
      } 
  }
  
  if(fallTimer >= 480){
          tab = "lose";
        }
        
        if(HR > 120){
          stressTimer++;
        }else{
          stressTimer = 0;
        }
        if(stressTimer > 300){
          tab = "lose";
        }
  
  timer++;
}



class ropeSegment{
 float xpos, ypos;
 
 ropeSegment(int startY){
  ypos = startY;
  xpos = width/2;
 }
  
  void ropeDraw(){
    ypos++;
    if(ypos > height + height/30){
      ypos = -height/30;
    }
    rectMode(CENTER);
    fill(171, 97, 36);
    rect(xpos, ypos,20,height/15);
  }
}



class windParticle{
  String Direction;
  float xpos, ypos;
  
 windParticle(String direction){
   Direction = direction;
  ypos = random(0,height);
  xpos = random(0,width);
  //println("xpos is now " + xpos);
 }
 
 void windDraw(){
   if(Direction == "left"){
     image(windL, xpos, ypos);
     xpos--;
   
     if(xpos <= 0){
       xpos = width;
       ypos = random(height);
     }
   }else{
     image(windR, xpos, ypos);
     xpos++;
     if(xpos >= width){
       xpos = 0;
       ypos = random(height);
     }
   }
 }
}



class lightBarrier{
  float ypos = 0;
  boolean active = false;
  int pattern;
  int currentColor = 0;
  int currentIndex = 0;
  int colorTime = 0;
  int[] colorString = new int[]{0,0,0};
  
  void barrierDraw(){
    
    if(active){
      rectMode(CENTER);
      fill(0);
      rect(width/2, ypos, width/2, height/10);
      for(int i = 0; i < 3; i++){
        if(colorString[i] == 1){
          fill(255,0,0);
        }else if(colorString[i] == 2){
          fill(0,255,0);
        }else if(colorString[i] == 3){
          fill(0,0,255);
        }else{
          fill(255);
        }
        ellipse((i+1)*width/4, ypos, height/11, height/11);
      }
      
      
     // println("the time on index " + currentIndex + " is  " + colorTime + " frames");
      if(buttonPressure > 0 && buttonPressure < 400){ //red
           if(currentColor != 1){
             colorTime = 0;
             currentColor = 1;
           }else{
             colorTime++;
           }
           fill(255,0,0,125);
       }else if(buttonPressure > 400 && buttonPressure < 800){ //green
         if(currentColor != 2){
             colorTime = 0;
             currentColor = 2;
           }else{
             colorTime++;
           }
           
           fill(0,255,0,125);
       }else if(buttonPressure > 800){ //blue
         if(currentColor != 3){
             colorTime = 0;
             currentColor = 3;
           }else{
             colorTime++;
           }
           fill(0,0,255,125);
       }else{ //reset
         colorTime = 0;
         currentColor = 0;
         fill(255,255,255,0);
       }
       
       ellipse((currentIndex+1)*width/4, ypos, height/11, height/11);
       
       if(colorTime >= 90){ // they have held the button for the same pressure for one second
          colorString[currentIndex] = currentColor;
          colorTime = 0;
          currentIndex++;
          currentColor = 0;
          
          if(currentIndex == 3){ //all spots have been filled
            if((pattern == 1 && colorString[0] == 1 && colorString[1] == 2 && colorString[2] == 3) || (pattern == 2 && colorString[0] == 3 && colorString[1] == 1 && colorString[2] == 3)){
              deactivate();
            }else{ //incorrect combination
              colorString[0] = 0;
              colorString[1] = 0;
              colorString[2] = 0;
              currentIndex = 0;
            }
            
          }
       }
      
      if(ypos+height/20 > playY- 50){
         playY = ypos +height/20 + 50;
      }
      
      ypos+= 0.5;
    }
  
    }
    
    void deactivate(){
      active = false;
      colorString[0] = 0;
      colorString[1] = 0;
      colorString[2] = 0;
      ypos = 0;
      currentColor = 0;
      currentIndex = 0;
      colorTime = 0;
    }
}

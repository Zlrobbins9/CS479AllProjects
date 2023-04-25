float playX,  playY;
float timer = 0;
lightBarrier barrier1;

void gameSetup(){
  barrier1 = new lightBarrier();
  playX = width/2;
  playY = height/2;
}

void gameDraw(){
  //println(buttonPressure);
   if(timer % 1200.0 == 0.0) 
  {
    barrier1.active = true;
    //barrier1.pattern = int(random(1,2));
    barrier1.pattern = 1;
    //println("the char is: " + '1');
    myPort.write('1');
  }
  background(163, 56, 7);
  strokeWeight(20);
  stroke(255);
  line(width/2, 0, width/2, height);
   
   fill(138, 228, 230);
   stroke(0);
   strokeWeight(10);
  ellipse(playX, playY, 100, 100);
  
  barrier1.barrierDraw();
  if(playY > height){
    tab = "lose";
  }
  timer++;
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
      
      
      println("the time on index " + currentIndex + " is  " + colorTime + " frames");
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

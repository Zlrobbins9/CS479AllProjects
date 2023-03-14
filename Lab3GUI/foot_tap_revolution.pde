PImage rightArrow, leftArrow, upArrow, downArrow, rightArrow2, leftArrow2, upArrow2, downArrow2;


void dance_setup()
{
  rightArrow = loadImage("rightarrow.png");
  leftArrow = loadImage("leftarrow.png");
  upArrow = loadImage("uparrow.png");
  downArrow = loadImage("downarrow.png");
  rightArrow2 = loadImage("rightarrow2.png");
  leftArrow2 = loadImage("leftarrow2.png");
  upArrow2 = loadImage("uparrow2.png");
  downArrow2 = loadImage("downarrow2.png");
  
  rightArrow.resize(200,200);
  leftArrow.resize(200,200);
  upArrow.resize(200,200);
  downArrow.resize(200,200);
  rightArrow2.resize(200,200);
  leftArrow2.resize(200,200);
  upArrow2.resize(200,200);
  downArrow2.resize(200,200);
  
}


void dance_draw()
{
  background(125,0,125);
  imageMode(CENTER);
  image(rightArrow, width/8, height/10);
  image(leftArrow, 3*width/8, height/10);
  image(upArrow, 5*width/8, height/10);
  image(downArrow, 7*width/8, height/10);
}

/*
class ArrowEnemy
{
  float xpos, ypos;
  //String type;
  ArrowEnemy()
  {
    xpos = height;
    ypos = height;
  }
  
  void badDraw()
  {
    
    
  }
}
*/

PImage rightArrow, leftArrow, upArrow, downArrow, rightArrow2, leftArrow2, upArrow2, downArrow2;

ArrowEnemy enemy1;
  ArrowEnemy enemy2;
  ArrowEnemy enemy3;
  ArrowEnemy enemy4;
  int counter = 0;

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
  
  enemy1 = new ArrowEnemy("up");
  enemy2 = new ArrowEnemy("down");
  enemy3 = new ArrowEnemy("left");
  enemy4 = new ArrowEnemy("right");
}


void dance_draw()
{
  background(125,0,125);
  imageMode(CENTER);
  image(rightArrow, width/8, height/10);
  image(leftArrow, 3*width/8, height/10);
  image(upArrow, 5*width/8, height/10);
  image(downArrow, 7*width/8, height/10);
  
  counter++;
  enemy1.badDraw();
  
  if(counter > 120)
  enemy2.badDraw();
  if(counter > 180)
  enemy3.badDraw();
  if(counter > 240)
  enemy4.badDraw();
}


class ArrowEnemy
{
  float xpos, ypos;
  String type;
  PImage asset;
  ArrowEnemy(String _type)
  {
    type = _type;
    if(type.equals("down"))
    {
      asset = downArrow2;
      type = "down";
      xpos = 7*width/8;
    }else if(type.equals("up")){
      asset = upArrow2;
      type = "up";
      xpos = 5*width/8;
    }else if(type.equals("left")){
      asset = leftArrow2;
      type = "left";
      xpos = 3*width/8;
    }else{
      asset = rightArrow2;
      type = "right";
      xpos = width/8;
    }
    ypos = height;
  }
  
  void badDraw()
  {
    image(asset, xpos, ypos);
    ypos -=2;
    if(ypos <= height/10)
    {
       ypos = height; 
    }
  }
}

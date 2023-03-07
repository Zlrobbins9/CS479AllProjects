int playerY = height/2;
float timer = 0;
boolean game_lost = false;
float StartTime;
String breathPattern = "none";
ArrayList<Enemy> enemyStack = new ArrayList<Enemy>(0);

void bird_setup()
{
  enemyStack.clear();
  playerY = height/2;
  timer = 0;
  enemyStack.add(new Enemy(random(0, height)));
}
// 
void bird_draw()
{
  timer++;
  background(128, 174, 209);
  BreatheCheck();
  if(breathPattern.equals("in") && playerY >= 25)
  {
    fill(0);
   //text("going up",width/2, 3*height/5);
      playerY-=5;
  }else if( !breathPattern.equals("in")  && playerY <= height-25)
  {
    fill(0);
   //text("going down",width/2, 3*height/5);
      playerY+=5;
  }
  
  fill(255);
  ellipse(width/50, playerY, 50,50);
  
  
  for(int i = 0; i < enemyStack.size(); i++)
  {
    enemyStack.get(i).enemyDraw();
  }
  fill(0);
   //text("yposition: " + playerY + " with height of " + height,width/2, height/2);
  if(timer % 300.0 == 0.0 && enemyStack.size() < 15) 
  {
    enemyStack.add(new Enemy(random(0, height)));
  }
}

void loser_draw()
{
  background(237, 214, 71);
  textSize(width/10);
  text("You won!", width/2, height/4);
  textSize(width/20);
  text("(I mean you cant lose, soooo...)", width/2, 9*height/20);
  text("Final Time: " + (floor(timer/60.0)) + " seconds", width/2, 11*height/20);
  textSize(width/40);
  text("press B to play again", width/2, 13*height/20);
  text("press W to go to the workout GUI", width/2, 15*height/20);
  text("press M to go to the meditation GUI", width/2, 16*height/20);
  text("press R to go to the relaxation GUI", width/2, 17*height/20);
}

void BreatheCheck()
{
  if(curPressure > prevPressure+2 && curPressure >= pressureFloor-20 && breathPattern == "none"){ //if breath is just starting
    breathPattern = "in";
  }
  if(curPressure+3 < prevPressure && breathPattern == "in"){ //breath out begins
    breathPattern = "out";
  }
  if(curPressure > prevPressure+2 && breathPattern == "out"){ //breathing out has ended
    breathPattern = "in";
  }
}

class Enemy
{
  float ypos;
  float xpos = width;
  
  Enemy(float _ypos)
  {
    ypos = _ypos;
  }
  
  void enemyDraw()
  {
    xpos -= width/150;
    fill(255,100,100);
    ellipse(xpos, ypos, 50,50);
    if(xpos <= 0)
    {
      xpos = width;
      ypos = random(0,height);
    }
    if(dist(width/50, playerY, xpos, ypos) <= 50)
    {
      tab = "loser";
    }
  }
}

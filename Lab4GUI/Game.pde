boolean OnCooldown = false;
//TODO: create a cooldown system for inputs

PImage fightButton, moveButton, speakButton, uwuSlime;

ArrayList<String> gameList = new ArrayList<String>();

void gameSetup()
{
  fightButton = loadImage("fightButtonV2.png");
  moveButton = loadImage("moveButtonV2.png");
  speakButton = loadImage("speakButtonV2.png");
  uwuSlime = loadImage("uwuSlime2.png");
  
  fightButton.resize(width/4, height/4);
  moveButton.resize(width/4, height/4);
  speakButton.resize(width/4, height/4);
  uwuSlime.resize(width/6, width/6);
  
  
}
void gameDraw()
{
  background(108, 145, 105);
  DisplayGUI();
  image(uwuSlime, width/8, height/8);
  rectMode(CORNER);
  rect(width/4, height/20, 11*width/16, height/5);
  triangle(width/4, height/4, width/4, height/4-height/20, width/6, 9*height/40);
  imageMode(CENTER);
  if(speak)
  {
    DisplayOptions("speak");
    image(speakButton, width/2, 21*height/32);
  }else if(fight)
  {
    DisplayOptions("fight");
    image(fightButton, width/2, 21*height/32);
  }else if(travel)
  {
    DisplayOptions("move");
    image(moveButton, width/2, 21*height/32);
  }else{
   return; 
  }
  
}

void DisplayOptions(String action)
{
  rectMode(CENTER);
  rect(width/2, 6*height/16, width/2, height/6);
  rect(width/2, 15*height/16, width/2, height/6);
  rect(26*width/30, 21*height/32, width/3, height/5);
  rect(4*width/30, 21*height/32, width/3, height/5);
  
  textAlign(CORNER);
  fill(250, 185, 249);
  text("You encounter a monkey. It looks at you with curiosity." ,width/4, height/11);
  textAlign(CENTER);
  /*
  fill(189, 252, 241);
  text("Give B A N A N A." ,width/2, 6*height/16);
  text("Imitate the monkey" ,width/2, 15*height/16);
  text("Ask for directions" ,26*width/30, 21*height/32);
  text("Indoctrinate into Christianity" ,4*width/30, 21*height/32);
  */
  fill(252, 149, 141);
  text("Throw a rock" ,width/2, 6*height/16);
  text("Put in a chokehold" ,width/2, 15*height/16);
  text("Punch" ,26*width/30, 21*height/32);
  text("Kick" ,4*width/30, 21*height/32);
}

void DisplayGUI()
{
  fill(255);
  //println(gameList);
  textAlign(LEFT);
  fill(25);
  ellipse(width/2, 21*height/32, width/3, height/3);
  
}

class Scene
{
  ArrayList<Boolean> unlockCons = new ArrayList<Boolean>();
  
  Scene()
  {
    
    
  }
  Scene(String sceneSetter)
  {
    
    
  }
  
}

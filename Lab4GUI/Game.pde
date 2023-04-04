boolean OnCooldown = false;
int cooldownTimer = 0;
//TODO: create a cooldown system for inputs

PImage fightButton, moveButton, speakButton, uwuSlime;

boolean monkeyPacified = false, chestOpened = false;
int chestHealth = 3;

ArrayList<Scene> sceneList = new ArrayList<Scene>();
int curScene = 0;


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
  
  sceneList.add(new Scene(new String[]{"move north", "", "", ""}, new String[]{"Throw a rock","Put in a chokehold","Punch","Kick"},new String[]{"Give B A N A N A.","Imitate the monkey","Ask for directions","Indoctrinate into Christianity"}, "You encounter a monkey. It looks at you with curiosity."));
  sceneList.get(0).AddResults(new String[]{"You would leave, but you are scared of monkeys.","","",""}, new String[]{"You missed.","you tried to grab it, but it was too fast","you whiffed and punched air","you missed and kicked the tree, ouch."},new String[]{"you lack B A N A N A to give","you made monkey noises at it. It didnt understand your american accent.","It did not understand you"," You read the monkey Genesis 1:20. Inspired to fulfil god's plan, the monkey left"}, "with the monkey gone, you can now pass.");
  
  sceneList.add(new Scene(new String[]{"", "", "", ""}, new String[]{"low sweep it","punch it","cast fireball","bite it"},new String[]{"take the chest","","",""}, "Congratulations for repelling the monkey! I put a chest in this room to reward you."));
  sceneList.get(1).AddResults(new String[]{"","","",""}, new String[]{"You knocked the horrifying creature off its feet! it took damage.","you punch the beast, and its exterior cracks a bit","you cast fireball! You and the chest took 1 damage","did...did you just bite it? Why?"},new String[]{"as you go to take the chest, it sprouts arms and legs, and attacks!","","",""}, "with the chest defeated, the game is done. Thanks for playing!");
}
void gameDraw()
{

  if(OnCooldown)
  {
    cooldownTimer++;
    
    if(cooldownTimer >=300)
    {
    OnCooldown = false;
    up=false; down = false; left = false;right = false; move = false; fight = false; speak = false;
    cooldownTimer = 0;
    }
  }
  
  if(curScene == 0){
  background(108, 145, 105);
  }else
 {
   background(153, 100, 35);
 }
  DisplayGUI();
  image(uwuSlime, width/8, height/8);
  rectMode(CORNER);
  rect(width/4, height/20, 11*width/16, height/5);
  triangle(width/4, height/4, width/4, height/4-height/20, width/6, 9*height/40);
  textAlign(CORNER);
  fill(250, 185, 249);
  if(!OnCooldown)
  {
    fill(250, 185, 249);
      if(monkeyPacified == false || (curScene == 1 && chestOpened == false))
      {
        text(sceneList.get(curScene).StrtText ,width/4, height/11, 11*width/16, height/5);
      }else if(curScene == 0 && monkeyPacified == true)
      {
        text("the monkey has left, so theres nothing left to do but leave" ,width/4, height/11, 11*width/16, height/5);
      }else if(curScene == 1 && chestOpened == true && chestHealth > 0)
      {
        text("the sentient chest monster roared with fury" ,width/4, height/11, 11*width/16, height/5);
      }else if(curScene == 1 && chestHealth <= 0)
      {
        text("the chest is dead. you have won the game." ,width/4, height/11, 11*width/16, height/5);
      }
  }else 
  {
    fill(250, 185, 249);
    text("press T to return to options", width/20,height/20);
    
    if(up){
      if(speak)
      {
        text(sceneList.get(curScene).ResultsS[0] ,width/4, height/11, 11*width/16, height/5);
        if(curScene== 1 && chestOpened == false)
        {
          
          chestOpened = true;
        }
      }else if(fight)
      {
        text(sceneList.get(curScene).ResultsF[0] ,width/4, height/11, 11*width/16, height/5);
        if(curScene == 1 && chestOpened == true)
        {
          chestHealth -=1;
        }
      }else if(move){
        if(sceneList.get(curScene).ResultsM[0].equals(""))
        {
          text("you cannot go this way" ,width/4, height/11, 11*width/16, height/5);
        }else
        {
          if(monkeyPacified)
          {
            text(sceneList.get(curScene).EndText ,width/4, height/11, 11*width/16, height/5);
            curScene++;
            up = false;
            down = false;
            left = false;
            right = false;
            OnCooldown = false;
            cooldownTimer = 0;
          }else
          {
            text(sceneList.get(curScene).ResultsM[0] ,width/4, height/11, 11*width/16, height/5);
          }
          
        }
      }
    }else if(left){
      if(speak)
      {
        text(sceneList.get(curScene).ResultsS[1] ,width/4, height/11, 11*width/16, height/5);
      }else if(fight)
      {
        text(sceneList.get(curScene).ResultsF[1] ,width/4, height/11, 11*width/16, height/5);
        if(curScene == 1 && chestOpened == true)
        {
          chestHealth -=1;
        }
      }else if(move){
        if(sceneList.get(curScene).ResultsM[1].equals(""))
        {
          text("you cannot go this way" ,width/4, height/11, 11*width/16, height/5);
        }else
        {
          text(sceneList.get(curScene).ResultsM[1] ,width/4, height/11, 11*width/16, height/5);
        }
      }
    }else if(down){
      if(speak)
      {
        text(sceneList.get(curScene).ResultsS[2] ,width/4, height/11, 11*width/16, height/5);
      }else if(fight)
      {
        text(sceneList.get(curScene).ResultsF[2] ,width/4, height/11, 11*width/16, height/5);
        if(curScene == 1 && chestOpened == true)
        {
          chestHealth -=1;
        }
      }else if(move){
        if(sceneList.get(curScene).ResultsM[2].equals(""))
        {
          text("you cannot go this way" ,width/4, height/11, 11*width/16, height/5);
        }else
        {
          text(sceneList.get(curScene).ResultsM[2] ,width/4, height/11, 11*width/16, height/5);
        }
      }
    }else if(right){
      if(speak)
      {
        text(sceneList.get(curScene).ResultsS[3] ,width/4, height/11, 11*width/16, height/5);
        if(curScene == 0)
        {
          monkeyPacified = true;
        }
      }else if(fight)
      {
        text(sceneList.get(curScene).ResultsF[3] ,width/4, height/11, 11*width/16, height/5);
      }else if(move){
        if(sceneList.get(curScene).ResultsM[3].equals(""))
        {
          text("you cannot go this way" ,width/4, height/11, 11*width/16, height/5);
        }else
        {
          text(sceneList.get(curScene).ResultsM[3] ,width/4, height/11, 11*width/16, height/5);
        }
      }
    }
  }
    
  imageMode(CENTER);
  if(speak)
  {
    DisplayOptions("speak");
    image(speakButton, width/2, 21*height/32);
  }else if(fight)
  {
    DisplayOptions("fight");
    image(fightButton, width/2, 21*height/32);
  }else if(move)
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
  fill(25);
  rect(width/2, 6*height/16, width/2, height/6);
  rect(width/2, 15*height/16, width/2, height/6);
  rect(26*width/30, 21*height/32, width/3, height/5);
  rect(4*width/30, 21*height/32, width/3, height/5);
  textAlign(CENTER);
  if(action.equals("speak"))
  {
  fill(189, 252, 241);
  text(sceneList.get(curScene).OptionsS[0] ,width/2, 6*height/16); //top
  text(sceneList.get(curScene).OptionsS[1] ,4*width/30, 21*height/32); //left
  text(sceneList.get(curScene).OptionsS[2] ,width/2, 15*height/16); //bottom
  text(sceneList.get(curScene).OptionsS[3] ,26*width/30, 21*height/32); //right
  
    if((up || left || down || right)&& !OnCooldown ){
      OnCooldown= true;
    }
  }else if(action.equals("fight"))
  {
    textAlign(CENTER);
    fill(252, 149, 141);
    text(sceneList.get(curScene).OptionsF[0] ,width/2, 6*height/16); //top
    text(sceneList.get(curScene).OptionsF[1] ,4*width/30, 21*height/32); //left
    text(sceneList.get(curScene).OptionsF[2] ,width/2, 15*height/16); //bottom
    text(sceneList.get(curScene).OptionsF[3] ,26*width/30, 21*height/32); //right
    
    if((up || left || down || right)&& !OnCooldown ){
      OnCooldown= true;
    }
  }else if(action.equals("move"))
  {
    textAlign(CENTER);
    fill(252, 149, 141);
    text(sceneList.get(curScene).OptionsM[0] ,width/2, 6*height/16); //top
    text(sceneList.get(curScene).OptionsM[1] ,4*width/30, 21*height/32); //left
    text(sceneList.get(curScene).OptionsM[2] ,width/2, 15*height/16); //bottom
    text(sceneList.get(curScene).OptionsM[3] ,26*width/30, 21*height/32); //right
    
    if((up || left || down || right)&& !OnCooldown ){
      OnCooldown= true;
    }
  }
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
  String OptionsM[], OptionsF[], OptionsS[];
  String StrtText, EndText;
  String ResultsM[], ResultsF[], ResultsS[];
  Scene(String optionsM[],String optionsF[],String optionsS[], String strtText) //sets up options
  {
    OptionsM = optionsM;
    OptionsF = optionsF;
    OptionsS = optionsS;
    StrtText = strtText;
  }
  
  void AddResults(String resultsM[],String resultsF[],String resultsS[], String endText)
  {
    ResultsM = resultsM;
    ResultsF = resultsF;
    ResultsS = resultsS;
    EndText = endText;
    
  }
  
}

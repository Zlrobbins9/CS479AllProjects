
float inhaleStart, exhaleStart, exhaleEnd;
int badBreathCount = 0;
String breathPattern = "none";

void meditation_draw()
{
  background(159, 114, 184);
  textSize(width/20);
  text("meditation mode", width/2, height/20);
  textSize(width/30);
  text("try your best to breathe in for 3x the amount you breathe out", width/2, 3*height/20);
  BreatheCheck();
  text("Pressure: " + curPressure, width/2, 5*height/20);
  text("You are currently breathing : " + breathPattern, width/2, 7*height/20);
  text("number of consecutive times failed: " + badBreathCount, width/2, 9*height/20);
}

void BreatheCheck()
{
  if(curPressure > prevPressure && curPressure >= pressureFloor-20 && breathPattern == "none") //if breath is just starting
  {
    breathPattern = "in";
    inhaleStart = millis();
    if(tab.equals("graph")){
      startTier = GetCurrentTier();
    }
  }
  if(curPressure < prevPressure && breathPattern == "in") //breathing out has begun
  {
    breathPattern = "out";
    if(tab != "bird")
      exhaleStart = millis();
  }
  if(curPressure > prevPressure && breathPattern == "out") //breathing out has ended
  {
    if(tab != "bird"){
      exhaleEnd = millis();
    }
    
    if(tab == "graph")
    {
      if(GetCurrentTier() == startTier)
      {
        workoutTiers.get(GetCurrentTier()).SetBreathingRates(exhaleStart-inhaleStart, exhaleEnd-exhaleStart);
      }
    }
    
    if(3*(exhaleStart - inhaleStart) < exhaleEnd - exhaleStart && tab == "meditation") // the exhale was longer than 3x the inhale {for meditation mode}
    {
        badBreathCount = 0;
    }else
    {
        badBreathCount++;
    }
    
    breathPattern = "in";
    if(tab != "bird")
    {
      inhaleStart = exhaleEnd;
      exhaleStart = 0;
      exhaleEnd = 0;
    }
  }
}

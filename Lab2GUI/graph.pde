XYChart lineChart;
FloatList lineChartX;
FloatList lineChartY;

int count;
int age = 18;
int startTier = 1;
ArrayList<workoutData> workoutTiers = new ArrayList<workoutData>(0);

void graph_setup() {
  for(int i=0; i<5; i++)
  {
    workoutTiers.add(new workoutData(i));
  }
  lineChart = new XYChart(this);
  lineChartX = new FloatList();
  lineChartY = new FloatList();
  lineChart.setData(lineChartX.array(), lineChartY.array());
  
  lineChart.showXAxis(true);
  lineChart.showYAxis(true);
  lineChart.setMinY(50);
  lineChart.setMaxY(200);
  
  lineChart.setYFormat("00");
  lineChart.setXFormat("0");
  
  lineChart.setPointColour(color(125, 100));
  lineChart.setPointSize(width/100);
  lineChart.setLineWidth(width/300);
  
  count = 0;
}

void graph_draw() {
  background(220);
  DrawGraph();
  rectMode(CENTER);
  fill(255);
  rect(width/8, 11*height/16, width/10, height/10);
  rect(width/8, 27*height/32, width/10, height/10);
  fill(0);
  text("current age:" + age, width/8, 3*height/4);
  text("age up", width/8, 11*height/16);
  text("age down", width/8, 27*height/32);
  
  text("Current BPM: " + heartRate, width/2, 11*height/16);
  text("Time between beats: " + heartRate/60 + " seconds", width/2,3*height/4);
  text("Words of motivation:", width/2, 26*height/32);
  text("Breath Value:" + curPressure, width/2, 30*height/32);
  int swwitch = GetCurrentTier();
  if(swwitch == 4)
  {
    fill(115, 25, 22);
    text("We are not responsible for your imminent collapse", width/2, 28*height/32);
  }else if(swwitch == 3)
  {
    fill(161, 100, 21);
    text("Keep it up, but be sure to pace yourself!", width/2, 28*height/32);
  }else if(swwitch == 2)
  {
    fill(145, 128, 0);
    text("This is a good place to be, good job!", width/2, 28*height/32);
  }else if(swwitch == 1)
  {
    fill(6, 107, 15);
    text("Great start, but I bet you can go further!", width/2, 28*height/32);
  }else if(swwitch == 0)
  {
    fill(2, 11, 181);
    text("You are gonna have to try a lot harder than THAT.", width/2, 28*height/32);
  }else
  {
    fill(0);
    text("*dial tone noises*", width/2, 28*height/32);
  }
  fill(0);
  
  text("Blood Oxygen Level: " + bloodOxygen, 7*width/8, 11*height/16);
  text("Confidence: " + confidence, 7*width/8, 27*height/32);
}

void DrawGraph()
{
  textSize(30);
  lineChart.setMinY((220-age)/2);
  lineChart.setMaxY(220-age);
  fill(225);
  rectMode(CENTER);
  rect(51*width/100, 25*height/100, width/2, 19*height/40);
  fill(0);
  lineChart.draw(width/4, 0, width/2, height/2);
  
  textSize(40);
  fill(150);
  text("User's Heart Beat", width/2, 57*height/100);
  
  rectMode(CORNER);
  fill(255,20,20,125);
  rect(26*width/100,height/100,width/2, height/10);
  fill(245, 157, 49,125);
  rect(26*width/100,height/100 + height/10,width/2, height/10);
  fill(247, 202, 37,125);
  rect(26*width/100,height/100+ height/5,width/2, height/10);
  fill(76, 210, 40,125);
  rect(26*width/100,height/100+ 3*height/10,width/2, height/10);
  fill(40, 82, 210,125);
  rect(26*width/100,height/100+ 2*height/5,width/2, height/15);
  
  
}

void graph_serialEvent(float val) {
  count++;
  
  lineChartX.append(count);
  lineChartY.append(val);
  
  if (lineChartX.size() > 7 && lineChartY.size() > 7) {
    lineChartX.remove(0);
    lineChartY.remove(0);
  }
  
  lineChart.setData(lineChartX.array(), lineChartY.array());
}

int GetCurrentTier()
{
  if(heartRate > (220-age)*0.9)
  {
    return 4;
  }else if(heartRate <= (220-age)*0.9 && heartRate > (220-age)*0.8)
  {
    return 3;
  }else if(heartRate <= (220-age)*0.8 && heartRate > (220-age)*0.7)
  {
    return 2;
  }else if(heartRate <= (220-age)*0.7 && heartRate > (220-age)*0.6)
  {
    return 1;
  }else if(heartRate <= (220-age)*0.6 && heartRate > 0)
  {
    return 0;
  }else
  {
    return -1;
  }
  
  
}


class workoutData
{
  int tier; // shows what tier of the workout it is
  float inhaleTime, exhaleTime; // record how long you inhale and exhale for this
  float timeSpent; 
  
  workoutData(int _tier)
  {
    tier = _tier;
    inhaleTime = -99;
    exhaleTime = -99;
  }
  
  void SetBreathingRates(float newinhale, float newexhale)
  {
    inhaleTime = newinhale;
    exhaleTime = newexhale;
  }
}

void rest_draw()
{
  background(0, 0, 200);
  fill(255);
  textSize(45);
  textAlign(CENTER, CENTER);
  
  text("Thank you for your patience. Your reasting heart rate is: " + RHRAvg, width/2, height/2);
  text("Press r to go to the relaxation GUI", width/2, 9*height/16);
  text("Press g to go to the workout GUI", width/2, 10*height/16);
  
}

void TakeRest()
{
  background(0);
  fill(255);
  textSize(45);
  textAlign(CENTER, CENTER);
    text("scanning...", width/2, height/2);
    for(int i = 0; i < 30; i++)
    {
      println(i + " seconds have passed...");
      restingRateList.add(heartRate);
      delay(999);
    }
    println("resting HR recording finished!");
    println("Printing of size..." + restingRateList.size());
    float HRSum = 0;
    for(int i=0; i < 30; i++)
    {
      println(restingRateList.get(i));
      HRSum += restingRateList.get(i);
    }
    RHRAvg = HRSum/30.0;
    println("your average resting HR is..." + RHRAvg);
}

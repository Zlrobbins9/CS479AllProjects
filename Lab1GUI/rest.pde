void rest_draw()
{
  println("why do I not run");
  background(0, 0, 200);
  fill(255);
  textSize(45);
  textAlign(CENTER, CENTER);
  
  text("aaaaaaaaaaaaaaaaaaaaaaaaa.", width/2, height/2);
  text("Press L when youre ready", width/2, 8*height/15);
}

/*void TakeRest()
{
  while(heartRate == -99)
  {
    //println("waiting for input...");
    pushStyle();
  background(0, 0, 0);
  fill(255);
  textSize(45);
  textAlign(CENTER, CENTER);
    text("no input detected, please place your finger on the sensor...", width/2, height/2);
    popStyle();
  }
    print("Starting recording of resting HR...");
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
    float RHRAvg = HRSum/30.0;
    println("your average resting HR is..." + RHRAvg);
}
*/

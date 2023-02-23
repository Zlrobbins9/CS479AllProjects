void intro_draw() {
  background(120, 10, 255);
  fill(255);
  
  textAlign(CENTER, CENTER);
  textSize(70);
  text("We will begin by recording your resting heart rate for 30 seconds.", width/2, height/3);
  textSize(45);
  if(heartRate != -99)
  {
    text("Press L when you are ready, and wait 30 seconds", width/2, 9*height/15);
    text("When the scanning is done, the screen will change", width/2, 11*height/15);
  }else
  {
    fill(210,30,30);
    text("No heart rate detected, please tighten the finger harness...", width/2, 9*height/15);
  }
}

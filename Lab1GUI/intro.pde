void intro_draw() {
  background(120, 10, 255);
  fill(255);
  textSize(45);
  textAlign(CENTER, CENTER);
  
  text("We will begin by recording your resting heart rate for 30 seconds.", width/2, height/2);
  
  if(heartRate != -99)
  {
    text("Press L when youre ready, and wait 30 seconds", width/2, 8*height/15);
    text("When the scanning is done, the screen will change", width/2, 9*height/15);
  }else
  {
    text("No heart rate detected, please tighten the finger harness...", width/2, 8*height/15);
  }
}

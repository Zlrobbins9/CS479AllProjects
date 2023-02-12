void intro_draw() {
  pushStyle();
  background(120, 10, 255);
  fill(255);
  textSize(45);
  textAlign(CENTER, CENTER);
  
  text("We will begin by recording your resting heart rate for 30 seconds.", width/2, height/2);
  text("Press L when youre ready", width/2, 8*height/15);
  popStyle();
}

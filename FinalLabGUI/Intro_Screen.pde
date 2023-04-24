PImage intro;
void introDraw()
{
  background(0);
  fill(255);
  textSize(40);
  textAlign(CENTER);
    image(intro,0,0);

  
  if(up && down)
  {
      tab = "game";
      up = false;
      down = false;
  }
  
}

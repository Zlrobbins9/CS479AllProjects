void keyPressed() {
  switch (key) {
    case 'a':
      tab = "intro";
      break;
      
    case 'w':
      tab = "graph";
      break;
      
    case 'd':
      tab = "high_low";
      break;

    case 'l':
     if(RHRAvg == -99 && heartRate != -99)
     {
     tab = "rest";
     if(RHRAvg == -99)
     {
     TakeRest();
     }
     }
     break;

    case 'r':
      tab = "relax";
      break;
  }
}

void mousePressed()
{
  if(tab == "graph" && mouseX >= width/2-width/20 && mouseX <= width/2+width/20 )
  {
    if(mouseY >= 11*height/16-height/20 && mouseY <= 11*height/16+height/20)
    {
      println("top button pressed!");
    }else if(mouseY >= 27*height/32-height/20 && mouseY <= 27*height/32+height/20)
    {
      
    }
  }
}

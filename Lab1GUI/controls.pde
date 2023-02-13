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
  
}

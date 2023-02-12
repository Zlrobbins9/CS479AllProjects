void keyPressed() {
  switch (key) {
    case 'a':
      tab = "intro";
      break;
      
    case 's':
      tab = "graph";
      break;
      
    case 'd':
      tab = "high_low";
      break;
      
     case 'l':
     if(RHRAvg == -99)
     {
     tab = "rest";
     TakeRest();
     }
     
     break;
  }
}

void mousePressed()
{
  
}

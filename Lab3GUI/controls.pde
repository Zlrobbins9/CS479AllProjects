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

    case 'r':
      tab = "relax";
      break;
      
      case 'm':
      tab = "meditation";
      break;
      
      case ' ':
      isFakeBreathing = true;
      break;
      
      case 'b':
      tab = "bird";
      bird_setup();
      break;
      
      case '5':
      exhaleMode = 5;
      break;
      case '1':
      exhaleMode = 1;
      break;
  }
}

void keyReleased()
{
  if(key == ' ')
  {
    isFakeBreathing = false;
  }
  
}

void mousePressed()
{
  
}

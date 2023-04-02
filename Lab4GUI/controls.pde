boolean MFStep = false, LFStep = false, MMStep = false, HeelStep = false;

void keyPressed() {
  switch (key) {
    case 't':
      if(tab != "game")
      tab = "game";
      break;
      
      case 'w':
      up = true;
      
      break;
      
      case 'a':
      left = true;
      break;
      
      case 's':
      down = true;
      break;
      
      case 'd':
      right = true;
      break;
      
      case 'p':
      speak = true;
      break;
      
      case 'l':
      fight = true;
      break;
      
      case 'm':
      travel = true;
      break;
  }
}

void keyReleased()
{
  switch (key) {
    case 'i':
      tab = "intro";
      break;
      
      case 'w':
      up = false;
      break;
      
      case 'a':
      left = false;
      break;
      
      case 's':
      down = false;
      break;
      
      case 'd':
      right = false;
      break;
      
      case 'p':
      speak = false;
      break;
      
      case 'l':
      fight = false;
      break;
      
      case 'm':
      travel = false;
      break;
  }
  
}

void mousePressed()
{
  
}

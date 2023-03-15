boolean MFStep = false, LFStep = false, MMStep = false, HeelStep = false;

void keyPressed() {
  switch (key) {
    case 'i':
      tab = "intro";
      break;
      
      case 'w':
      MFStep = true;
      
      break;
      
      case 'e':
      LFStep = true;
      break;
      
      case 's':
      MMStep = true;
      break;
      
      case 'x':
      HeelStep = true;
      break;
      
      case 'b':
      tab = "bird";
      //bird_setup();
      break;
  }
}

void keyReleased()
{
  switch (key) {
    case 'i':
      tab = "intro";
      break;
      
    case 'g':
      tab = "graph";
      break;
      
    case 'd':
      tab = "dance";
      
      case 'w':
      MFStep = false;
      break;
      
      case 'e':
      LFStep = false;
      break;
      
      case 's':
      MMStep = false;
      break;
      
      case 'x':
      HeelStep = false;
      break;
  }
  
}

void mousePressed()
{
  
}

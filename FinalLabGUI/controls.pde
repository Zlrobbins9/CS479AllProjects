void keyPressed() {
  switch (key) {
    case 't':
      if(tab != "game")
      {
      tab = "game";
      }else
      {
        OnCooldown = false;
        up=false; down = false; left = false;right = false; move = false; fight = false; speak = false;
      }
      break;
      
      case 'w':
      if(!OnCooldown)
      up = true;
      
      break;
      
      case 'a':
      if(!OnCooldown)
      left = true;
      break;
      
      case 's':
      if(!OnCooldown)
      down = true;
      break;
      
      case 'd':
      if(!OnCooldown)
      right = true;
      break;
      
      
      case 'p':
      if(!OnCooldown)
      speak = true;
      break;
      
      case 'l':
      if(!OnCooldown)
      fight = true;
      break;
      
      case 'm':
      if(!OnCooldown)
      move = true;
      break;
  }
}

void keyReleased()
{
  switch (key) {
    case 'i':
      tab = "intro";
      break;
      
      case 'p':
      if(!OnCooldown)
      speak = false;
      break;
      
      case 'l':
      if(!OnCooldown)
      fight = false;
      break;
      
      case 'm':
      if(!OnCooldown)
      move = false;
      break;
  }
  
}

void serialEvent(Serial myPort) {
  String tempVal = myPort.readStringUntil('\n');
  if(tempVal == null){
    return;
  }
  println("tempval is:" + tempVal );
  tempVal = tempVal.trim();
  switch(tempVal)
  {
    case "3 touched":
    if(!OnCooldown)
     up = true;
    break;
    case "3 released":
    if(!OnCooldown)
      up = false;
    break;
    
    case "4 touched":
    if(!OnCooldown)
     left = true;
    break;
    case "4 released":
    if(!OnCooldown)
      left = false;
    break;
    
    case "5 touched":
    if(!OnCooldown)
      down = true;
    break;
    case "5 released":
    if(!OnCooldown)
      down = false;
    break;
    
    case "6 touched":
    if(!OnCooldown)
      right = true;
    break;
    case "6 released":
    if(!OnCooldown)
      right = false;
    break;
    
    
    case "1 touched":
    if(!OnCooldown)
     speak = true;
    break;
    case "1 released":
    if(!OnCooldown)
      speak = false;
    break;
    
    case "0 touched":
    if(!OnCooldown)
      fight = true;
    break;
    case "0 released":
    if(!OnCooldown)
      fight = false;
    break;
    
    case "2 touched":
    if(!OnCooldown)
      move = true;
    break;
    case "2 released":
    if(!OnCooldown)
      move = false;
    break;
    
    
    default:
    println("no input :(");
    break;
  }
  }

void mousePressed()
{
  
}

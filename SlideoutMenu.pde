Menu tab;

class Menu 
{
  float x;
  float y;
  
  Menu()
  {
    x = -100;
    y = height/3;
  }
}

void drawMenu()
{
  
  if(mouseX < 80 && tab.x <= 0)
  {
    rect(tab.x, tab.y, 80, 200);
    tab.x += 0.8;
    
  }
  else
  {
    if(tab.x > -100)
    {
      tab.x -= 0.8;
    }
  
  }
}
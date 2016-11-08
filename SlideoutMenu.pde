Menu tab;

class Menu 
{
  float x;
  float y;
  
  Menu()
  {
    x = -100;
    y = height/5;
  }
  
  void draw()
  {
    Radar radar = radars.get(0);
    stroke(radar.c);
    noFill();
    rect(x, y, 240, height/1.5 );
  }
}

void drawMenu()
{
  tab.draw();
  menuNav();
}

void menuNav()
{
  if(mouseX < 240 && tab.x < - 4)
  {
    tab.x += 4;
  }
  else if(mouseX > 240 && tab.x < 20 && tab.x > -240)
  {
    tab.x -= 6;
  }
}
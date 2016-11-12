Menu tab;

class Menu 
{
  float x;
  float y;
  float size;
  
  
  Menu()
  {
    x = -100;
    y = height/5;
    size = 240;
  }
  
  void draw()
  {
    Radar radar = radars.get(0);
    stroke(radar.c);
    fill(0);
    rect(x, y, size, height/1.5);
  }
  
  void drawButtons()
  {
    Radar radar = radars.get(0);
    stroke(radar.c, 150);
    noFill();
    rect(x, y, size, size);
    
  }
}

void drawMenu()
{
  tab.draw();
  
  if(menuButtons == true)
  {
    for(Menu button: buttons)
    {
      button.drawButtons();
    }
  }
  
  menuNav();
}

void menuNav()
{
  println(tab.x);
  
  
  if(tab.x > -5.0f)
  {
    menuButtons = true;
  }
  else if(tab.x < -5)
  {
    menuButtons = false;
  }
  if(mouseX <= 240 && tab.x < - 4)
  {
    tab.x += 4;
  }
  else if(mouseX > 240 && tab.x < 20 && tab.x > -240)
  {
    tab.x -= 6;
  }
}

void createButtons()
{
  for(int i = 0; i < 4; i++)
  {
    Menu button = new Menu();
    button.x = 60;
    button.size = 100;
    button.y = height/4 + height/6.5 * i;
    buttons.add(button);
  }

}
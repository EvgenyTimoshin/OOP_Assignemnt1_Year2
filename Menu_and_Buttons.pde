Menu tab;

class Menu 
{
  float x;
  float y;
  float size;
  String text;
  color c;
  
  Menu()
  {
    x = -100;
    y = height/5;
    size = 240;
  }
  
  Menu(float x , float y, float size, String text)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    this.text = text;
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
    textSize(13);
    textMode(CENTER);
    if(text != null)
    {
      fill(255);
      text(text, x + size/6, y + size/2);
    }
  }
}//End Class
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
}//End drawMenu

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
  else if(mouseX > 240 && tab.x < 20 &&  tab.x > -240)
  {
    tab.x -= 6;
  }
}//end menuNav

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
  
  
  //Solar buttons
  
  solarButton1 = new Menu();
  solarButton1.x = 50;
  solarButton1.size = 80;
  solarButton1.y = height/2 + 70;
  solarButton1.text = "Dist F star";
  
  
  solarButton2 = new Menu();
  solarButton2.x = 170;
  solarButton2.size = 80;
  solarButton2.y = height/2 + 70;
  solarButton2.text = "Mass";
  
  solarButton3 = new Menu();
  solarButton3.x = 290;
  solarButton3.size = 80;
  solarButton3.y = height/2 + 70;
  solarButton3.text = "Age";
  
  solarButton4 = new Menu();
  solarButton4.x = 410;
  solarButton4.size = 80;
  solarButton4.y = height/2 + 70;
  solarButton4.text = "dayCycle";
  
  
}//End createButtons
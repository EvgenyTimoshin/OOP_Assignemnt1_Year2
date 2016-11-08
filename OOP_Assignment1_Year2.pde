/*
GUI assignment1 for OOP
Author : Evgeny Timoshin
Student NO: c15514003
Date started 24/10/2016 - current
*/

void setup()
{
  fullScreen();
  //size(600, 600);
  smooth();
  //
  frameRate(120);
  background(0);
  setupRadar();
  createButtons();
  setupCamera();
  
  tab = new Menu();
}
Boolean blue = false, red = true, green = false, someshit = false, menuButtons = false;
ArrayList<Radar>radars = new ArrayList<Radar>();
ArrayList<Radar>radarTexts = new ArrayList<Radar>();
ArrayList<Menu>buttons = new ArrayList<Menu>();
Float radarLoc;

void draw()
{
  background(0,0);
  drawRadar();
  drawMenu();
  drawCamera();
}

void keyPressed()
{
  
  if(key == '1')
  {
    red = true;
    blue = green = someshit = false;
    radarChangeColor();
  }
  if(key == '2')
  {
    blue = true;
    red = green = someshit = false;
    radarChangeColor();
  }
  if(key == '3')
  {
    green = true;
    red = blue = someshit = false;
    radarChangeColor();
  }
  if(key == '4')
  {
    someshit = true;
    red = blue = green = false;
    radarChangeColor();
  }
}
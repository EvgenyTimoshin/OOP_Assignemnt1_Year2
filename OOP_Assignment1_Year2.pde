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
  background(0);
  setupRadar();
  tab = new Menu();
}

ArrayList<Radar>circles = new ArrayList<Radar>();
ArrayList<Coordinates>compassPoints = new ArrayList<Coordinates>();
Rline line;

void draw()
{
  background(0,0);
  
  drawMenu();
  drawRadar();
}
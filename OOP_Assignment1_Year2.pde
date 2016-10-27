/*
GUI assignment1 for OOP
Author : Evgeny Timoshin
Student NO: c15514003
Date started 24/10/2016 - current
*/

void setup()
{
  fullScreen();
  smooth();
  createRadar();
  background(0);
  
}

ArrayList<Radar>circles = new ArrayList<Radar>();
ArrayList<Rline>lines = new ArrayList<Rline>();

void draw()
{
  drawRcircles();
  drawLines();
}
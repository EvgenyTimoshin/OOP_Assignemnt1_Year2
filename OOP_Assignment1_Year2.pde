/*
GUI assignment1 for OOP
Author : Evgeny Timoshin
Student NO: c15514003
Date started 24/10/2016 - current
*/

import ddf.minim.*;

void setup()
{
  fullScreen(P3D);
  //size(1920, 1080 , P3D);
  smooth();
  frameRate(60);
  background(0);
  //textureMode(IMAGE);
  setupRadar();
  createButtons();
  createWindows();
  createPlanets();
  createColorBars();
  image = loadImage("hiresspace.jpg");
  //setupCamera();
  setupUi();
  
  tab = new Menu();
  song = new Minim(this);
  sound = song.loadFile("menusong.mp3");
  sound.play();
}

//GLOBAL VARS
//Bool
Boolean blue = false, red = true, green = false, someshit = false, menuButtons = false;
Boolean stopX = false, stopY = true;
Boolean solarScale = false;
Boolean solarmap = false;


//ArrayLists
ArrayList<Radar>radars = new ArrayList<Radar>();
ArrayList<Radar>radarTexts = new ArrayList<Radar>();
ArrayList<Menu>buttons = new ArrayList<Menu>();
ArrayList<FrontDisplay>displays = new ArrayList<FrontDisplay>();
ArrayList<Planet>planets = new ArrayList<Planet>();
//Other


Float radarLoc;
PImage image;
int gameState = 1;
Menu solarButton1, solarButton2, solarButton3, solarButton4;
ColorBar bar1, bar2, bar3;
AudioPlayer sound;
Minim song;


 
void draw()
{
  //lights();
  switch(gameState)
  {
    case 0: background(0);
            uiOutline();
            break;
            
    case 1: background(0);
            if(solarmap == false)
            {
              uiOutline();
              drawInterior();
              drawRadar();
              drawFrontDisp();
              drawMenu();
              drawColorBars();
            }
            else
            {
               drawSolarGraph();
            }
            drawPlanets();
            break;
  }
  
  
  
  //drawCamera();
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
class ColorBar
{
  float x,y;
  float initialY;
  color c;
  Boolean pressed = false;
  int text;
  
  ColorBar(float x, float y, color c)
  {
    this.x = x;
    this.y = y;
    initialY = y;
    this.c = c;
    text = 0;
  }
  
  void drawBars()
  {
    stroke(c);
    noFill();
    rect(x, y,40 , 40);
    line(x + 20, y + 40, x + 20, height);
    fill(255);
    text(text,x + 7 , y + 20);
  }
  
  //Updates the values and position of the color bars on the screen based on input and keeps them alligned
  void update()
  {
    text = (int)(initialY - y);
    if(!mousePressed)
    {
      pressed = false;
    }
    
    if(y < initialY - 255)
    {
      y = initialY - 255;
    }
    
    if(y > initialY)
    {
      y = initialY;
    }
    
    if(pressed == true)
    {
      y = mouseY;
    }
    if(mouseX > x && mouseX < x+40 && mouseY > y && mouseY < y + 40)
    {
      if(mousePressed)
      {
        pressed = true;
      }
    }
    
     Radar r = radars.get(0);
     r.c = color(bar1.text, bar2.text, bar3.text);
  }
}//End Class

void createColorBars()
{
  float x = 400;
  float y = height - 55;
  bar1 = new ColorBar(x, y, color(255,0,0));
  bar2 = new ColorBar(x + 50, y, color(0, 255, 0));
  bar3 = new ColorBar(x + 100, y, color(0, 0, 255));
}//End createColorBars

//Draws each color bar on screen
void drawColorBars()
{ 
  bar1.update();
  bar2.update();
  bar3.update();
  bar1.drawBars();
  bar2.drawBars();
  bar3.drawBars();
}//End drawColorBars
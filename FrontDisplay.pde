class FrontDisplay
{
  float x;
  float y;
  float size;
  
  FrontDisplay(float x, float y, float size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  void draw()
  {
    //line(width/2, 0 , width/2, height);
    PShape s;
    Radar r =  radars.get(0);
    s = createShape();
    s.beginShape();
    s.noFill();
    s.stroke(r.c);
    s.vertex(x, y + size/4);
    s.vertex(x + size/4, y - size);
    s.vertex(width/2 + size*.75, y - size);
    s.vertex(width/2 + size, y + size/4);
    s.endShape(CLOSE);
    shape(s);
    //text("YO", width/2, height/2);
  }
}

void createWindows()
{
  int x = 330;
  for(int i = 0; i < 3; i ++)
  {
    FrontDisplay disp = new FrontDisplay(width / 2 - x, height - 100, x);
    displays.add(disp);
    x += 8;
  }
}

void drawFrontDisp()
{
  for(FrontDisplay disp: displays)
  {
    disp.draw();
  }
}
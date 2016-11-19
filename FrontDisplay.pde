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
    /*
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
   
    */
    
    PShape s;
    Radar r =  radars.get(0);
    s = createShape();
    s.beginShape();
    s.fill(r.c, 4);
    s.stroke(r.c);
    s.vertex(x, y + size/4, -250);
    s.vertex(x + size/4, y - size, -250);
    s.vertex(width/2 + size*.75, y - size,-250);
    s.vertex(width/2 + size, y + size/4, -250);
    s.vertex(width/2 + size, y + size/2, - 250);
    s.vertex(x , y + size/2, -250);
    s.endShape(CLOSE);
    shape(s);
  }
  
}//End Class

void createWindows()
{
  int x = 400;
  for(int i = 0; i < 3; i ++)
  {
    FrontDisplay disp = new FrontDisplay(width / 2 - x, height - 100, x);
    displays.add(disp);
    x += 8;
  }
  
  frontDispB1 = new Menu(width/2 - 300, height - 110, 70, "Engine");
  frontDispB2 = new Menu(width/2 - 200, height - 110, 70, "Missile");
  frontDispB3 = new Menu(width/2 - 100, height - 110, 70, "Gun");
  frontDispB4 = new Menu(width/2 + 25, height - 110, 70, "Drill");
  frontDispB5 = new Menu(width/2 + 125 , height - 110, 70, "HDrive");
  frontDispB6 = new Menu(width/2 + 225 , height - 110, 70, "Wipers");
}//End createWindows

void drawFrontDisp()
{
  buttonControl();
  for(FrontDisplay disp: displays)
  {
    disp.draw();
  }
  frontDispB1.drawButtons();
  frontDispB2.drawButtons();
  frontDispB3.drawButtons();
  frontDispB4.drawButtons();
  frontDispB5.drawButtons();
  frontDispB6.drawButtons();
}//end drawFrontDisp

void buttonControl()
{
  if(mouseX > frontDispB1.x && mouseX < frontDispB1.x + frontDispB1.size
     && mouseY > frontDispB1.y && mouseY < frontDispB1.y + frontDispB1.size && mousePressed)
     {
       engineOn = true;
       missiles = false;
       guns = false;
       drill = false;
       HDrive = false;
     }
   if(mouseX > frontDispB2.x && mouseX < frontDispB2.x + frontDispB2.size
     && mouseY > frontDispB2.y && mouseY < frontDispB2.y + frontDispB2.size && mousePressed)
     {
       missiles = true;
       guns = false;
       drill = false;
       HDrive = false;
     }
     if(mouseX > frontDispB3.x && mouseX < frontDispB3.x + frontDispB3.size
     && mouseY > frontDispB3.y && mouseY < frontDispB3.y + frontDispB3.size && mousePressed)
     {
       missiles = false;
       guns = true;
       drill = false;
       HDrive = false;
     }
     if(mouseX > frontDispB4.x && mouseX < frontDispB4.x + frontDispB4.size
     && mouseY > frontDispB4.y && mouseY < frontDispB4.y + frontDispB4.size && mousePressed)
     {
       missiles = false;
       guns = false;
       drill = true;
       HDrive = false;
     }
     if(mouseX > frontDispB5.x && mouseX < frontDispB5.x + frontDispB5.size
     && mouseY > frontDispB5.y && mouseY < frontDispB5.y + frontDispB5.size && mousePressed)
     {
       engineOn = true;
       missiles = false;
       guns = false;
       drill = false;
       HDrive = true;
     }
     if(mouseX > frontDispB1.x && mouseX < frontDispB1.x + frontDispB1.size
     && mouseY > frontDispB1.y && mouseY < frontDispB1.y + frontDispB1.size)
     {
       
     }
     
     if(engineOn)
     {
       engineOn();
     }
     if(missiles)
     {
       missiles();
     }
     if(guns)
     {
       guns();
     }
     if(drill)
     {
       drill();
     }
     if(HDrive)
     {
       HDrive();
     }
}
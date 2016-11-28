class Dial
{
  float x, y;
  float startangle;
  float endangle;
  float size;
  String text;
  
  Dial(float x, float y, float startangle, float endangle, float size, String text)
  {
    this.x = x;
    this.y = y;
    this.startangle = startangle;
    this.endangle = endangle;
    this.size = size;
    this.text = text;
  }
  
  void render()
  {
    if(text != "Speed")
    {
      stroke(87, endangle * 50, 2);
    }
    else
    {
      stroke(radars.get(0).c);
    }
    strokeWeight(size);
    noFill();
    arc(x , y , 120, 120, startangle, endangle);
    strokeWeight(2);
    stroke(radars.get(0).c);
    strokeWeight(5);
    ellipse(x, y, 160, 160);
    strokeWeight(7);
    fill(255);
    textSize(20);
    text(((int)(map(endangle, HALF_PI, 6.47, 0, 100))),x - 12 , y + 2);
    text(text, x - 25 , y + 110);
  }
  
  void update()
  {
    if(text == "Speed")
    {
      if(keyPressed && key == 'w' && endangle <= 6.47)
      {
        endangle += 0.01;
        fill(255, 0 , 0);
        textSize(25);
        text("THRUSTERS ENGANGED!", width/2 - 150, height - 150);
      }
      if(keyPressed && key == 's' && endangle > HALF_PI)
      {
        endangle -= 0.01;
        fill(255, 150 , 0);
        textSize(25);
        text("REVERSE THRUSTERS!", width/2 - 140, height - 150);
      } 
    }
    
    if(text == "Fuel")
    {
      if(frameCount % 240 == 0 && endangle >= 0)
      {
        endangle -= 0.2;
      }
      if(endangle < 2.5)
      {
        textSize(40);
        fill(255, 0, 0);
        text("WARNING LOW FUEL", width/2 - 200, height/2 - 50);
      }
    }
  }
}

void createDials()
{
  Dial d = new Dial(width - 450, height - 120, HALF_PI, HALF_PI ,25, "Speed");
  dials.add(d);
  
  d = new Dial(width - 275, height - 120, HALF_PI, HALF_PI ,25, "Fuel");
  dials.add(d);
  
  d = new Dial(width - 100, height - 120, HALF_PI, HALF_PI ,25, "HDrive F");
  dials.add(d);
}

void drawDials()
{
  for(Dial d: dials)
  {
    d.update();
    d.render();
  }
}
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
    stroke(radars.get(0).c);
    strokeWeight(size);
    noFill();
    arc(x , y , 120, 120, startangle, endangle);
    strokeWeight(7);
    text(((int)(map(endangle, HALF_PI, 6.47, 0, 100))),x - 12 , y + 2);
    text(text, x - 12 , y + 100);
  }
  
  void update()
  {
    if(text == "Speed")
    {
      if(keyPressed && key == 'w' && endangle <= 6.47)
      {
        endangle += 0.1;
      }
      if(keyPressed && key == 's' && endangle > 1.5)
      {
        endangle -= 0.1;
      } 
    }
  }
  
}

void createDials()
{
  Dial d = new Dial(width - 450, height - 120, HALF_PI, HALF_PI ,25, "Speed");
  dials.add(d);
  
  d = new Dial(width - 300, height - 120, HALF_PI, HALF_PI ,25, "Fuel");
  dials.add(d);
  
  d = new Dial(width - 150, height - 120, HALF_PI, HALF_PI ,25, "HDrive F");
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
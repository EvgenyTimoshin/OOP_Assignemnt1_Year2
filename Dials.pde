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
    strokeWeight(size);
    noFill();
    arc(x , y , 40, 40, startangle, endangle);
  }
  
}

void createDials()
{
  Dial d = new Dial(width - 200, height - 200, HALF_PI, HALF_PI + 1,10, "Speed");
  dials.add(d);
}

void drawDials()
{
  for(Dial d: dials)
  {
    d.render();
  }
}
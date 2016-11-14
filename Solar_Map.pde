class Planet
{
  float size;
  PVector loc;
  
  Planet (float size, PVector loc)
  {
     this.size = size;
     this.loc = loc;
  }
  
  void render()
  {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    sphere(size);
    popMatrix();
    
  }
  
  void update()
  {
    
  }
}

void createPlanets()
{
}
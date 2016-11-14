class Planet
{
  float size;
  PVector loc;
  color c;
  
  Planet (float size, float x , float y, float z, color c)
  {
     this.size = size;
     this.loc = new PVector(x , y, z);
     this.c = c;
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
  Planet Sun = new Planet(100, width/2, height/2 + 300, 0, (#FF680A));
  planets.add(Sun);
  
  for(int i = 0; i < 9; i ++)
  {
    float size = random(25, 70);
    Planet p = new Planet(size, width/2, width/2 + 250, size * i, color(random(255), random(255), random(255)));
    planets.add(p);
  }
}

void drawPlanets()
{
  for(Planet p: planets)
  {
    p.render();
  }
}
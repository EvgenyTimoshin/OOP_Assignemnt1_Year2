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
    fill(c);
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
  planets.clear();
  
  Planet Sun = new Planet(50, width/2, height/2 + 210, 0, (#FF680A));
  planets.add(Sun);
  int distanceZ = 100;
  
  for(int i = 0; i < 5; i ++)
  {
    float size = random(5, 38);
    distanceZ += size + 50;
    Planet p = new Planet(size, width/2, height/2 + 220, distanceZ, color(random(255), random(255), random(255)));
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
class Planet
{
  float size;
  float theta;
  float speed;
  PVector loc;
  color c;
  
  Planet (float size, float x , float y, float z, color c, float theta,float speed)
  {
     this.size = size;
     this.loc = new PVector(x , y, z);
     this.c = c;
     this.theta = theta;
     this.speed = speed;
  }
  
  void render()
  {
    float x = width/2 + sin(theta) * loc.z ;
    float z = 0 - cos(theta) * loc.z ;
    pushMatrix();
    fill(c);
    translate(x, loc.y, z);
    rotateX(speed);
    rotateY(speed/3);
    sphereDetail(15);
    sphere(size);
    popMatrix();
    theta += speed;
    
  }
  
  void update()
  {
    if(mouseX < width/2 + 100 && mouseX > width/2 - 100 && mouseY < height/2 + 290 && mouseY > height/2 - 90)
    if(solarScale == false && mouseX < width/2 + 100 && mouseX > width/2 - 100 && mouseY < height/2 + 290 && mouseY > height/2 - 90)
    {
      for(Planet r: planets)
      {
        r.size = r.size * 2;
        r.loc.z = r.loc.z * 2;
        
      }
      solarScale = true;
    }
    if (solarScale == true && (mouseX > width/2 + 100 || mouseX < width/2 - 100 || mouseY > height/2 + 290 || mouseY < height/2 - 90))
    {
      for(Planet r: planets)
      {
        r.size = r.size /2;
        r.loc.z = r.loc.z / 2;
      }
      
      solarScale = false;
    }
  }
}

void createPlanets()
{
  planets.clear();
  
  Planet Sun = new Planet(50, width/2, height/2 + 190, 0, (#FF680A), 0.0f, 0);
  planets.add(Sun);
  int distanceZ = 100;
  
  for(int i = 0; i < 7; i ++)
  {
    float size = random(3, 22);
    distanceZ += size + 15;
    Planet p = new Planet(size, width/2, height/2 + 200, distanceZ, color(random(255), random(255), random(255)), random(0, 3.14), random(0.008f, 0.04f));
    planets.add(p);
  }
}

void drawPlanets()
{
  for(Planet p: planets)
  {
    p.render();
    p.update();
  }
}
class Planet
{
  float size;
  float sizeMax, sizeMin;
  float theta;
  float speed;
  PVector loc;
  color c;
  String name;
  
  Planet (TableRow row)
  {
     this.name = row.getString("name");
     this.sizeMax = row.getFloat("sizeMax");
     this.sizeMin = row.getFloat("sizeMin");
     this.size = row.getFloat("size");
     this.loc = new PVector(width/2, height/2 + 190,row.getFloat("distanceFromStar"));
     this.c = color(random(255), random(255), random(255));
     this.theta = row.getFloat("rotangle");
     this.speed = row.getFloat("orbitspeed");
  }
  
  void render()
  {
    float x = width/2 + sin(theta) * loc.z;
    float z = 0 - cos(theta) * loc.z ;
    pushMatrix();
    fill(c);
    translate(x, loc.y, z);
    rotateX(theta/5);
    rotateY(theta);
    sphereDetail(15);
    stroke(0,120);
    sphere(size);
    popMatrix();
    theta +=speed;
  }
  
  void update()
  {
    if(mouseX < width/2 + 100 && mouseX > width/2 - 100 && mouseY < height/2 + 290 && mouseY > height/2 - 90)
    {
    
    }
    if(solarScale == false && mouseX < width/2 + 100 && mouseX > width/2 - 50 && mouseY < height/2 + 290 && mouseY > height/2 - 90)
    {
      solarmap = true;
      for(Planet r: planets)
      {
        r.size = r.size * 1.02;
        r.loc.z = r.loc.z * 1.02;
      }
      
      Planet r = planets.get(0);
      if(r.size >= r.sizeMax)
      {
        solarScale = true;
      }
    }
    if (solarScale == true && (mouseX > width/2 + 100 || mouseX < width/2 - 100 || mouseY > height/2 + 290 || mouseY < height/2 - 90))
    {
      solarmap = false;
      for(Planet r: planets)
      {
        r.size = r.size / 1.05;
        r.loc.z = r.loc.z / 1.05;
      }
      
      Planet r = planets.get(0);
      if(r.size <= r.sizeMin)
      {
        solarScale = false;
      }
    }
  }
}

void createPlanets()
{
  planets.clear();
  Table table = loadTable("planetInfo.csv","header");
  for(TableRow row: table.rows())
  {
    Planet p = new Planet(row);
    planets.add(p);
  }
  Planet p = planets.get(0);
  p.c = color(#E9F0A0);
}

void drawPlanets()
{
  for(Planet p: planets)
  {
    p.render();
    p.update();
  }
}
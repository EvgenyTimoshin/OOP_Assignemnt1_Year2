class Planet
{
  float size;
  float sizeMax, sizeMin;
  float theta;
  float speed;
  PVector loc;
  color c;
  String name,resourcelevel,description,daycycle;
  float age, mass;
  
  Planet (TableRow row)
  {
     this.name = row.getString("name");
     this.age = row.getFloat("age");
     this.mass = row.getFloat("mass");
     this.sizeMax = row.getFloat("sizeMax");
     this.resourcelevel = row.getString("resourcelevel");
     this.description = row.getString("description");
     this.daycycle = row.getString("daycycle");
     this.sizeMin = row.getFloat("sizeMin");
     this.size = row.getFloat("size");
     this.loc = new PVector(width/2, height/2 + 190,row.getFloat("distanceFromStar"));
     this.c = color(row.getInt("red"), row.getInt("green"),row.getInt("blue"));
     this.theta = row.getFloat("rotangle");
     this.speed = row.getFloat("orbitspeed");
  }
  
  void render()
  {
    float x = width/2 + sin(theta) * loc.z;
    float z = 0 - cos(theta) * loc.z ;
    if(solarScale && name != null)
    {
      text(name, x + size*2, loc.y, z);
    }
    pushMatrix();
    translate(x, loc.y, z);
    rotateX(theta/5);
    rotateY(theta);
    sphereDetail(20);
    stroke(0,120);
    fill(c);
    sphere(size);
    popMatrix();
    theta +=speed;
    fill(255);
    
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
    if (solarScale == true && mouseY < height/2 /*(mouseX > width/2 + 100 || mouseX < width/2 - 100 || mouseY > height/2 + 290 || mouseY < height/2 - 90)*/ && mousePressed)
    {
      solarmap = false;
      for(Planet r: planets)
      {
        r.size = r.size / 1.02;
        r.loc.z = r.loc.z / 1.02;
      }
      
      Planet r = planets.get(0);
      if(r.size <= r.sizeMin)
      {
        solarScale = false;
      }
    }
  }
  
  void drawSolarGraph()
  {
    for(int x = 0; x < width/2; x += (width/2)/7)
    {
      fill(255);
      rect(x, height/2, (width/2)/7, -loc.z);
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
  
}

void drawPlanets()
{
  for(Planet p: planets)
  {
    p.render();
    p.update();
  }
}

void drawSolarGraph()
{
  float x = 0;
  float barW = (width/2)/planets.size();
  float scale = (height/2)/850392;
  
   for(int i = 0; i < planets.size(); i++)
  {
    
    Planet planet;
    planet = planets.get(i);
    fill(planet.c);
    rect(x, height/2, barW,-planet.mass*scale);
    
    x += barW;
  }
}
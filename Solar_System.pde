class Planet
{
  float size;
  float sizeMax, sizeMin;
  float theta;
  float speed;
  PVector loc;
  color c;
  String name,resourcelevel,description;
  float age, mass, daycycle;
  
  Planet (TableRow row)
  {
     this.name = row.getString("name");
     this.age = row.getFloat("age");
     this.mass = row.getFloat("mass");
     this.sizeMax = row.getFloat("sizeMax");
     this.resourcelevel = row.getString("resourcelevel");
     this.description = row.getString("description");
     this.daycycle = row.getFloat("daycycle");
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
    Planet p = planets.get(0);
    if(solarScale == false && mouseX < p.loc.x + p.size && mouseX > p.loc.y - p.size
      && mouseY < p.loc.y + p.size && mouseY > p.loc.y - p.size 
      && mousePressed)
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
    if (solarScale == true && mouseY < height/2 && mousePressed)
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
}//End glass

void createPlanets()
{
  planets.clear();
  Table table = loadTable("planetInfo.csv","header");
  for(TableRow row: table.rows())
  {
    Planet p = new Planet(row);
    planets.add(p);
  }
}//end createPLanets

void drawPlanets()
{
  for(Planet p: planets)
  {
    p.render();
    p.update();
  }
}//end drawPLanets

Boolean solarMassGraph = false, solarDistGraph = false, solarCycleGraph = false, solarAgeGraph = false; 

void drawSolarGraph()
{
  solarButton1.drawButtons();
  solarButton2.drawButtons();
  solarButton3.drawButtons();
  solarButton4.drawButtons();
  
  if(mouseX > solarButton1.x && mouseX < solarButton1.x + solarButton1.size
     && mouseY > solarButton1.y && mouseY < solarButton1.y + solarButton1.size)
  {
    
    if(mousePressed)
    {
      solarDistGraph = true;
      solarCycleGraph = false;
      solarAgeGraph = false;
      solarMassGraph = false;
    }
  }

  
  if(mouseX > solarButton2.x && mouseX < solarButton2.x + solarButton2.size
     && mouseY > solarButton2.y && mouseY < solarButton2.y + solarButton2.size)
  {
    if(mousePressed)
    {
      solarMassGraph = true;
      solarDistGraph = false;
      solarCycleGraph = false;
      solarAgeGraph = false;
    }
  }
  
  if(mouseX > solarButton3.x  && mouseX < solarButton3.x + solarButton3.size
     && mouseY > solarButton3.y  && mouseY < solarButton3.y + solarButton3.size)
  {
    if(mousePressed)
    {
      solarAgeGraph = true;
      solarDistGraph = false;
      solarCycleGraph = false;
      solarMassGraph = false;
    }
  }
  
  if(mouseX > solarButton4.x && mouseX < solarButton4.x + solarButton4.size
     && mouseY > solarButton4.y && mouseY < solarButton4.y + solarButton4.size)
  {
    if(mousePressed)
    {
      solarCycleGraph = true;
      solarDistGraph = false;
      solarAgeGraph = false;
      solarMassGraph = false;
    }
  }
  
  if(solarMassGraph)
  {
    drawSolarMassGraph();
  }
  else if(solarDistGraph)
  {
    drawSolarDistGraph();
  }
  else if(solarAgeGraph)
  {
    drawSolarAgeGraph();
  }
  else if(solarCycleGraph)
  {
    drawSolarCycleGraph();
  }
} // End Draw Solar Graphs

///
//Different graphs
///

void drawSolarDistGraph()
{
  float x = 50;
  float barW = (width/3)/planets.size();
  
   for(int i = 1; i < planets.size(); i++)
   {
    
    Planet planet;
    planet = planets.get(i);
    fill(planet.c);
    stroke(planet.c);
    ellipse(x, height/2 + 30 - map(planet.loc.z,0, 260*2,0,width/4), planet.size, planet.size);
    if(planet.name != null)
    {
      textSize(20);
      text(planet.name, x+planet.size/5 , height/2 + 50);
    }
    println(planet.mass);
    x += barW;
   }
}//End drawSolarDist

void drawSolarMassGraph()
{
  float x = 50;
  float barW = (width/3)/planets.size();
  
   for(int i = 1; i < planets.size(); i++)
   {
    
    Planet planet;
    planet = planets.get(i);
    fill(planet.c);
    rect(x, height/2 + 30, barW,-map(planet.mass,0, 9830,0,width/4));
    if(planet.name != null)
    {
      textSize(20);
      text(planet.name, x+planet.size/5 , height/2 + 50);
    }
    println(planet.mass);
    x += barW;
   }
}//End drawSolarMassGraph

void drawSolarAgeGraph()
{
  float x = 50;
  float barW = (width/3)/planets.size();
  
   for(int i = 1; i < planets.size(); i++)
   {
    
    Planet planet;
    planet = planets.get(i);
    fill(planet.c);
    rect(x, height/2 + 30, barW,-map(planet.age,0, 10.4,0,width/4));
    if(planet.name != null)
    {
      textSize(20);
      text(planet.name, x+planet.size/5 , height/2 + 50);
    }
    println(planet.mass);
    x += barW;
   }
}//End drawSolarAgeGraph

void drawSolarCycleGraph()
{
   float x = 50;
   float barW = (width/3)/planets.size();
   for(int i = 1; i < planets.size(); i++)
   {
    
    Planet planet;
    planet = planets.get(i);
    fill(planet.c);
    rect(x, height/2 + 30, barW,-map(planet.daycycle,0, 250,0,width/4));
    if(planet.name != null)
    {
      textSize(20);
      text(planet.name, x+planet.size/5 , height/2 + 50);
    }
    println(planet.mass);
    x += barW;
   }
}//End drawSolarCycleGraph
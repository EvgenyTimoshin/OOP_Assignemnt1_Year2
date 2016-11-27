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
  Boolean isSelected = false;
  String image;
  
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
     this.image = row.getString("image");
  }
  
  void render()
  {
    
    float x = width/2 + sin(theta) * loc.z;
    float z = 0 - cos(theta) * loc.z ;
    if(solarScale && name != null)
    {
      fill(255, 0, 0);
      textSize(20);
      text("Click and Hold Here to Zoom out!", loc.x - 160, height/2 - 20);
      fill(255);
      textSize(14);
      text(name, x + size*2, loc.y, z);
    }
    pushMatrix();
    translate(x, loc.y, z);
    rotateX(theta/5);
    rotateY(theta);
    sphereDetail(20);
    stroke(0,120);
    strokeWeight(2);
    fill(c);
    sphere(size);
    popMatrix();
    theta +=speed;
    fill(255);
    
    if(solarScale == false)
    {
      textSize(20);
      text("Click and Hold the Sun", loc.x - 115, loc.y - 100);
    }
  }
  
  void drawPlanetDets()
  {
     float x = width - 100;
     float y = height - loc.z - 100;
     fill(c);
     ellipse(x, y, size, size);
     
     if(mouseX > (x - size) && mouseX < (x + size) && mouseY > (y - size) && mouseY < (y + size))
     {
       PImage p = loadImage(image);
       p.resize(0,300);
       image(p, width - 450, 0 + 150);
       fill(255);
       textSize(30);
       text("Name : " + name, width/2 - 350, 200);
       text("DayCycle : " + daycycle + "  hrs/day", width/2 - 350, 250);
       text("Mass : " + mass + "  Killo Tonnes", width/2 - 350, 300);
       text("Dist from Sun  " + loc.z + "  thousand/km", width/2 - 350, 350);
       text("Desc: " + description, width/2 - 350, 400);
       
     }
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
     void setSelsected(int i) {
   this.isSelected = true;
   println("Got it " + i);
   }

   float getScreenX() {
   float f = screenX(loc.x, loc.y, loc.z);
   return f;
   }
 float getScreenY() {
   float f = screenY(loc.x, loc.y, loc.z);
   return f;
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
} // End Draw Solar Graph
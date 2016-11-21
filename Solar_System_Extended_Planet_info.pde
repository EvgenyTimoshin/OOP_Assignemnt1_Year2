void solarGraphDets()
{
  float x = 50;
  float y = height/2 + 130;
  
  for(Planet p: planets)
  {
    y = y + 50;
    fill(p.c);
    textSize(20);
    if(p.loc.z != 0)
    {
      text(p.name, x, y);
    }
    
    if(p.loc.z != 0)
    {
      if(solarMassGraph)
      {
        text((int)p.mass + "  Kilo Tonnes", x + 100, y);
      }
      if(solarDistGraph)
      {
        text(p.loc.z + "   ThousandKm", x + 100, y);
      }
      if(solarCycleGraph)
      {
        text(p.daycycle + "   Hrs/Day", x + 100, y);
      }
      if(solarAgeGraph)
      {
        text(p.age + "   Billion Yrs", x + 100, y);
      }
    }
  }
}

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
    stroke(planet.c);
    line(x, height/2, x , height/2 - map(planet.age,0,10.4,0,width/4));
    ellipse(x, height/2 -map(planet.age,0, 10.4,0,width/4), planet.size, planet.size);
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
    text(planet.daycycle, x, height/2 + 30 - map(planet.loc.z,0, 260*2,0,width/4));
    if(planet.name != null)
    {
      textSize(20);
      text(planet.name, x+planet.size/5 , height/2 + 50);
    }
    println(planet.mass);
    x += barW;
   }
}//End drawSolarCycleGraph

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

void drawPlanetDets()
{
  for(Planet p: planets)
  {
    p.drawPlanetDets();
  }
}
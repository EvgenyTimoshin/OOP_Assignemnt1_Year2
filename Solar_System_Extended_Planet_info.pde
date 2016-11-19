void solarGraphDets()
{
  float x = 50;
  float y = height/2 + 100;
  
  for(Planet p: planets)
  {
    y = y + 60;
    fill(p.c);
    textSize(20);
    text(p.name, x, y);
  }
}
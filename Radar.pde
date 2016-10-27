class Radar
{
  float radarRadius;
  float rx;
  float ry;
  float size;
  color c;
  float transperacy;
  
  Radar()
  {
    radarRadius = 150;
    rx = width - width/8;
    ry = height/2;
    c = 0;
    transperacy = 0;
  }
}

void createRadar()
{
  float rSize = 2.6;
  
  for(int i = 0; i < 5; i++)
  {
    Radar r = new Radar();
    r.size = rSize;
    circles.add(r);
    rSize -= 0.4;
  }
}

void drawRcircles()
{
  if(frameCount % 120 == 0)
  {
    Radar r = circles.get(0);
    fill(0);
    ellipse(r.rx, r.ry, r.radarRadius * r.size, r.radarRadius * r.size);
  }
  
  for(int i = 0; i < circles.size()-1; i++)
  {
    Radar r = circles.get(i);
    fill(0,0);
    stroke(0, 255, 0, 5);
    ellipse(r.rx, r.ry, r.radarRadius * r.size, r.radarRadius * r.size);
  }
}
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

class Rline extends Radar
{
  float theta;
  
  Rline()
  {
    theta = 0.0f;
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



void drawLines()
{
  for(int i = 0; i < 60; i ++)
  {
    float tempTheta = 0;
    Rline line = new Rline();
    line.theta += tempTheta;
    tempTheta += 0.02;
  }
  
  for(Rline line: lines)
  {
    float x = line.rx + sin(line.theta) * line.radarRadius;
    float y = line.ry - sin(line.theta) * line.radarRadius;
    stroke(0, 255, 0, 255);
    line(line.rx, line.ry, x, y);//draws radar line
    line.theta += 0.02f;
    println(x,y);
  
  }
  
  

}
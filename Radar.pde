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
    radarRadius = width/15;
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
    radarRadius = radarRadius * 1.3;
  }

}

class Coordinates extends Rline
{
  String point;
  
  Coordinates()
  {

    theta = 0.0f;
    point = "";
    radarRadius = radarRadius * 1.2;
  }
}

/////////////////////////////
///Methods
/////////////////////////////

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
  float x = line.rx + sin(line.theta) * line.radarRadius;
  float y = line.ry - cos(line.theta) * line.radarRadius;
  float xOffset = 105;
  
  stroke(0, 255, 0, 40);
  line(line.rx, line.ry, x, y);
  line.theta += 0.015f;
  stroke(0, 255, 0, 5);
  line(line.rx, line.ry + xOffset, line.rx, line.ry + line.radarRadius);
  line(line.rx, line.ry - xOffset, line.rx, line.ry - line.radarRadius);
  line(line.rx + xOffset, line.ry, line.rx + line.radarRadius, line.ry);
  line(line.rx - xOffset, line.ry, line.rx - line.radarRadius, line.ry);
  
  println(line.theta);
}

void drawRadarPoints()
{
  for(Coordinates p: compassPoints)
  {
    float x = p.rx + sin(p.theta) * p.radarRadius;
    float y = p.ry - cos(p.theta) * p.radarRadius;
    
    fill(0, 255, 0);
    text(p.point, x, y);
    println(p.point);
  }
}

void createRadarPoints()
{
  Coordinates point = new Coordinates();
  point.theta = 0.0f;
  //point.x = point.rx;
  //point.y = point.ry - point.radarRadius;
  point.point = "N";
  compassPoints.add(point);
  
  Coordinates point2 = new Coordinates();
  point2.theta = 1.6f;
  //point.x = point.rx + point.radarRadius;
  //point.y = point.ry;
  point2.point = "E";
  compassPoints.add(point2);
  
  Coordinates point3 = new Coordinates();
  point3.theta = 3.15f;
  //point.x = point.rx;
  //point.y = point.ry + point.radarRadius;
  point3.point = "S";
  compassPoints.add(point3);
  
  Coordinates point4 = new Coordinates();
  point4.theta = 4.8f;
  //point.x = point.rx - point.radarRadius;
  //point.y = point.ry;
  point4.point = "W";
  compassPoints.add(point4);
  
}

void setupRadar()
{
  createRadar();
  line = new Rline();
  createRadarPoints();
}

void drawRadar()
{
  drawRcircles();
  drawLines();
  drawRadarPoints();
}
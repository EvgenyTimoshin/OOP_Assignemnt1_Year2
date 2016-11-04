class Radar
{
  float radarRadius;
  float rx;
  float ry;
  color c;
  float transperacy;
  float theta;
  float radarSpeed;
  float fadeSpeed;
  
  Radar()
  {};
  
  Radar(float radarRadius, float rx, float ry,
        color c, float transperacy, float theta, float radarSpeed,
        float fadeSpeed)
  {
    this.radarRadius = width/15;
    this.rx = width - width/8;
    this.ry = height/2;
    this.c = color(0,255,0);
    this.transperacy = 255;
    this.theta = 0.0f;
    this.radarSpeed = 0.01f;
    this.fadeSpeed = 3;
  }
  
  void draw()
  {
    float x = rx + sin(theta) * radarRadius;
    float y = ry - cos(theta) * radarRadius;
    fill(0);
    
    //if(frameCount % 120 != 0)
    {
    stroke(c,transperacy);
    ellipse(rx, ry, radarRadius*2, radarRadius*2);
    ellipse(rx, ry, radarRadius*1.6, radarRadius*1.6);
    ellipse(rx, ry, radarRadius*1.2, radarRadius*1.2);
    }
    
    if(transperacy == 0 || transperacy == 255)
    {
      fadeSpeed = fadeSpeed * -1;
    }
    
    transperacy += fadeSpeed;
    
    line(rx , ry , x, y);
    theta += radarSpeed; 
  }//object draw function
}//end RADAR class


//Radar navigation thing class
class RadarNav extends Radar
{
  
}

//Methods
void setupRadar()
{
  Radar r = new Radar(200, width/2, height/2, (color(0, 255 ,0 )), 255, 0.0f, 0.01f,3);
  radars.add(r);
}

void drawRadar()
{
  for(Radar r: radars)
  {
    r.draw();
  }
}
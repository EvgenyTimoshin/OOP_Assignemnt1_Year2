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
  String text;
  
  Radar()
  {};
  
  Radar(float radarRadius, float rx, float ry,
        color c, float transperacy, float theta, float radarSpeed,
        float fadeSpeed, String text)
  {
    this.radarRadius = radarRadius;
    this.rx = rx;
    this.ry = ry;
    this.c = c;
    this.transperacy = transperacy;
    this.theta = theta;
    this.radarSpeed = radarSpeed;
    this.fadeSpeed = fadeSpeed;
    this.text = text;
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
  
  void drawRadarNavs()
  {
    float x = rx + sin(theta) * radarRadius*1.2;
    float y = ry - cos(theta) * radarRadius*1.2;
    fill(0, 255, 0);
    text(text, x, y);
    
    if(keyPressed && keyCode == RIGHT)
    {
      for(Radar n: radarTexts)
      {
        n.theta += 0.009;
      }
    }
    if(keyPressed && keyCode == LEFT)
    {
      for(Radar n: radarTexts)
      {
        n.theta -= 0.009;
      }
    }
  }
}//end RADAR class

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

//Methods
void setupRadar()
{
  Radar r = new Radar(200, width/2, height/2, (color(0, 255 ,0 )), 255, 0.0f, 0.01f,3,"");
  radars.add(r);
  
  Radar text1 = new Radar(200, width/2, height/2, (color(0, 255, 0)), 255, TWO_PI, 0.01f, 3, "N");
  radarTexts.add(text1);
  Radar text2 = new Radar(200, width/2, height/2, (color(0, 255, 0)), 255, PI, 0.01f, 3, "S");
  radarTexts.add(text2);
  Radar text3 = new Radar(200, width/2, height/2, (color(0, 255, 0)), 255, HALF_PI, 0.01f, 3, "E");
  radarTexts.add(text3);
  Radar text4 = new Radar(200, width/2, height/2, (color(0, 255, 0)), 255, QUARTER_PI*6, 0.01f, 3, "W");
  radarTexts.add(text4);
}

void drawRadar()
{
  for(Radar r: radars)
  {
    r.draw();
  }
  
  for(Radar n: radarTexts)
  {
    n.drawRadarNavs();
  }
}
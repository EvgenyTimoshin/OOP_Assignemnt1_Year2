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
  int trailLength = 50;
  
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
    if(transperacy == 0 || transperacy == 255)
    {
      fadeSpeed = fadeSpeed * -1;
    }
    transperacy += fadeSpeed;
    
    stroke(c,transperacy);
    noFill();
    ellipse(rx, ry, radarRadius*2, radarRadius*2);
    ellipse(rx, ry, radarRadius*1.6, radarRadius*1.6);
    ellipse(rx, ry, radarRadius*1.2, radarRadius*1.2);
    
    float intensityChange = 255.0f / trailLength;
    for(int i = 0 ; i < trailLength ; i ++)
    {   
      float lineTheta = theta - (i * 0.009f);
      stroke(0, 0, 255 - (i * intensityChange), 150 - (i * intensityChange));
      float x = rx + sin(lineTheta) * radarRadius ;
      float y = ry - cos(lineTheta) * radarRadius ;
      line(rx, ry, x, y);
    }
    theta += radarSpeed;
  }//object draw function
  
  void drawRadarNavs()
  {
    float x = rx + sin(theta) * radarRadius*1.2;
    float y = ry - cos(theta) * radarRadius*1.2;
    fill(c);
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
    Radar r = new Radar(200, width/2, height/2, (color(0, 0 ,255 )), 255, 0.0f, 0.01f,3,"");
    radars.add(r);

  
  
  Radar text1 = new Radar(200, width/2, height/2, (color(0, 0, 255)), 255, TWO_PI, 0.01f, 3, "N");
  radarTexts.add(text1);
  Radar text2 = new Radar(200, width/2, height/2, (color(0, 0, 255)), 255, PI, 0.01f, 3, "S");
  radarTexts.add(text2);
  Radar text3 = new Radar(200, width/2, height/2, (color(0, 0, 255)), 255, HALF_PI, 0.01f, 3, "E");
  radarTexts.add(text3);
  Radar text4 = new Radar(200, width/2, height/2, (color(0, 0, 255)), 255, QUARTER_PI*6, 0.01f, 3, "W");
  radarTexts.add(text4);
}

void drawRadar()
{
  for(Radar i: radars)
  {
    i.draw();
  }
  for(Radar n: radarTexts)
  {
    n.drawRadarNavs();
  }
}

void radarChangeColor()
{
  color c = 0;
  if(red == true)
  {
    c = color(255, 0, 0);
  }
  if(blue == true)
  {
    c = color(0, 0, 255);
  }
  if(green == true)
  {
    c = color(0, 255, 0);
  }
  if(someshit == true)
  {
    c = color(random(255), random(255), random(255));
  }
  Radar object = radars.get(0);
  radars.clear();
  object.c = c;
  radars.add(object);
  
}
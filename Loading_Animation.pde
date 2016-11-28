class Loading
{
  float lx,ly;
  float radius;
  float initialRad;
  float size;
  float theta;
  color c;
  float speed;
  
  Loading(float x, float y, float size,float radius, float theta, color c)
  {
    this.lx = x;
    this.ly = y;
    this.size = size;
    this.theta = theta;
    this.c = c;
    this.radius = radius;
    speed = 0.5;
    initialRad = radius;
  }
  
  void drawLoadingFigure()
  {
    float x = lx + sin(theta) * radius;
    float y = ly - cos(theta) * radius;
    
    noStroke();
    ellipse(lx, ly, size/6, size/6);
    stroke(c);
    line(x, y, lx, ly);
    ellipse(x, y, size/10, size/10);
    
    if(radius < 0 || initialRad < radius)
    {
      speed *= -1;
    }
    
    radius+=speed;
    theta+=0.01f;
  }
}
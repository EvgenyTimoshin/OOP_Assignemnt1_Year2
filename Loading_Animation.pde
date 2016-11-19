class Loading
{
  float lx,ly;
  float radius;
  float size;
  float theta;
  color c;
  
  Loading(float x, float y, float size, float theta, color c)
  {
    this.lx = x;
    this.ly = y;
    this.size = size;
    this.theta = theta;
    this.c = c;
  }
  
  void drawLoadingFigure()
  {
    float x = lx + sin(theta) * radius;
    float y = ly - cos(theta) * radius;
    
    fill(c);
    ellipse(lx, ly, size, size);
    ellipse(x, y, size/3, size/3);
    theta += 0.003f;
  }
}
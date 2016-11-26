class Crosshair
{
  float x, y;
  float radius;
  
  Crosshair(){};
  
  Crosshair(float radius)
  {
    this.radius = radius;
  }
  
  void render()
  {
    noFill();
    stroke(radars.get(0).c);
    ellipse(mouseX, mouseY, radius, radius);
  }
}

class MissileAim extends Crosshair
{
  float theta;
  float size;
  float speed;
  
  MissileAim(float radius,float size, float speed)
  {
     this.radius = radius;
     theta = 0;
     this.size = size;
     this.speed = speed;
  }
  
  void render()
  {
    
  }
}

void createCrosshairs()
{
  missileCrosshair = new MissileAim(
}
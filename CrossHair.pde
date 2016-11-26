class Crosshair
{
  float x, y;
  float radius;
  float size;
  color c;
  float lastX, lastY;
  
  Crosshair()
  {}
  
  Crosshair(float radius, float size, color c)
  {
    this.radius = radius;
    this.size = size;
    this.c = c;
    lastX = width/2;
    lastY = height/2 - 200;
  }
  
  void render()
  {
    noFill();
    stroke(c);
    strokeWeight(size);
    if(mouseX < width/2 + 350 && mouseX > width/2 - 350 && mouseY < height/2 - 20 && mouseY > 100 )
    {
      if(mousePressed)
       {
         strokeWeight(8);
         line(mouseX, mouseY , width/3 - 15, height/2 - 5);
         line(mouseX, mouseY , width/3*2 + 15, height/2 - 5);
       }
       
       ellipse(mouseX, mouseY, radius, radius);
       lastX = mouseX;
       lastY = mouseY;
    }
    else
    {
      ellipse(lastX, lastY, radius, radius);
    }
  }
}

class MissileAim extends Crosshair
{
  float theta;
  float size;
  float speed;
  float startAngle;
  float arcLenght;
  
  MissileAim(float radius,float size, float speed, float startAngle,float arcLenght)
  {
     this.radius = radius;
     theta = 0;
     this.size = size;
     this.speed = speed;
     this.startAngle = startAngle;
     this.arcLenght = arcLenght;
     lastX = width/2;
     lastY = height/2 - 200;
  }
  
  void render()
  {
    //float mx = mouseX + sin(theta) * radius;
    //float my = mouseY - cos(theta) * radius;
    noFill();
    stroke(0, 255, 50);
    strokeWeight(size);
    if(mouseX < width/2 + 350 && mouseX > width/2 - 350 && mouseY < height/2 - 20 && mouseY > 100 )
    {
      noCursor();
      arc(mouseX, mouseY, radius , radius, startAngle, startAngle + arcLenght);
      lastX = mouseX;
      lastY = mouseY;
    }
    else
    {
      cursor();
      arc(lastX, lastY, radius , radius, startAngle, startAngle + arcLenght);
    }
    startAngle += speed;
  }
}

void createCrosshairs()
{
    missileCross.add(new MissileAim(80*1.5, 2, 0.1f, HALF_PI, 3));
    missileCross.add(new MissileAim(100*1.5, 3, 0.005f, PI, 2));
    missileCross.add(new MissileAim(20*1.5, 6, 0.04f, PI, PI*2));
    missileCross.add(new MissileAim(40*1.5, 4, 0.04f, QUARTER_PI, PI));
    
    shipDrill = new Crosshair(20,20,color(0, 255, 255));
}

void drawCrosshairs()
{
  if(missiles)
  {
    for(MissileAim m : missileCross)
    {
      m.render();
    }
  }
  
  if(guns)
  {
   shipGun.render();
  }
  
  if(drill)
  {
    shipDrill.render();
  }
  
  if(HDrive)
  {
    //HDrive.render();
  }
}
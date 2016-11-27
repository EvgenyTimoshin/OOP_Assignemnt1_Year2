class Crosshair
{
  float x, y;
  float radius;
  float size;
  color c;
  float lastX, lastY;
  float ammo = 200;
  
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
    fill(255);
    text("Ammo :  " + (int)ammo, width/2 - 450, height/2 + 100); // displays the ammo on the screen
    noFill();
    
    if(mouseX < width/2 + 350 && mouseX > width/2 - 350 && mouseY < height/2 - 20 && mouseY > 100 ) // Checks if the mouse is in the right location for crosshari to follow
    {
      if(mousePressed && size > 10 && ammo > 0)
       {
         strokeWeight(8);
         line(mouseX, mouseY , width/3 - 15, height/2 - 5);
         line(mouseX, mouseY , width/3*2 + 15, height/2 - 5);
         ammo-=1;
       }
       
       if(keyPressed && key == ' ' && size < 10 && ammo > 0) //same as above except for gun only
       {
         strokeWeight(8);
         point(mouseX, mouseY);
         ammo-=1;
       }
       
       ellipse(mouseX, mouseY, radius, radius);
       lastX = mouseX;
       lastY = mouseY;
    }
    else if(ammo <= 200) //if mouse is off the location ammo reffils and the crosshair is drawn in last mouse position
    {
      ellipse(lastX, lastY, radius, radius);
      ammo+=.1;
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
    
    if(mouseX < width/2 + 350 && mouseX > width/2 - 350 && mouseY < height/2 - 20 && mouseY > 100 ) // Same function as its SUPER class
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
    shipGun = new Crosshair(40, 3, color(255, 0, 0));
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
}
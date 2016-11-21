class Ship
{
  PVector pos;
  float rotAngle;
  float rotYangle;
  
  Ship(float x, float y)
  {
    pos = new PVector(x, y);
    rotAngle = 0;
    rotYangle = 0;
  }
  
  void draw()
  {
      pushMatrix();
    translate(300, height/2 + 130, + 120);
    stroke(radars.get(0).c);
    rotateX(rotAngle);
    rotateY(rotYangle);
    if(keyPressed && keyCode == UP)
    {
      rotAngle+=0.01; 
    }
    if(keyPressed && keyCode == DOWN)
    {
      rotAngle-=0.01;
    }
    if(keyPressed && keyCode == LEFT)
    {
      rotYangle-= 0.01;
    }
    if(keyPressed && keyCode == RIGHT)
    {
      rotYangle+= 0.01;
    }
    //rotateX(PI/2);
    //rotateZ(-PI/6);
    noFill();
  
    beginShape();
    vertex(-60, -60, -60);
    vertex( 60, -60, -60);
    vertex(   0,    0,  60);
  
    vertex( 60, -60, -60);
    vertex( 60,  60, -60);
    vertex(   0,    0,  60);
  
    vertex( 60, 60, -60);
    vertex(-60, 60, -60);
    vertex(   0,   0,  60);
  
    vertex(-60,  60, -60);
    vertex(-60, -60, -60);
    vertex(   0,    0,  60);
    endShape();
    popMatrix();
  }
  
}
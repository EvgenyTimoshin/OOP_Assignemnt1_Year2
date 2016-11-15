void drawInterior()
{
  PShape s;
  
  pushMatrix();
  translate(0, 0 , -2);
   Radar r =  radars.get(0);
    s = createShape();
    s.beginShape();
    //s.noFill();
    s.stroke(0);
    
    s.texture(image);
    s.vertex(width/2 - width/4, 0 + height/15,850,0);
    s.vertex(width/2 + width/4, 0 + height/15, 1700, 0);
    s.vertex(width/2 + width/5.8, 0 + height/2, 1680, 800);
    s.vertex(width/2 - width/5.8, 0 + height/2,870, 800);
    s.endShape(CLOSE);
    shape(s);
    ////////////////////////////////////////////
    s = createShape();
    s.beginShape();
    
    s.texture(image);
    s.stroke(0);
    
    s.vertex(width/2 + width/3.7, 0 + height/14.9, 1750, 0);
    s.vertex(width/2 + width/5.2, 0 + height/2, 1730, 800);
    s.vertex(width, height/1.3, 2560,1600);
    s.vertex(width, height/3.5, 2560,600);
    s.endShape(CLOSE);
    shape(s);
    ////////////////////////////////////////////
    s = createShape();
    s.beginShape();
    s.stroke(0);
    s.texture(image);
    
    s.vertex(width/2 - width/3.7, 0 + height/14.9, 800, 0 );
    s.vertex(width/2 - width/5.2, 0 + height/2, 850 , 800);
    s.vertex(1, height/1.3, 0, 1600);
    s.vertex(1, height/3.5, 0, 600);
    s.endShape(CLOSE);
    shape(s);
    popMatrix();
    
    
}

float xL;
float xR;

void uiOutline()
{
  Radar r = radars.get(0);
  pushMatrix();
  translate(0, 0 , +1);
  stroke(r.c);
  strokeWeight(8);
  
  line(xL, 0 + height/40, width/2 , 0 + height/40);
  line(xR, 0 + height/40, width/2 , 0 + height/40);
  
  if(stopX == false)
  {
    xL -= 5;
    xR += 5;
  }
  
  if(xR > width/2 + width/10)
  {
    stopX = true;
  }
  endShape();
  popMatrix();
  strokeWeight(1);
  if(xL <= 0)
  {
    gameState = 1;
  }
}

void setupUi()
{
  xL = width/2;
  xR = width/2;
}  
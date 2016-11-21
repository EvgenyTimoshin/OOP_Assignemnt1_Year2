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

float xL, xR, xLy, xRy;
PVector Rline;
PVector Lline;

void uiOutline()
{
  float ypos = height/40;
  Radar r = radars.get(0);
  pushMatrix();
  translate(0, 0 , +1);
  stroke(r.c,70);
  strokeWeight(5);
  
  noFill();
  arc(width/2, height/40, 800, 150, radians(0), HALF_PI, OPEN);
  arc(width/2, height/40, -800, 150, radians(0), HALF_PI, OPEN);
  line(xL, height/40, width/2 - 398 , height/40);
  line(xR, height/40, width/2 + 398, height/40);
  line(xL , xLy, xL, height/40);
  line(xR , xRy, xR, height/40);
  
  
  if(stopX == false)
  {
    xL -= 5;
    xR += 5;
    Rline.x = xR;
    Lline.x = xL;
    
  }
  
  if(xR > width - 80 && xLy < height/4)
  {
    xLy +=5;
    xRy +=5;
    Lline.y = xLy;
    Rline.y = xRy;
  }
  
  if(xRy >= height/4 && Rline.x >= r.rx)
  {
    Rline.add(-1, 1);
    Lline.add(1, 1);
    line(xR, xRy, Rline.x, Rline.y);
    line(xL, xLy, Lline.x, Lline.y);
  }
  if(stopX == true && Rline.y > height/4 + 130)
  {
    line(xR, xRy, Rline.x, Rline.y);
    line(xL, xLy, Lline.x, Lline.y);
    line(Rline.x, Rline.y, xR, xRy);
    
    line(Rline.x, Rline.y, Rline.x, r.ry - r.radarRadius * 1.4);
    line(Lline.x, Lline.y, Lline.x, r.ry - r.radarRadius * 1.4);
    
    rect(r.rx -r.radarRadius * 1.4, r.ry - r.radarRadius * 1.4, r.radarRadius * 2.8, r.radarRadius * 2.8);
    rect(40, r.ry - r.radarRadius * 1.4, r.radarRadius * 2.8, r.radarRadius * 2.8);
    
  }
  
  if(xR > width - 80)
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
  Rline = new PVector();
  Lline = new PVector();
  xR = width/2 + 400;
  xL = width/2 - 400;
  xLy = height/40;
  xRy = height/40;
}  
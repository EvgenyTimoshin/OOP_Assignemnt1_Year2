void drawInterior()
{
  PShape s;
  
  pushMatrix();
  translate(0, 0 , -2);
   Radar r =  radars.get(0);
    s = createShape();
    s.beginShape();
    //s.noFill();
    s.stroke(255);
    
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
    s.stroke(255);
    
    s.vertex(width/2 + width/3.7, 0 + height/14.9, 1750, 0);
    s.vertex(width/2 + width/5.2, 0 + height/2, 1730, 800);
    s.vertex(width, height/1.3, 2560,1600);
    s.vertex(width, height/3.5, 2560,600);
    s.endShape(CLOSE);
    shape(s);
    ////////////////////////////////////////////
    s = createShape();
    s.beginShape();
    s.stroke(255);
    s.texture(image);
    
    s.vertex(width/2 - width/3.7, 0 + height/14.9, 800, 0 );
    s.vertex(width/2 - width/5.2, 0 + height/2, 850 , 800);
    s.vertex(1, height/1.3, 0, 1600);
    s.vertex(1, height/3.5, 0, 600);
    s.endShape(CLOSE);
    shape(s);
    popMatrix();
    
    
}

void uiOutline()
{
  pushMatrix();
  translate(0,0,+2);
  strokeWeight(20);
  popMatrix();
}
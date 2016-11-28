class soundVisualiser
{
  PVector pos;
  float theta = 0.0f;
  float radius;
  float size = 250;
  
  soundVisualiser(float x, float y, float radius)
  {
    pos = new PVector(x, y);
    this.radius = radius;
  }
  
  void render()
  {
    fill(radars.get(0).c);
    //strokeWeight(3);
    
    if(moveSoundVis == false)
    {
      stroke(radars.get(0).c);
    }
    for (int i = 0; i < sound.bufferSize() - 1; i++)
    {
   
      float x1 = pos.x + sin(theta) * radius;
      float y1 = pos.y - cos(theta) * radius;
      
      point(x1 - sound.mix.get(i)*size , y1);
      theta += 0.003f;
     }
  }
  
  void update()
  {
    if(mouseX < pos.x + radius && mouseX > pos.x - radius && mouseY < pos.y + radius && mouseY > pos.y - radius && mousePressed)
    {
      moveSoundVis = true;
    }
    
    if(moveSoundVis)
    {
      if(keyPressed && key == ' ')
      {
        strokeWeight(random(1,35));
      }
      stroke(color(map(mouseY,0,255,0,height), 0, map(mouseX,0,255,0,width)));
      size = map(mouseX,100,1000,0,width);
      radius = map(mouseY,0,height,0,500);
      if(pos.x < width/2 && pos.y > height/2)
      {
        pos.add(5.37, -3);
        radius++;
      }else if(mousePressed)
      {
        moveSoundVis = false;
      }
    }
    else
    {
      if(pos.x > 200 && pos.y < height - 100)
      {
        pos.sub(5.37, -3);
        radius--;
      }
      size = 250;
      radius = 80;
      strokeWeight(3);
    }
  }
}

void createSoundVisualiser()
{
   v = new soundVisualiser(200, height - 100, 80);
}

void drawSoundVisualiser()
{
  v.update();
  v.render();
}
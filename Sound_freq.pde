
float theta = 0.0f;
float radius = 200;
float lastX, lastY;
void drawSound()
{
  stroke(radars.get(0).c);
  strokeWeight(4);
  
  while(theta < 6.28)
  {
  // use the mix buffer to draw the waveforms.
  for (int i = 0; i < sound.bufferSize() - 1; i++)
  {
    /*
    float x1 = map(i, 0, kick.bufferSize(), 0, width);
    float x2 = map(i+1, 0, kick.bufferSize(), 0, width);
    
    line(x1, 50 - kick.mix.get(i)*50, x2, 50 - kick.mix.get(i+1)*50);
    line(x1, 150 - snare.mix.get(i)*50, x2, 150 - snare.mix.get(i+1)*50);
    */
    ////////////////////////////////////////////////////////////////////////
    
    float x1 = 200 + sin(theta) * 80;
    float y1 = height - 100 - cos(theta) * 80;
    
    
    
    point(x1 - sound.mix.get(i)*400 , y1);
    //line(x1 - sound.mix.get(i)*200 , y1, lastX, lastY);
    theta += 0.8f;
    lastX = x1- sound.mix.get(i)*100;
    lastY = y1;
  }
  }
  theta = 0.0f;
}
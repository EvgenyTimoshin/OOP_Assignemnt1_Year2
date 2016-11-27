void engineOn()
{
  for (Loading l : systemLoading)
  {
    l.drawLoadingFigure();
  }

  if (dials.get(1).endangle <= 6.47)
  {
    dials.get(1).endangle += .017;
  }

  if (dials.get(2).endangle <= 4.5)
  {
    dials.get(2).endangle += .012;
  }

  if (bar3.y > bar3.initialY - 255)
  {
    bar3.y-= 0.87;
    fill(255, 0, 0);
    textSize(30);


    text("Loading Systems", width/2 - 122, height/2 + 100);
  } else
  {
    engineTurnedOn = true;
    engineOn = false;
  }
}

void easterEgg()
{

  pushMatrix();
  translate(0, 0, +30);
  PShape s;
  
  sassySound.play();

  s = createShape();
  s.beginShape();
  s.texture(sassy);
  s.vertex(0, 0, 0, 0);
  s.vertex(width, 0, 1024, 0);
  s.vertex(width, height, 1024, 576);
  s.vertex(0, height, 0, 567);

  s.endShape(CLOSE);
  shape(s);
  popMatrix();
  easterEggCounter -=  0.05;
  if(easterEggCounter < 0)
  {
    EasterEgg = false;
  }
}

void buttonControl()
{
  if (mouseX > frontDispB1.x && mouseX < frontDispB1.x + frontDispB1.size
    && mouseY > frontDispB1.y && mouseY < frontDispB1.y + frontDispB1.size && mousePressed)
  {
    engineOn = true;
    missiles = false;
    guns = false;
    drill = false;
    HDrive = false;
  }
  if (mouseX > frontDispB2.x && mouseX < frontDispB2.x + frontDispB2.size
    && mouseY > frontDispB2.y && mouseY < frontDispB2.y + frontDispB2.size && mousePressed)
  {
    missiles = true;
    guns = false;
    drill = false;
    HDrive = false;
  }
  if (mouseX > frontDispB3.x && mouseX < frontDispB3.x + frontDispB3.size
    && mouseY > frontDispB3.y && mouseY < frontDispB3.y + frontDispB3.size && mousePressed)
  {
    missiles = false;
    guns = true;
    drill = false;
    HDrive = false;
  }
  if (mouseX > frontDispB4.x && mouseX < frontDispB4.x + frontDispB4.size
    && mouseY > frontDispB4.y && mouseY < frontDispB4.y + frontDispB4.size && mousePressed)
  {
    missiles = false;
    guns = false;
    drill = true;
    HDrive = false;
  }
  if (mouseX > frontDispB5.x && mouseX < frontDispB5.x + frontDispB5.size
    && mouseY > frontDispB5.y && mouseY < frontDispB5.y + frontDispB5.size && mousePressed)
  {
    missiles = false;
    guns = false;
    drill = false;
    HDrive = true;
  }
  if (mouseX > frontDispB6.x && mouseX < frontDispB6.x + frontDispB6.size
    && mouseY > frontDispB6.y && mouseY < frontDispB6.y + frontDispB6.size && mousePressed)
  {
    missiles = false;
    guns = false;
    drill = false;
    HDrive = false;
    EasterEgg = true;
  }

  if (engineOn)
  {
    engineOn();
    runUi = true;
  }
}

//ArrayList<IButton> buttons_ = new ArrayList<>();

class BareButton {
  PVector pos;
}

interface IButton {
  void onClick();
}

class Button_ extends BareButton implements IButton {
  Button_() {
  }

  void onClick() {
  }
}

//setup
//buttons_.add(new Button_())`
//buttons_.get(0).onClick();
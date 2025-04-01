int appstate = 1;

void setup()
{
  size(1420,880);
  background(255);
}

void draw()
{
  if (appstate == 1)
    {
      background(255);
      textSize(30);
      fill(0);
      text ("Main menu", 100, 100);
    }
  if (appstate == 2)
    {
      background(255);
      textSize(30);
      fill(0);
      text ("Overkrop", 100, 100);
  
    }
if (appstate == 3)
  {
    background(255);
    textSize(30);
    fill(0);
    text ("Underkrop", 100, 100);
  }
}

void keyPressed()
{
  if (keyCode == UP)
  {
  appstate = 2;
  }
  if (keyCode == DOWN)
  {
  appstate = 3;
  }
  if (keyCode == ' ')
  appstate = 1;
}


  

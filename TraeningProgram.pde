int appstate = 0; // MENU NAVIGATION
int blinkInterval = 450;
int sidsteTid = 0;
boolean synlig = false;

PImage logo; // Definerer billedevariabel

// Underkrop
PImage squat1;
PImage squat2;
int xsquat = 0;
int ysquat = 0;
//boolean skabBevægelse = true;
int skabBevægelse = 0;
int squatFrame = 0;
int sidsteSkiftTid = 0;
int skiftInterval = 500;

// logo
int xlogo = 0;
int ylogo = 0;

// Main menu knap
int mainMenuKnapX = 150;
int mainMenuKnapY = 150;
int mainMenuKnapW = 100; 
int mainMenuKnapB = 50;


void setup()
{
  size(1420,880);
  background(255);
  logo = loadImage ("logo.png"); // Vælger logo til tom variabel 
  squat1 = loadImage ("squat1.jpg");
  squat2 = loadImage ("squat2.jpg");
}

void draw()
{
  int nutid = millis();
  int xlogo = width - logo.width;
  int xsquat = width / 3 * 2;
  int ysquat = height / 2;
  
    if (appstate == 0) // VELKOMMEN MENU
    {
      background(0);
      
      image (logo, xlogo, ylogo);
      textSize(40);
      fill(255);
      textAlign(CENTER, CENTER);
      text ("Velkommen til ProcessingPump", width/2, 300);
      
      textSize(30);
      text ("Din digitale træningsmakker", width/2, 350);
      
      if (nutid - sidsteTid > blinkInterval)
      {
        sidsteTid = nutid;
        synlig = !synlig; // ! skifter boolean om fra true til false, og omvendt
      }
      
      if (synlig)
      {
        int farveVelkommen = (nutid / 100) % 255; // Milli bliver til CENT %255 sikrer at der skabes et interval
        fill (farveVelkommen, 255 - farveVelkommen, farveVelkommen * 2);
        textSize (20);
        text ("TRYK MELLEMRUM FOR AT FORTSÆTTE", width/2, 700);
      }
    }
 
 
 
  if (appstate == 1) // MAIN MENU
    {
      background(0);
      textSize(30);
      fill(255);
      text ("Main menu", 100, 100);
    }
 
  
  
  if (appstate == 2) // OVERKROP
    {
      background(255);
      textSize(30);
      fill(0);
      text ("Overkrop", 100, 100);
  
    }
if (appstate == 3) // UNDERKROP
  {
    background(0);
    textSize(40);
    fill(255);
    text ("Underkrop", width / 2, 100);
    textSize(30);
    text ("Idag skal du træne ben", width / 2, 150);
    text ("Squat", width / 3, height / 2);
    
    if (skabBevægelse == 1)
    {
     if (millis() - sidsteSkiftTid > skiftInterval) // Denne condition beskriver hvorvidt at squatFrame 1 eller 2 skal vises, afhængig af om der er gået mere end 3 sekunder.
     {
       squatFrame = (squatFrame + 1) % 2;
       sidsteSkiftTid = millis();
     }
     if (squatFrame == 0)
     {
       image(squat1, xsquat, ysquat);
     } else
     {
       image(squat2, xsquat, ysquat);
     }
    }
  }
}


void keyPressed() // NAVIGERING
{
  if (keyCode == UP)  appstate = 2;
  if (keyCode == DOWN)  appstate = 3;
  if (key == ' ')  appstate = 1;
  if (key == 'n' || key == 'N') {
    skabBevægelse = 1;
    sidsteSkiftTid = millis();
  }
}

  

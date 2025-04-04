int appstate = 0; // MENU NAVIGATION
int blinkInterval = 450;
int sidsteTid = 0;
boolean synlig = true;
PImage logo; // Definerer billedevariabel
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
}

void draw()
{
  int nutid = millis();
  int xlogo = width - logo.width;
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
      background(255);
      textSize(30);
      fill(0);
      text ("Main menu", 100, 100);
      
      fill(255,0,0);
      rect(mainMenuKnapX, mainMenuKnapY, mainMenuKnapW, mainMenuKnapB);
      fill(0);
      textAlign(CENTER,CENTER);
      textSize(16);
      text("Hovedmenu", mainMenuKnapX + mainMenuKnapW / 2, mainMenuKnapY + mainMenuKnapB / 2);   //text "hovedmenu" på knappen
        
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
    background(255);
    textSize(30);
    fill(0);
    text ("Underkrop", 100, 100);
  }
}


void keyPressed() // NAVIGERING
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
  if (keyCode == ' ')
  appstate = 1;
}

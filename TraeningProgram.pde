// appstate
// Appstate er en integer funktion som fungerer som en condition der tjekker hvilken
// side på menuen man befinder sig på. Her er 0 = startmenu, 1 = hovedmenu, 2 = underkrop, 3 = overkrop
int appstate = 0;

//Blinketekst
// De 2 første variabler deklareres for at gøre klar til et tidsdefineret interval.
// Variablen synlig er til for at bestemme om teksten vises eller ej
int blinkInterval = 450; 
int sidsteTid = 0; 
boolean synlig = true;

// Animationsstart
//Disse variabler fungerer som binære conditions for start af animationen
int skabBevægelseSquat = 0;
int skabBevægelseArmbøj = 0;

// Animation - squat og armbøjning (og logo)
// Først skaber vi 5 tomme billedvariable som kan indeholde billedværdi
PImage squat1, squat2, armbøj1, armbøj2, logo, hakketmakker;

// Derefter deklarerer vi koordinatorne for animationerne
int xanimation = 1000;
int yanimation = 400;

// Så variabler bruges definere squat animationens intervaller og placering
int squatFrame = 0;
int sidsteSkiftTidSquat = 0;
int nedtællingStartTidSquat = 0;

// Disse variabler bruges til at definere armbøjnings animationens intervaller og placering
int armbøjFrame = 0;
int sidsteSkiftTidArmbøj = 0;
int nedtællingStartTidArmbøj = 0;

// skiftInterval definere intervallet mellem billederne i animationen
int skiftInterval = 500;

// Dernæst skaber vi et vindue og deklarerer alle vores billedevariabler med navnene på billederne
void setup()
{
  size(1420,880);
  logo = loadImage("logo.png");
  squat1 = loadImage("squat1.jpg");
  squat2 = loadImage("squat2.jpg");
  armbøj1 = loadImage("Armbøjning1.png");
  armbøj2 = loadImage("Armbøjning2.png");
  hakketmakker = loadImage("hakketmakker.jpg");
 }
 
// Så definerer vi en tegnefunktion som skal skabe menuen 
void draw()
{
  
// Før de conditions som definerer diverse funktioner i Draw, så definerer vi en række variabler. 
// Dette sker inde i draw funktionen, da de først deklareres i funktioner som forekommer senere i koden.

// Disse variabler er tid og placeringer for tekst
  int nutid = millis();
  int midtForX = width / 2;
  int titelY = 100;
  int undertitelY = 150;
  int blinkendeY = 700;
  
// Dernæst definerer vi baggrund og logoet som faste dele af draw funktionen.
  background(0);
  image(logo, width - logo.width, 0);

// Her starter vores første condition som er en velkomstmenu.
// Menuen genkalder brødTekst 2 gange, og visBlinkendeTekst 1 gang
  if (appstate == 0)
  {
    brødTekst("Velkommen til ProcessingPump", 40, midtForX, titelY);
    brødTekst("Din digitale træningsmakker", 30, midtForX, undertitelY);
    visBlinkendeTekst("TRYK MELLEMRUM FOR AT FORTSÆTTE", midtForX, blinkendeY, nutid);
  }

// Her defineres, at hvis appstate er alt andet end på 0 (velkomstmenu), så kommer et funktionskald på menuKnap som køres 3 gange
  else
  {
  menuKnap(0, 580, 200, 100, "Hovedmenu");
  menuKnap(0, 680, 200, 100, "Underkrop");
  menuKnap(0, 780, 200, 100, "Overkrop");
  }
  
// Her starter vores anden condition som er hovedmenuen
  if (appstate == 1)
  {
    brødTekst("Hovedmenu", 30, midtForX, titelY);
    brødTekst("Klik på knapperne nedenfor for at vælge din øvelse!", 20, midtForX, undertitelY);
    imageMode(CENTER);
    image(hakketmakker, midtForX, height/2);
  }
  
  if (appstate == 2)
  {
    brødTekst("Overkrop", 30, midtForX, titelY);
    brødTekst("Idag skal du træne arme", 20, midtForX, undertitelY);
    visBlinkendeTekst("TRYK MELLEMRUM FOR AT FORTSÆTTE", midtForX, blinkendeY, nutid);
    if (skabBevægelseArmbøj == 1) 
    {
      visAnimation(true, nedtællingStartTidArmbøj, sidsteSkiftTidArmbøj, skiftInterval,
               armbøjFrame, armbøj1, armbøj2, xanimation, yanimation, "armbøj", skabBevægelseArmbøj);
    }
  }
  
  if (appstate == 3)
  {
    brødTekst("Underkrop", 30, midtForX, titelY);
    brødTekst("Idag skal du træne ben", 20, midtForX, undertitelY);
    visBlinkendeTekst("TRYK MELLEMRUM FOR AT FORTSÆTTE", midtForX, blinkendeY, nutid);
  }
  if (skabBevægelseSquat == 1) 
  {
  visAnimation(true, nedtællingStartTidSquat, sidsteSkiftTidSquat, skiftInterval,
               squatFrame, squat1, squat2, xanimation, yanimation, "squat", skabBevægelseSquat);
  }
}

void brødTekst(String label, int størrelseTekst, int tekstX, int tekstY)
{
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(størrelseTekst);
  text(label, tekstX, tekstY);
}
  
void visBlinkendeTekst(String tekst, int blinkeX, int blinkeY, int nutid) 
{
  if (skabBevægelseSquat == 0 && skabBevægelseArmbøj == 0)
  {
  if (nutid - sidsteTid > blinkInterval) {
    sidsteTid = nutid;
    synlig = !synlig;
  }

  if (synlig) {
    int farve = (nutid / 100) % 255;
    fill(farve, 255 - farve, farve * 2);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(tekst, blinkeX, blinkeY);
  }
  }
}
  
void menuKnap(int menuX, int menuY, int menuW, int menuH, String label)
{
  fill(255, 0, 0);
  rect(menuX, menuY, menuW, menuH);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text(label, menuX + menuW / 2, menuY + menuH / 2);
}

void mousePressed()
{
if (mouseOver(0, 580, 200, 100)) appstate = 1;
if (mouseOver(0, 680, 200, 100)) appstate = 3;
if (mouseOver(0, 780, 200, 100)) appstate = 2;
}

boolean mouseOver(int menuX, int menuY, int menuW, int menuH) 
{
  return mouseX > menuX && mouseX < menuX + menuW &&
         mouseY > menuY && mouseY < menuY + menuH;
}

void keyPressed() {
  if (key == ' ' && appstate == 2) {
    skabBevægelseArmbøj = 1;
    nedtællingStartTidArmbøj = millis();
    sidsteSkiftTidArmbøj = millis();
  }
  
  if (key == ' ' && appstate == 3) {
    skabBevægelseSquat = 1;
    nedtællingStartTidSquat = millis();
    sidsteSkiftTidSquat = millis();
  }

  if (key == ' ' && appstate == 0) {
    appstate = 1;
  }
}

void visAnimation(boolean aktiv, int startTid, int skiftTid, int skiftInterval,
                  int frame, PImage img1, PImage img2, int x, int y, String label,
                  int animationVar) 
{

  fill(255);
  textSize(30);
  int resterendeTid = 10 - (millis() - startTid) / 1000;
  if (resterendeTid < 0) resterendeTid = 0;
  text("Tid: " + resterendeTid + " sek", width / 2, height / 2);

  if (millis() - skiftTid > skiftInterval) {
    if (label.equals("squat")) {
      squatFrame = (squatFrame + 1) % 2;
      sidsteSkiftTidSquat = millis();
    } else if (label.equals("armbøj")) {
      armbøjFrame = (armbøjFrame + 1) % 2;
      sidsteSkiftTidArmbøj = millis();
    }
  }

  int visFrame = label.equals("squat") ? squatFrame : armbøjFrame;
  if (visFrame == 0) {
    image(img1, x, y);
  } else {
    image(img2, x, y);
  }

  if ((millis() - startTid) > 10000) {
    if (label.equals("squat")) {
      skabBevægelseSquat = 0;
    } else if (label.equals("armbøj")) {
      skabBevægelseArmbøj = 0;
    }
  }
}

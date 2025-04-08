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

// Disse variabler er tid og x & y placeringer der genbruges
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

// Her defineres, at hvis appstate er alt andet end på 0 (velkomstmenu)
// Det betyder der konstant er et funktionskald på menuKnap som køres 3 gange på de øvrige appstates
  else
  {
  menuKnap(0, 580, 200, 100, "Hovedmenu");
  menuKnap(0, 680, 200, 100, "Underkrop");
  menuKnap(0, 780, 200, 100, "Overkrop");
  }
  
// Her starter vores anden condition som er hovedmenuen
// Hovedmenuen laver funktionskald på brødTekst for at skrive indhold, samt præsenterer et billede
  if (appstate == 1)
  {
    brødTekst("Hovedmenu", 30, midtForX, titelY);
    brødTekst("Klik på knapperne nedenfor for at vælge din øvelse!", 20, midtForX, undertitelY);
    image(hakketmakker, midtForX, height/2);
  }
  
// Her starter vores tredje condition som er Overkrop
// Overkrop laver funktionskald på brødTekst og visBlinkendeTekst
  if (appstate == 2)
  {
    brødTekst("Overkrop", 30, midtForX, titelY);
    brødTekst("Idag skal du træne arme", 20, midtForX, undertitelY);
    visBlinkendeTekst("TRYK MELLEMRUM FOR AT FORTSÆTTE", midtForX, blinkendeY, nutid);

// Hvis brugeren klikker på mellemrum, så sker der et funktionskald på visAnimation  
    if (skabBevægelseArmbøj == 1) 
    {
      visAnimation(nedtællingStartTidArmbøj, sidsteSkiftTidArmbøj, skiftInterval,
               armbøj1, armbøj2, xanimation, yanimation, "armbøj");
    }
   }

  
// Her starter vores fjerde condition som er Underkrop
// Underkrop udfører de samme funktionskald som overkrop udover tekstindholdet og billederne er anderledes.
  if (appstate == 3)
  {
    brødTekst("Underkrop", 30, midtForX, titelY);
    brødTekst("Idag skal du træne ben", 20, midtForX, undertitelY);
    visBlinkendeTekst("TRYK MELLEMRUM FOR AT FORTSÆTTE", midtForX, blinkendeY, nutid);
  {
    if (skabBevægelseSquat == 1) 
{
  visAnimation(nedtællingStartTidSquat, sidsteSkiftTidSquat, skiftInterval,
               squat1, squat2, xanimation, yanimation, "squat");
}
}
  }
}
// Funktionen brødTekst skal ved funktionskald definere (tekst, størrelse på tekst, x placering og y placering)
// Den indeholder dernæst farve og center-alignment som faste definitioner i variablen
void brødTekst(String label, int størrelseTekst, int tekstX, int tekstY)
{
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(størrelseTekst);
  text(label, tekstX, tekstY);
}

// Funktionen visBlinkendeTekst skal ved funktionskald definere (tekst,  x placering, y placing og nutid = tid siden programstart)
// Den indeholder dernæst en funktion som får teksten til at skifte farve og blinke
void visBlinkendeTekst(String tekst, int blinkeX, int blinkeY, int nutid) 
{
  
// Den første condition forklarer, at teksten kun skal vises hvis animationen ikke er igang
  if (skabBevægelseSquat == 0 && skabBevægelseArmbøj == 0)
  {

// Hvis animationen er slukket, så tjekker den næste condition om (tid siden programstart - tid efter condition er opfyldt > mindre end et interval på 0,45 sekunder)
// Når tiden så bliver større end 0,45, resetter den sin timer og ændrer 'synlig' til enten false eller true afhænger af dens nuværende condition
  if (nutid - sidsteTid > blinkInterval) 
  {
    sidsteTid = nutid;
    synlig = !synlig;
  }

// Hvis synlig == true så ekseverer denne condition
// Variablen 'farve' bliver en modulus operator, som sørger for at millisekunder bliver gjort op i sekunder og dernæst holdt indenfor et interval på 255 som passer til RGB
// Dernæst bliver testfarven, skiftende med 'farve' som udgangspunkt for forskellige udregninger i hhv. R, G og B
  if (synlig) 
  {
    int farve = (nutid / 100) % 255;
    fill(farve, 255 - farve, farve * 2);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(tekst, blinkeX, blinkeY);
  }
  }
}

// Funktionen menuKnap skal ved funktionskald definere en rectangel med tekst (x placering af rect,  y placering af rect, bredde af rect, højde af rect, tekst i rect)
// Den indeholder dernæst en funktion som farver rect rød, sørger for teksten er indei rect og center-aligned, tekststørrelse og tekstfarve.
void menuKnap(int menuX, int menuY, int menuW, int menuH, String label)
{
  fill(255, 0, 0);
  rect(menuX, menuY, menuW, menuH);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text(label, menuX + menuW / 2, menuY + menuH / 2);
}

// Denne funktion definerer hvorvidt mouseOver er true eller false, afhængig af, om musens koordinator er indenfor rect koordinator
// Når musens x koordinat er større end menuknappens x koordinat, og
// Når musens x koordinat er mindre end menuknappens x koordinat + bredden af rect, og
// Når musens y koordinat er større end menuknappens y koordinat, og
// Når musens y koordinat er større end menuknappens y koordinat + højden af rect
// Når disse conditions er opfyldt, så returner funktionen mouseOver som true
boolean mouseOver(int menuX, int menuY, int menuW, int menuH) 
{
  return mouseX > menuX && mouseX < menuX + menuW &&
         mouseY > menuY && mouseY < menuY + menuH;
}

// Funktionen mousePressed kører når der bliver klikket på musseknappen
// Ved denne funktion, så hvis appstate ikke er på startmenu, så defineres appstate til -
// De andre menuer når musen er over knappen, og dernæst defineres de specifikke knappers koordinator til de respektive appstates
void mousePressed()
{
  if (appstate > 0)
  {
   if (mouseOver(0, 580, 200, 100)) appstate = 1;
   if (mouseOver(0, 680, 200, 100)) appstate = 3;
   if (mouseOver(0, 780, 200, 100)) appstate = 2;
  }
}


void visAnimation(int startTid, int skiftTid, int skiftInterval,
                  PImage img1, PImage img2, int x, int y, String label) 
{
  // Tidsvisning
  fill(255);
  textSize(30);
  int resterendeTid = 10 - (millis() - startTid) / 1000;
  if (resterendeTid < 0) resterendeTid = 0;
  text("Tid: " + resterendeTid + " sek", width / 2, height / 2);

// Skift billeder når tid overstiger 0,5
  if (millis() - skiftTid > skiftInterval) 
  {
// Denne condition tjekker om den anvender en string i funktionens brug.
// Hvis den string er squat, så ændrer squatFrame mellem 1 og 2 imens skabBevægelseSquat er 1
    if (label.equals("squat")) 
    {
      squatFrame = (squatFrame + 1) % 2;
      sidsteSkiftTidSquat = millis();
    }
// Samme her gælder armbøj
    else if (label.equals("armbøj")) 
    {
      armbøjFrame = (armbøjFrame + 1) % 2;
      sidsteSkiftTidArmbøj = millis();
    }
  }

  // Vis rigtige billede
  int visFrame = label.equals("squat") ? squatFrame : armbøjFrame;
  if (visFrame == 0) 
  {
    image(img1, x, y);
  } 
  else 
  {
    image(img2, x, y);
  }

  // Stop animation efter 10 sekunder
  if ((millis() - startTid) > 10000) 
  {
    if (label.equals("squat")) 
    {
      skabBevægelseSquat = 0;
    } 
    else if (label.equals("armbøj")) 
    {
      skabBevægelseArmbøj = 0;
    }
  }
}

// Funktionen keyPressed kører når der bliver trykket på en keyboard knap
// Vores keyPressed definerer en række variablers værdier under en specifik appstate

void keyPressed() 
{

// Hvis du er på appstate 0 velkomstmenu og klikker på mellemrum, så ændres appstate til 1 og du når hovedmenuen
  if (key == ' ' && appstate == 0) 
  {
    appstate = 1;
  }

// Hvis du er på menuen overkrop og du trykker på mellemrum, så ændres skabBevægelseArmbøj til 1 og funktionen visAnimation eksekverer
  if (key == ' ' && appstate == 2) 
  {
    skabBevægelseArmbøj = 1;
    nedtællingStartTidArmbøj = millis();
    sidsteSkiftTidArmbøj = millis();
  }

// Det samme gælder for funktionen ved underkrop
  if (key == ' ' && appstate == 3) 
  {
    skabBevægelseSquat = 1;
    nedtællingStartTidSquat = millis();
    sidsteSkiftTidSquat = millis();
  }
}


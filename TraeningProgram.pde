// MENU NAVIGATION
int appstate = 0;

// START KNAP
int blinkInterval = 450;
int sidsteTid = 0;
boolean synlig = true;

// Logo
PImage logo; // Definerer billedevariabel
int xlogo = 0;
int ylogo = 0;
 
// Underkrop
PImage squat1;
PImage squat2;
int xsquat = 0;
int ysquat = 0;
int skabBevægelseSquat = 0;
int squatFrame = 0;
int sidsteSkiftTidSquat = 0;
int skiftIntervalSquat = 500;
int nedtællingStartTidSquat = 0;

 // Overkrop
PImage armbøj1;
PImage armbøj2;
int xarmbøj = 0;
int yarmbøj = 0;
int skabBevægelseArmbøj = 0;
int armbøjFrame = 0;
int sidsteSkiftTidArmbøj = 0;
int skiftIntervalArmbøj = 500;
int nedtællingStartTidArmbøj = 0;
 
 // Underkropmenu knap
 int underMenuKnapX = 0;
 int underMenuKnapY = 830;
 int underMenuKnapW = 100; 
 int underMenuKnapB = 50;
 
 // Overkropmenu knap
 int overMenuKnapX = 0;
 int overMenuKnapY = 780;
 int overMenuKnapW = 100; 
 int overMenuKnapB = 50;
 
 // Hovedmenu knap
 int hovedMenuKnapX, hovedMenuKnapY, hovedMenuKnapW, hovedMenuKnapB;
 
 void setup() 
 {
   size(1420, 880);
   background(255);
   logo = loadImage("logo.png"); // Vælger logo til den tomme variabel
   squat1 = loadImage ("squat1.jpg");
   squat2 = loadImage ("squat2.jpg");
   armbøj1 = loadImage ("Armbøjning1.png");
   armbøj2 = loadImage ("Armbøjning2.png");
 }
 
 void draw() 
 {
   int nutid = millis();
   int xlogo = width - logo.width;
   int xsquat = width / 3 * 2;
   int ysquat = height / 2;
 
   if (appstate == 0) { // VELKOMMEN MENU
     background(0);
     image(logo, xlogo, ylogo);
     textSize(40);
     fill(255);
     textAlign(CENTER, CENTER);
     text("Velkommen til ProcessingPump", width / 2, 300);
 
     textSize(30);
     text("Din digitale træningsmakker", width / 2, 350);
 
     if (nutid - sidsteTid > blinkInterval) {
       sidsteTid = nutid;
       synlig = !synlig; // ! skifter boolean om fra true til false, og omvendt
     }
 
     if (synlig) {
       int farveVelkommen = (nutid / 100) % 255; // Milli bliver til CENT %255 sikrer at der skabes et interval
       fill(farveVelkommen, 255 - farveVelkommen, farveVelkommen * 2);
       textSize(20);
       text("TRYK MELLEMRUM FOR AT FORTSÆTTE", width / 2, 700);
     }
   }
 
   if (appstate == 1) { // MAIN MENU
     background(255);
     background(0);
     textSize(30);
     fill(0);
     fill(255);
     text("Hovedmenu", 100, 100);
 
     fill(255, 0, 0);
     rect(underMenuKnapX, underMenuKnapY, underMenuKnapW, underMenuKnapB);
     fill(0);
     textAlign(CENTER, CENTER);
     textSize(16);
     text("Underkrop", underMenuKnapX + underMenuKnapW / 2, underMenuKnapY + underMenuKnapB / 2);   // text "Underkrop" på knappen
 
     fill(255, 0, 0);
     rect(overMenuKnapX, overMenuKnapY, overMenuKnapW, overMenuKnapB);
     fill(0);
     textAlign(CENTER, CENTER);
     textSize(16);
     text("Overkrop", overMenuKnapX + overMenuKnapW / 2, overMenuKnapY + overMenuKnapB / 2);   // text "Overkrop" på knappen
   }
 
   if (appstate == 2) { // OVERKROP
  background(0);
  textSize(30);
  fill(255);
  text("Overkrop", width / 2, 100);
  text("Idag skal du træne arme", width / 2, 150);
  text("Armbøjninger", width / 3, height / 2);

  // Underkropmenu knap
  fill(255, 0, 0);
  rect(underMenuKnapX, underMenuKnapY, underMenuKnapW, underMenuKnapB);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text("Underkrop", underMenuKnapX + underMenuKnapW / 2, underMenuKnapY + underMenuKnapB / 2);

  // Hovedmenu knap
  hovedMenuKnapX = 0;
  hovedMenuKnapY = 780;
  hovedMenuKnapW = 100;
  hovedMenuKnapB = 50;
  fill(255, 0, 0);
  rect(hovedMenuKnapX, hovedMenuKnapY, hovedMenuKnapW, hovedMenuKnapB);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(16);
  text("Hovedmenu", hovedMenuKnapX + hovedMenuKnapW / 2, hovedMenuKnapY + hovedMenuKnapB / 2);

  // Animation starter
  if (skabBevægelseArmbøj == 1) {
    fill(255);
    textSize(30);
    int resterendeTidArmbøj = 10 - (millis() - nedtællingStartTidArmbøj) / 1000;
    if (resterendeTidArmbøj < 0) resterendeTidArmbøj = 0;
    text("Tid: " + resterendeTidArmbøj + " sek", width / 2, height / 2);

    if (millis() - sidsteSkiftTidArmbøj > skiftIntervalArmbøj) {
      armbøjFrame = (armbøjFrame + 1) % 2;
      sidsteSkiftTidArmbøj = millis();
    }

    // Justeret placering til højre side ligesom squats
    xarmbøj = width / 3 * 2;
    yarmbøj = height / 2;

    if (armbøjFrame == 0) {
      image(armbøj1, xarmbøj, yarmbøj);
    } else {
      image(armbøj2, xarmbøj, yarmbøj);
    }
  }

  // Stop animation efter 10 sekunder
  if ((millis() - nedtællingStartTidArmbøj) > 10000) {
    skabBevægelseArmbøj = 0;
  }
}

   if (appstate == 3) // UNDERKROP
   { 
     background(0);
     textSize(30);
     fill(255);
     text ("Underkrop", width / 2, 100);
     textSize(30);
     text ("Idag skal du træne ben", width / 2, 150);
     text ("Squat", width / 3, height / 2);
 
     fill(255, 0, 0);
     rect(overMenuKnapX, overMenuKnapY, overMenuKnapW, overMenuKnapB);
     fill(0);
     textAlign(CENTER, CENTER);
     textSize(16);
     text("Overkrop", overMenuKnapX + overMenuKnapW / 2, overMenuKnapY + overMenuKnapB / 2);   // text "Overkrop" på knappen
 
     // Hovedmenu knap
     hovedMenuKnapX = 0;
     hovedMenuKnapY = 830;
     hovedMenuKnapW = 100;
     hovedMenuKnapB = 50;
     fill(255, 0, 0);
     rect(hovedMenuKnapX, hovedMenuKnapY, hovedMenuKnapW, hovedMenuKnapB);
     fill(0);
     textAlign(CENTER, CENTER);
     textSize(16);
     text("Hovedmenu", hovedMenuKnapX + hovedMenuKnapW / 2, hovedMenuKnapY + hovedMenuKnapB / 2);
     
     // Animation starter
     if (skabBevægelseSquat == 1)
    {
      fill(255);
      textSize(30);
      int resterendeTid = 10 - (millis() - nedtællingStartTidSquat) / 1000;
      if (resterendeTid < 0) resterendeTid = 0;
      text("Tid: " + resterendeTid + " sek", width / 2, height / 2);
     
     if (millis() - sidsteSkiftTidSquat > skiftIntervalSquat) // Denne condition beskriver hvorvidt at squatFrame 1 eller 2 skal vises, afhængig af om der er gået mere end 3 sekunder.
     {
       squatFrame = (squatFrame + 1) % 2;
       sidsteSkiftTidSquat = millis();
     }
     if (squatFrame == 0)
     {
       image(squat1, xsquat, ysquat);
     } else
     {
       image(squat2, xsquat, ysquat);
     }
    }
    
    if ((millis() - nedtællingStartTidSquat) > 10000) 
    {
      skabBevægelseSquat = 0;
    }
    
   }
 }
 
 void keyPressed() // START PROGRAM OG START TRÆNINGskabBevægelseSquat
 { 
   if (appstate == 3)
   {
   if (keyCode == ' ') 
     {
      skabBevægelseSquat = 1;
      sidsteSkiftTidSquat = millis(); // Timer til skift mellem 1. og 2. frame i underkrop
      nedtællingStartTidSquat = millis(); // Timer til animation
     }
   }
   if (appstate == 2)
   {
   if (keyCode == ' ') 
     {
      skabBevægelseArmbøj = 1;
      sidsteSkiftTidArmbøj = millis(); // Timer til skift mellem 1. og 2. frame i overkrop
      nedtællingStartTidArmbøj = millis(); // Timer til animation
     }
   }
   if (appstate == 0)
   {
    if (keyCode == ' ') 
    {
      appstate = 1;
    }
   }
 }
 
 void mousePressed() // NAVIGERINGSRUDE
 {
   // Tjek om musen er indenfor rektanglet for Underkrop
   if (mouseX > underMenuKnapX && mouseX < underMenuKnapX + underMenuKnapW && mouseY > underMenuKnapY && mouseY < underMenuKnapY + underMenuKnapB) 
   {
     appstate = 3;
   }
   // Tjek om musen er indenfor rektanglet for Overkrop
   if (mouseX > overMenuKnapX && mouseX < overMenuKnapX + overMenuKnapW && mouseY > overMenuKnapY && mouseY < overMenuKnapY + overMenuKnapB) 
   {
     appstate = 2;
   }
   // Tjek om musen er indenfor rektanglet for Hovedmenu
   if (mouseX > hovedMenuKnapX && mouseX < hovedMenuKnapX + hovedMenuKnapW && mouseY > hovedMenuKnapY && mouseY < hovedMenuKnapY + hovedMenuKnapB) 
   {
     appstate = 1;
   }
 }

int appstate = 0; // MENU NAVIGATION
int blinkInterval = 450;
int sidsteTid = 0;
boolean synlig = true;
PImage logo; // Definerer billedevariabel
int xlogo = 0;
int ylogo = 0;

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

void setup() {
  size(1420, 880);
  background(255);
  logo = loadImage("logo.png"); // Vælger logo til tom variabel
}

void draw() {
  int nutid = millis();
  int xlogo = width - logo.width;
  
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
    textSize(30);
    fill(0);
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
    background(255);
    textSize(30);
    fill(0);
    text("Overkrop", 100, 100);
    
    fill(255, 0, 0);
    rect(underMenuKnapX, underMenuKnapY, underMenuKnapW, underMenuKnapB);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("Underkrop", underMenuKnapX + underMenuKnapW / 2, underMenuKnapY + underMenuKnapB / 2);   // text "Underkrop" på knappen

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
  }

  if (appstate == 3) { // UNDERKROP
    background(255);
    textSize(30);
    fill(0);
    text("Underkrop", 100, 100);
    
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
  }
}

void keyPressed() { // NAVIGERING
  if (keyCode == UP) {
    appstate = 2;
  }
  if (keyCode == DOWN) {
    appstate = 3;
  }
  if (keyCode == ' ') {
    appstate = 1;
  }
}

void mousePressed() {
  // Tjek om musen er indenfor rektanglet for Underkrop
  if (mouseX > underMenuKnapX && mouseX < underMenuKnapX + underMenuKnapW && mouseY > underMenuKnapY && mouseY < underMenuKnapY + underMenuKnapB) {
    appstate = 3;
  }
  // Tjek om musen er indenfor rektanglet for Overkrop
  if (mouseX > overMenuKnapX && mouseX < overMenuKnapX + overMenuKnapW && mouseY > overMenuKnapY && mouseY < overMenuKnapY + overMenuKnapB) {
    appstate = 2;
  }
  // Tjek om musen er indenfor rektanglet for Hovedmenu
  if (mouseX > hovedMenuKnapX && mouseX < hovedMenuKnapX + hovedMenuKnapW && mouseY > hovedMenuKnapY && mouseY < hovedMenuKnapY + hovedMenuKnapB) {
    appstate = 1;
  }
}

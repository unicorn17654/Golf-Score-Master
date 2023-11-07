// https://community.particle.io/t/argon-and-adafruit-featherwing-oled-128x64-are-any-of-the-libraries-working-for-this-screen/63501/8

// This #include statement was automatically added by the Particle IDE.
#include <Debounce.h>

// This #include statement was automatically added by the Particle IDE.
// #include <Adafruit_Bus_IO.h>
#include <Adafruit_I2CDevice.h>

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SH110X.h>


Adafruit_SH1107 display = Adafruit_SH1107(64, 128, &Wire);

// OLED FeatherWing buttons map to different pins depending on board:
#define BUTTON_A  4
#define BUTTON_B  3
#define BUTTON_C  2


int state = 0;
// state 0 : Slash screen
// state 1 : player screen
// state 2 : hole screen
// state 3 : par screen
// state 4 : confrim par screen
// state 5 : score screen
// state 6 : confrim score screen
// state  :  screen



void startScreen(){
    display.clearDisplay();
    display.display();
    
    display.setTextSize(1);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(32,4);
    display.println("Welcome To");
    
    display.setCursor(8,16);
    display.setTextSize(2);
    display.println("Golf Score Tracker!");
    
    display.setCursor(32,50);
    display.setTextSize(1);
    display.println("By Winstone");
    
    display.display();
}

void drawPlayerSelectScreen(int players){
    display.clearDisplay();
    display.display();
    
    display.setTextSize(1);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(0,4);
 
    display.println("How Many Players:");
    display.println("");

    display.print(" > ");
    display.print(String(players));
    
    display.println("");
    display.println("");

    display.println("Press A for more.");
    display.println("Press B for less.");
    display.println("Press C to continue.");

    display.display();
}


int playerSelectScreen(){
    display.clearDisplay();
    display.display();
    
    int players = 1;
    drawPlayerSelectScreen(players);
    
    while(true){
      if (!digitalRead(BUTTON_A)) {
            players = players + 1;
            if(players > 4){
                players = 4;
            }
          drawPlayerSelectScreen(players);
      }
      
      else if (!digitalRead(BUTTON_B)) {
            players = players - 1;
            if(players < 1){
                players = 1;
            }
          drawPlayerSelectScreen(players);
      }
      
            
      else if (!digitalRead(BUTTON_C)) {
            //   drawPlayerSelectScreen(players);
          return players;
      }

      delay(10);
      yield();
    }
}





void drawHoleSelectScreen(int holes){
    display.clearDisplay();
    display.display();
    
    display.setTextSize(1);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(0,4);
 
    display.println("How Many Holes:");
    display.println("");

    display.print(" > ");
    display.print(String(holes));
    
    display.println("");
    display.println("");

    display.println("Press A for more.");
    display.println("Press B for less.");
    display.println("Press C to continue.");

    display.display();
}


int holeSelectScreen(){
    display.clearDisplay();
    display.display();
    
    int holes = 1;
    drawHoleSelectScreen(holes);
    
    while(true){
      if (!digitalRead(BUTTON_A)) {
            holes = holes + 1;
            if(holes > 18){
                holes = 18;
            }
          drawHoleSelectScreen(holes);
      }
      
      else if (!digitalRead(BUTTON_B)) {
            holes = holes - 1;
            if(holes < 1){
                holes = 1;
            }
          drawHoleSelectScreen(holes);
      }
      
            
      else if (!digitalRead(BUTTON_C)) {
            
            return holes;

      }

      delay(10);
      yield();
    }
}






void drawParScreen(int par, int hole){
    display.clearDisplay();
    display.display();
    
    display.setTextSize(1);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(0,4);
 
    display.print("Par for Hole ");
    display.println(String(hole));
    display.println("");

    display.print(" > ");
    display.print(String(par));
    
    display.println("");
    display.println("");

    display.println("Press A for more.");
    display.println("Press B for less.");
    display.println("Press C to continue.");

    display.display();
}


int parScreen(int hole){
    display.clearDisplay();
    display.display();
    
    int par = 1;
    drawParScreen(par, hole);
    
    while(true){
      if (!digitalRead(BUTTON_A)) {
            par = par + 1;
            if(par > 5){
                par = 5;
            }
          drawParScreen(par, hole);
      }
      
      else if (!digitalRead(BUTTON_B)) {
            par = par - 1;
            if(par < 1){
                par = 1;
            }
          drawParScreen(par, hole);
      }
      
      else if (!digitalRead(BUTTON_C)) {
            return par;
      }
      delay(10);
      yield();
    }
}




bool confirmParScreen(int par, int hole){
    display.clearDisplay();
    display.display();
    
    display.setTextSize(1);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(0,4);
    
    display.println("Hole " + String(hole) + " is par " + String(par));
    display.println("");
    display.println("Is this correct?");
    
    display.println("");
    display.println("");

    display.println("Press A for edit.");
    display.println("Press B for continue.");

    display.display();

    while(true){
      if (!digitalRead(BUTTON_A)) {
          return false;
      }
      
      else if (!digitalRead(BUTTON_B)) {
          return true;
      }
      delay(10);
      yield();
    }
}






void drawPlayerHoleScoreScreen(int player, int hole, int score){
    display.clearDisplay();
    display.display();
    
    display.setTextSize(1);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(0,4);
 
    display.println("Score for player " + String(player));
    display.println("for Hole" + String(hole));
    display.println("");

    display.print(" > ");
    display.print(String(score));
    
    display.println("");
    display.println("");

    display.println("Press A for more.");
    display.println("Press B for less.");
    display.println("Press C to continue.");

    display.display();
}


int playerHoleScroeScreen(int player, int hole, int par){
    display.clearDisplay();
    display.display();
    
    int score = 1;
    drawPlayerHoleScoreScreen(player, hole, score);
    
    while(true){
      if (!digitalRead(BUTTON_A)) {
            score = score + 1;
            if(score > (par * 2 + 1)){
                score = par * 2 + 1;
            }
          drawPlayerHoleScoreScreen(player, hole, score);
      }
      
      else if (!digitalRead(BUTTON_B)) {
            score = score - 1;
            if(score < 1){
                score = 1;
            }
          drawPlayerHoleScoreScreen(player, hole, score);
      }
      
      else if (!digitalRead(BUTTON_C)) {
            return score;
      }
      delay(10);
      yield();
    }
}






bool confirmPlayerHoleScoreScreen(int player, int hole, int score){
    display.clearDisplay();
    display.display();
    
    display.setTextSize(1);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(0,4);
    
    display.println("Player's " + String(player) + "score on Hole " + String(hole) + " is " + String(score));
    display.println("Is this correct?");
    
    display.println("");
    display.println("");

    display.println("Press A for edit.");
    display.println("Press B for continue.");

    display.display();

    while(true){
      if (!digitalRead(BUTTON_A)) {
          return false;
      }
      
      else if (!digitalRead(BUTTON_B)) {
          return true;
      }
      delay(10);
      yield();
    }
}




void setup() {
  Serial.begin(115200);

  Serial.println("128x64 OLED FeatherWing test");
  display.begin(0x3C, true); // Address 0x3C default

  Serial.println("OLED begun");

  // Show image buffer on the display hardware.
  // Since the buffer is intialized with an Adafruit splashscreen
  // internally, this will display the splashscreen.
  display.display();
  delay(1000);

  // Clear the buffer.
  display.clearDisplay();
  display.display();

  display.setRotation(1);
  Serial.println("Button test");

  pinMode(BUTTON_A, INPUT_PULLUP);
  pinMode(BUTTON_B, INPUT_PULLUP);
  pinMode(BUTTON_C, INPUT_PULLUP);
  
    startScreen();
    delay(1000);
}




int sumPlayerScore(int **arr, int player, int rows, int cols) {
  int sum = 0;
  for (int i = 0; i < rows; i++) {
    sum += arr[i][player];
  }
//   printf("sum: %d \n", sum);
  return sum;
}




void loop() {
    int players = 0;
    int holes = 0;
    int par = 0;
    int score = 0;

    players = playerSelectScreen();
    holes = holeSelectScreen();
    

    // int **scores = (int **)malloc((players+1) * sizeof(int *));
    // for (int i = 0; i < players; i++) {
    //     scores[i] = (int *)malloc(holes * sizeof(int));
    // }

    
    int scores[players + 1][holes];
    
    String s = "";
    
    for( int i = 0; i < holes; i++ ){
        do {
            par = parScreen(i+1);
        } while (!confirmParScreen(par, i + 1));
        

        scores[0][i] = par;
        s = "par of " + String(par) + " for hole " + String(i + 1);
        Particle.publish("par", s, PRIVATE);
        
        for( int j = 1; j < players+1; j++ ){
            do {
                score = playerHoleScroeScreen(j, i + 1, par);
            } while (!confirmPlayerHoleScoreScreen(j, i + 1, score));
            
            scores[j][i] = score;
            
            s = "Player " + String(j) + " for hole " + String(i + 1) + " score " + String(score);
            Particle.publish("player score", s, PRIVATE);

        }   
    }
    
    
    
    
    display.clearDisplay();
    display.display();
    
    display.setTextSize(1);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(0,4);
    
    display.println("Final Scores");

    char dataStr[64];

    for( int j = 0; j < players+1; j++ ){
        int sum = 0;
        for(int i = 0; i < holes; i++){
            sum += scores[j][i];
        }

        sprintf(dataStr,
            "{\"player\": %u, \"holes\": %u, \"scores\": %u}",
            j,
            holes,
            sum
        );
        // snprintf(dataStr, "{[{"players":"{}"},{"holes":"{}"}]}", players, holes)
        Particle.publish("note", dataStr, PRIVATE);
        delay(300);

        if(j > 0){
            display.println(" > Player " + String(j) + ": " + String(sum));
            display.display();
        }
    }
    
    
    delay(100);
    display.println("");
    display.println("Press any button to continue...");
    display.display();


    while(true){
      if (!digitalRead(BUTTON_A)) {
          break;
      }
      else if (!digitalRead(BUTTON_B)) {
          break;
      }
      else if (!digitalRead(BUTTON_C)) {
          break;
      }
      delay(10);
      yield();
    }

    
    endScreen();

    // sprintf(dataStr,
    //     "{\"player\": %u, \"holes\": %u, \"scores\": %u}",
    //     players,
    //     holes,
    //     scores
    // );
    // // snprintf(dataStr, "{[{"players":"{}"},{"holes":"{}"}]}", players, holes)
    // Particle.publish("note", dataStr, PRIVATE);

//   if(!digitalRead(BUTTON_A)) display.print("A");
//   if(!digitalRead(BUTTON_B)) display.print("B");
//   if(!digitalRead(BUTTON_C)) display.print("C");
//   delay(10);
//   yield();
//   display.display();
  
//   startScreen();
}


bool endScreen(){
    display.clearDisplay();
    display.display();
    
    display.setTextSize(1);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(0,4);
    
    display.println("Thank you for playing!");

    display.display();
    while(true){
      delay(10);
      yield();
    }
}


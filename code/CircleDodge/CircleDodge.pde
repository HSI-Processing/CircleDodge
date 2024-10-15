final private int BLACK = color(0, 0, 0);  
final private int RED = color(255, 0, 0);

public MainScreen startScreen;
public Language language = new Language();
boolean spanish = false;

public Player player;
public Enemy[] enemies;

public boolean start; 
public int score = 0; 
public int numberEnemies;


void setup(){
  size(900, 900);  
  noStroke();
  
  background(BLACK);

  start = false;  
  score = 0;     
  
  player = new Player(this);
  numberEnemies = 20;
  enemies = new Enemy[numberEnemies];
  for(int i = 0; i < enemies.length; i++){
    enemies[i] = new Enemy(this);
  }
}

void draw(){
  if(!start){
    displayMain(); 
  }
  if(start){
    background(BLACK); 
    displayScore();
    
    player.drawPlayer();  
    
    for(int i = 0; i < enemies.length; i++){
      player.collide(enemies[i]);
      enemies[i].drawEnemy();
    }
  }
  score++; 
}

public void displayMain(){
  startScreen = new MainScreen();
  startScreen.languageButton(250, 675, 400, 150, language.toSpanishCheck("SPANISH"));
  startScreen.startButton(250, 500, 400, 150, language.toSpanishCheck("START"));
}

public void displayScore(){
  textAlign(LEFT);
  textSize(20);
  fill(RED);
  
  
  text(language.toSpanishCheck("Score") + ": " + score, 5, 25);
}

//// could be an override method
//public String toSpanishCheck(String input){
//  String text = input;
//  if(spanish){
//    text = language.spanish(text);
//  }
//  return text;
//}

//public void keyPressed(){
//  if(key == ENTER){
//    start = true;
//  }
//}

public void mouseClicked(){
  if(!start){
    if (startScreen.isStartButtonPressed()) {
      start = true;
    }else if(startScreen.isLanguageButtonPressed()) {
      spanish = !spanish;
      
      if (spanish){
        spanish = true;
      }else{
        spanish = false;
      }
    }
  }  
}

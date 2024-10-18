final private int BLACK = color(0, 0, 0);  
final private int RED = color(255, 0, 0);

public MainScreen startScreen;
public GameOver gameOverScreen;
public Language language = new Language();
public boolean spanish = false;
public boolean gameOver = false;

public Player player;
public Enemy[] enemies;

public boolean start; 
public int score = 0; 
public int highScore = 0; // Added highScore variable
public int numberEnemies;

void setup() {
  size(900, 900);  
  noStroke();
  
  background(BLACK);

  start = false;  
  score = 0;     

  player = new Player(this);
  numberEnemies = 20;
  enemies = new Enemy[numberEnemies];
  for (int i = 0; i < enemies.length; i++) {
    enemies[i] = new Enemy(this);
  }
}

void draw() {
  if (!start && !gameOver) {
    displayMain();
  } else if (gameOver) {
    if (gameOverScreen == null) {
      gameOverScreen = new GameOver(language);
    }
    gameOverScreen.draw();
  } else if (start && !gameOver) {
    // Game logic
    background(BLACK); 
    displayScore();

    player.drawPlayer();  

    for (int i = 0; i < enemies.length; i++) {
      player.collide(enemies[i]);
      enemies[i].drawEnemy();
    }
    score++; 

    // Update highScore if current score is higher
    if (score > highScore) {
      highScore = score;
    }
  }
}


public void displayMain() {
  if (startScreen == null) {
    startScreen = new MainScreen(language);
  }
  startScreen.draw();
}

public void displayScore() {
  textAlign(LEFT);
  textSize(20);
  fill(RED);
  text(language.toSpanishCheck("Score", spanish) + ": " + score, 5, 25);
  text(language.toSpanishCheck("High Score", spanish) + ": " + highScore, 5, 50); // Display high score during gameplay
}

public void mouseClicked() {
  if (!start && !gameOver) {
    if (startScreen == null) {
      startScreen = new MainScreen(language);
    }
    if (startScreen.isStartButtonPressed()) {
      start = true;
    } else if (startScreen.isLanguageButtonPressed()) {
      spanish = !spanish;
      // Reset startScreen to update the language
      startScreen = null;
    }
  } else if (gameOver) {
    if (gameOverScreen.isRestartButtonClicked()) {
      // Return to main menu
      gameOver = false;
      start = false; // Go back to the main menu
      score = 0; // Reset the score
      gameOverScreen = null;
      // Reset startScreen to ensure main menu displays correctly
      startScreen = null;
      // Reinitialize game objects as needed
      player = new Player(this);
      numberEnemies = 20;
      enemies = new Enemy[numberEnemies];
      for (int i = 0; i < enemies.length; i++) {
        enemies[i] = new Enemy(this);
      }
    }
  }
}


public void keyPressed() {
  if (key == ENTER) {
    if (!start && !gameOver) {
      start = true;
    } else if (gameOver) {
      // Return to main menu
      gameOver = false;
      start = false; // Go back to the main menu
      score = 0; // Reset the score
      gameOverScreen = null;
      startScreen = null; // Reset main menu screen
      // Reinitialize game objects as needed
      player = new Player(this);
      numberEnemies = 20;
      enemies = new Enemy[numberEnemies];
      for (int i = 0; i < enemies.length; i++) {
        enemies[i] = new Enemy(this);
      }
    }
  }
}

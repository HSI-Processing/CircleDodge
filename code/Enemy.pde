public class Enemy{

  final private int BLACK = color(0, 0, 0);  
  final private int RED = color(255, 0, 0);
  final private int GREEN = color(0, 255, 0);  
  final private int PURPLE = color(255, 0, 255);
  final private int YELLOW = color(255, 255, 0);
  
  private int enemyStartingEdge;
  private float enemyX;
  private float enemyY;
  private int enemySize;
  private color enemyColor;
  private float enemySpeed;
  private float enemySpeedAdjuster = 0.5;
  
  private CircleDodge game;
  private int type;
  private int timeSinceSpawned;

  public Enemy(CircleDodge game){
    this.game = game;
    spawnEnemy();
  }
  
  public float getEnemyX(){
    return enemyX;
  }
  
  public float getEnemyY(){
    return enemyY;
  }
  
  public float getEnemySize(){
    return enemySize;
  }
  
  public void spawnEnemy(){
    timeSinceSpawned = 0; 
    type = 1 + (int)random(4);
    
    if(type == 1){
      enemySize = 50;
      enemyColor = PURPLE;
      enemySpeed = 4;
    }else if(type == 2){
      enemySize = 20;
      enemyColor = YELLOW;
      enemySpeed = 11;
    }else if(type == 3){
      enemySize = 200;
      enemyColor = GREEN;
      enemySpeed = 4;
    }else{
      enemySize = 50;
      enemyColor = RED;
      enemySpeed = 7;
    }
    
    enemyStartingEdge = (int)random(4);
    if(enemyStartingEdge == 0){
      enemyX = 0 - enemySize - 5;
      enemyY = random(0, game.height);
    }else if(enemyStartingEdge == 1){
      enemyX = game.width + enemySize + 5;
      enemyY = random(0, game.height);
    }else if(enemyStartingEdge == 2){
      enemyX = random(0, game.width);
      enemyY = 0 - enemySize - 5;
    }else{
      enemyX = random(0, game.width);
      enemyY = game.height + enemySize + 5;
    }
    
    fill(enemyColor);
    circle(enemyX, enemyY, enemySize);
  }
  
  public void drawEnemy(){
    timeSinceSpawned++;
    
    float positionDelta = enemySpeed * enemySpeedAdjuster;
    if(outOfSite()){
      spawnEnemy();
    }else if(this.type == 1){
      Player player = game.player;
      
      if(enemyX < player.getPlayerX()){
        enemyX += positionDelta;
      }else{
        enemyX -= positionDelta;
      }
      
      if(enemyY < player.getPlayerY()){
        enemyY += positionDelta;
      }else{
        enemyY -= positionDelta;
      }
      
    }else if(enemyStartingEdge == 0){
      enemyX += positionDelta;
    }else if(enemyStartingEdge == 1){
      enemyX -= positionDelta;
    }else if(enemyStartingEdge == 2){
      enemyY += positionDelta;
    }else{
      enemyY -= positionDelta;
    }
    fill(enemyColor);
    circle(enemyX, enemyY, enemySize);
  }
  
  public boolean outOfSite(){
    if(enemyStartingEdge == 0 && enemyX >= game.width + enemySize + 5){
      return true;
    }else if(enemyStartingEdge == 1 && enemyX <= 0 - enemySize - 5){
      return true;
    }else if(enemyStartingEdge == 2 && enemyY >= game.height + enemySize + 5){
      return true;
    }else if(enemyY <= 0 - enemySize - 5){
      return true;
    }
    
    if(type == 1 && timeSinceSpawned > 300){
      return true;
    }
    
    return false;
  }
}

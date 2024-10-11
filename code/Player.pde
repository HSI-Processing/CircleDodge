public class Player{
  
  final private int AQUA = color(0, 255, 255);
  private float playerX;  
  private float playerY;  
  private int playerSize; 
  private color playerColor = AQUA;
  
  private CircleDodge game;
  
  public Player(CircleDodge game){
    this.game = game;
    playerX = game.width/2;  
    playerY = game.height/2; 
    playerSize = 50;        
    
    fill(playerColor);   
    circle(playerX, playerY, playerSize);
  }
  
  public void drawPlayer(){
    playerX = mouseX;
    playerY = mouseY;
    fill(playerColor);
    circle(playerX, playerY, playerSize);
  }
  
  public float getPlayerX(){
    return playerX;
  }
  
  public float getPlayerY(){
    return playerY;
  }
  
  private void collide(Enemy e){
    float distance = dist(this.playerX, this.playerY, e.getEnemyX(), e.getEnemyY());
    float playerRadius = this.playerSize/2;
    float enemyRadius = e.getEnemySize()/2;
    
    if(distance < enemyRadius + playerRadius){
      System.out.println(e.type);
      System.out.println(distance);
      System.out.println(enemyRadius);
      System.out.println(playerRadius);
      game.setup();
    }
  }
}

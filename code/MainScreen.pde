public class MainScreen
{
  private String gameTitle;
  private Button startButton;
  private Button languageButton;
  
  private PImage logoENG;
  private PImage logoSPAN;

  
  public Language language = new Language();
  
  public MainScreen(){
    fill(98, 63, 184);
    rect(0,0, width, height);
    fill(247, 25, 113);
    rect(5, 5, width - 10, height - 10);
    fill(40, 207, 251);
    rect(15, 15, width - 30, height - 30);
    

    fill(253, 253, 150); //light yellow background for mainscreen
    //fill(240, 128, 128); //light Coral
    
    
    rect(25,25,width - 50, height - 50);
    //background(255); // add picture maybe
    textMode(CENTER);
    fill(0);
    textSize(40);
    logoENG = loadImage("images/CircleDodgeLogo_ENG.png");
    logoSPAN = loadImage("images/CircleDodgeLogo_SPAN.png");
    logoENG.resize(450,450);
    logoSPAN.resize(450,450);


    if (spanish) {
      image(logoSPAN, 216, 35);
    } else {
      image(logoENG, 216, 35);
    }
  }
  
  void startButton(int x, int y, int buttonWidth, int buttonHeight, String text){
    startButton = new Button(x, y, buttonWidth, buttonHeight, text);
  }
  
  void languageButton(int x, int y, int buttonWidth, int buttonHeight, String text){
    languageButton = new Button(x, y, buttonWidth, buttonHeight, text);
  }
  
  boolean isStartButtonPressed() {
        return startButton.overButton();  
    }

  boolean isLanguageButtonPressed() {
      return languageButton.overButton();  
  }
  

  
}

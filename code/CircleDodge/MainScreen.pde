public class MainScreen {
  private String gameTitle;
  private Button startButton;
  private Button languageButton;

  private PImage logoENG;
  private PImage logoSPAN;

  private Language language;

  public MainScreen(Language language) {
    this.language = language;
    // Load images
    logoENG = loadImage("images/CircleDodgeLogo_ENG.png");
    logoSPAN = loadImage("images/CircleDodgeLogo_SPAN.png");
    logoENG.resize(450, 450);
    logoSPAN.resize(450, 450);

    // Initialize buttons
    startButton = new Button(250, 500, 400, 150, language.toSpanishCheck("START", spanish));
    languageButton = new Button(250, 675, 400, 150, language.toSpanishCheck("SPANISH", spanish));
  }

  public void draw() {
    // Draw background layers
    fill(98, 63, 184);
    rect(0, 0, width, height);
    fill(247, 25, 113);
    rect(5, 5, width - 10, height - 10);
    fill(40, 207, 251);
    rect(15, 15, width - 30, height - 30);

    fill(253, 253, 150); // Light yellow background for mainscreen
    rect(25, 25, width - 50, height - 50);
    textMode(CENTER);
    fill(0);
    textSize(40);

    // Draw logo based on language
    if (spanish) {
      image(logoSPAN, 216, 35);
    } else {
      image(logoENG, 216, 35);
    }

    // Update button texts in case the language changed
    startButton.text = language.toSpanishCheck("START", spanish);
    languageButton.text = language.toSpanishCheck("SPANISH", spanish);

    // Draw buttons
    startButton.draw();
    languageButton.draw();
  }

  boolean isStartButtonPressed() {
    return startButton.overButton();  
  }

  boolean isLanguageButtonPressed() {
    return languageButton.overButton();  
  }
}

class Button {

  int x, y, buttonWidth, buttonHeight;
  String text;

  color normalColor = color(255, 198, 35);
  color hoverColor = color(40, 207, 251);
  color currentColor;

  boolean isPressed = false;

  public Button(int x, int y, int buttonWidth, int buttonHeight, String text) {
    this.x = x;
    this.y = y;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
    this.text = text;
    this.currentColor = normalColor;
  }

  void draw() {
    if (overButton()) {
      currentColor = hoverColor;
    } else {
      currentColor = normalColor;
    }

    fill(currentColor);
    makeButton();
  }

  void makeButton() {
    rectMode(CORNER);
    rect(x, y, buttonWidth, buttonHeight, 10); // Rounded corners
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(32);
    text(text, x + buttonWidth / 2, y + buttonHeight / 2);
  }

  boolean overButton() {
    return mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y && mouseY <= y + buttonHeight;
  }

  void handleMousePressed() {
    if (overButton()) {
      isPressed = true;
    }
  }

  void handleMouseReleased() {
    isPressed = false;
  }

  String getText() {
    return this.text;
  }
}

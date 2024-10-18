public class Language {

  public String spanish(String text) {
    if (text.equals("Score")) {
      return "PUNTOS";
    } else if (text.equals("High Score")) {
      return "PUNTUACIÓN MÁS ALTA";
    } else if (text.equals("CIRCLE DODGE")) {
      return "ESQUIVA EL CIRCULO";
    } else if (text.equals("START")) {
      return "COMENZAR";
    } else if (text.equals("SPANISH")) {
      return "ENGLISH";
    } else if (text.equals("GAME OVER")) {
      return "FIN DEL JUEGO";
    } else if (text.equals("Restart")) {
      return "REINICIAR";
    }
    return text; // Return original text if no translation is found
  }

  public String toSpanishCheck(String input, boolean spanish) {
    if (spanish) {
      return spanish(input);
    } else {
      return input;
    }
  }
}

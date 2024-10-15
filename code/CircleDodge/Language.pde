public class Language{
  
  public String spanish(String text){
    if(text == "Score"){
      return "PUNTOS";
    }else if(text == "CIRCLE DODGE"){
      return "ESQUIVA EL CIRCULO";
    }else if(text == "START"){
      return "COMENZAR";
    }else if(text == "SPANISH"){
      return "ENGLISH";
    }
    return null;
  }
  
  public String english(String text){
    if(text == "Resultado / puntaje"){
      return "Score";
    }else if(text == "esquivar el círculo"){
      return "CIRCLE DODGE";
    }else if(text == "comenzar"){
      return "START";
    }else if(text == "ENGLISH"){
      return "SPANISH";
    }
    return null;
  }
  
  // could be an override method
  public String toSpanishCheck(String input){
    String text = input;
    if(spanish){
      text = spanish(text);
    }
    return text;
  }
    
}

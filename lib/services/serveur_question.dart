
import 'package:test_personnalite/models/question.dart';

class ServeurQuestion {
  int _indexQuestion = 0;
  List<Question> questions = [

    Question(
      text: "Je me fais facilement des amis.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "J’ai beaucoup d’imagination.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "Je fais confiance aux autres.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "J’accomplis les tâches avec succès.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "Je me fâche facilement.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "J’apprécie beaucoup les grandes réceptions et réunions.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "Je trompe parfois les autres pour faire les choses comme je l'entends.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "Je n’aime pas le désordre. J’aime ranger.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "J’éprouve des émotions profondes et variées.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "J’adore aider les autres.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "Je tiens toujours mes promesses.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

    Question(
      text: "Je préfère la diversité à la routine.", 
      options: [
        "Pas du tout d’accord",
        "Pas d’accord",
        "Neutre",
        "D’accord",
        "Tout à fait d’accord"
      ]
    ),

  ];


  String getText() {
    if (_indexQuestion < questions.length) {
      return questions[_indexQuestion].text;
    }
    throw Exception("Index hors limites.");
  }


  List<String> getOptions(){
    return questions[_indexQuestion].options;
  }

  int getSelectOption(){
    return questions[_indexQuestion].selectOption;
  }
  

  void nextQuestion() {
    if (_indexQuestion < (questions.length - 1)) {
      _indexQuestion++;
    }
  }


  bool testTerminer(){
    return _indexQuestion >= (questions.length - 1);
  }
  
  void setSelectOption(int index){
    questions[_indexQuestion].selectOption = index;
  }

  void reinitialiser(){
    _indexQuestion = 0 ;
  }



}















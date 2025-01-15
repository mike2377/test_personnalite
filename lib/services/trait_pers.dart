import 'package:test_personnalite/models/trait.dart';

class TraitPersonnalite {
  final int _indexTrait = 0;
  List<Trait> traits = [

    Trait(
      name: "Ouverture à l’expérience",
      description: [
          "Imagination",
          "Intérêts artistiques", 
          "Profondeur des émotions"
        ]
      ),

    Trait(
      name: "Conscience professionnelle", 
      description: [
        "Sens des compétences",
        "Ordre",
        "Sens des responsabilités"
      ]
    ),

    Trait(
      name: "Extraversion", 
      description: [
        "Aménité",
        "Sociabilité",
        "Assertivité"
      ]
    ),

  ];

  String getName(){
    return traits[_indexTrait].name;
  }

  String getDescription(){
    return traits[_indexTrait].description.join(", ");
  }
}

import 'package:Test_Personnalite/services/trait_pers.dart';

class CalculResultat {
  final TraitPersonnalite traitPersonnalite = TraitPersonnalite();

  String getResultat(int score) {
    if (score < 3) {
      return "${traitPersonnalite.traits[0].name}\nDescription :\n${traitPersonnalite.traits[0].description.join("\n")}";
    } else if (score >= 3 && score <= 5) {
      return "${traitPersonnalite.traits[1].name}\nDescription :\n${traitPersonnalite.traits[1].description.join("\n")}";
    } else {
      return "${traitPersonnalite.traits[2].name}\nDescription :\n${traitPersonnalite.traits[2].description.join("\n")}";
    }
  }
}


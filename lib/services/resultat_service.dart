import 'package:test_personnalite/services/trait_pers.dart';
import 'package:test_personnalite/services/serveur_question.dart';

class ResultatService {
  final TraitPersonnalite _traitPersonnalite;
  final ServeurQuestion _serveurQuestion;

  ResultatService(this._traitPersonnalite, this._serveurQuestion);

  // Calcul des scores pour chaque trait
  Map<String, double> calculerScores() {
    Map<String, double> scores = {};

    // Initialiser les scores à 0 pour chaque trait
    for (var trait in _traitPersonnalite.traits) {
      scores[trait.name] = 0;
    }

    // Parcourir les questions et additionner les scores en fonction des traits
    for (var question in _serveurQuestion.questions) {
      if (question.selectOption >= 0 && question.selectOption <= 4) {
        int score = question.selectOption + 1; // Les scores vont de 1 à 5
        String traitAssocie = _associerTrait(question.text);
        if (traitAssocie.isNotEmpty && scores.containsKey(traitAssocie)) {
          scores[traitAssocie] = (scores[traitAssocie] ?? 0) + score;
        }
      }
    }

    return scores;
  }

  // Associer une question à un trait (selon le texte de la question)
  String _associerTrait(String questionText) {
    if (questionText.contains("imagination") ||
        questionText.contains("émotions profondes") ||
        questionText.contains("artistiques")) {
      return "Ouverture à l’expérience";
    } else if (questionText.contains("ordre") ||
               questionText.contains("responsabilités") ||
               questionText.contains("compétences")) {
      return "Conscience professionnelle";
    } else if (questionText.contains("sociabilité") ||
               questionText.contains("assertivité") ||
               questionText.contains("aménité")) {
      return "Extraversion";
    }
    return "";
  }

  // Générer un résumé basé sur les scores
  String genererResume() {
    Map<String, double> scores = calculerScores();
    StringBuffer resume = StringBuffer();

    scores.forEach((trait, score) {
      String description = _getDescription(trait, score);
      resume.writeln("$trait : $description (Score : ${score.toStringAsFixed(2)})");
    });

    return resume.toString();
  }

  // Obtenir la description en fonction des scores
  String _getDescription(String traitName, double score) {
    if (score < 3) {
      if (traitName == "Ouverture à l’expérience") {
        return "Imagination, Intérêts artistiques, Émotions profondes";
      }
    } else if (score >= 3 && score < 5) {
      if (traitName == "Conscience professionnelle") {
        return "Sens des compétences, Responsabilités";
      }
    } else if (score >= 6) {
      if (traitName == "Extraversion") {
        return "Aménité, Sociabilité, Assertivité";
      }
    }
    return "Non spécifié";
  }
}

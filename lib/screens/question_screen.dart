import 'package:flutter/material.dart';
import 'package:test_personnalite/models/question.dart';
import 'package:test_personnalite/screens/result_screen.dart';
import 'package:test_personnalite/services/resultat_service.dart';
import 'package:test_personnalite/services/serveur_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final ServeurQuestion serveurQuestion = ServeurQuestion();
  final CalculResultat calculResultat = CalculResultat();
  late Question currentquestions;
  int score = 0;
  int? selectedOptionIndex;
  bool? isCorrect;

  void verifierReponse(int reponseUtilisateur) {
    setState(() {
      selectedOptionIndex = reponseUtilisateur;
      score += reponseUtilisateur + 1;  // Score basé sur les choix (1 à 5)

      if (serveurQuestion.testTerminer()) {
        final resultat = calculResultat.getResultat(score);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultatScreen(
              score: score,
              resultat: resultat,
              onRestart: () {
                setState(() {
                  serveurQuestion.reinitialiser();
                  score = 0;
                  selectedOptionIndex = null;
                  Navigator.pop(context); // Revenir à QuestionScreen
                });
              },
            ),
          ),
        );

      } else {
        serveurQuestion.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Augmentez la hauteur ici
        child: AppBar(
          title: Row(
            children: [
              Image.asset(
                'lib/assets/images/icon.png',
                height: 70,
              ), // Ajoutez votre icône ici
              const SizedBox(width: 10), // Espace entre l'icône et le titre
              const Text(
                "Test de Personnalité",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              serveurQuestion.getText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20.0), // Espacement

            // Liste des boutons générés dynamiquement
            ...serveurQuestion
                .getOptions()
                .asMap()
                .entries
                .map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 13.0),
                          minimumSize: const Size(double.infinity, 50.0),
                          backgroundColor: Colors.blue[800],
                        ),
                        child: Text(
                          entry.value,
                          style: const TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          verifierReponse(entry.key);
                        },
                      ),
                    )),

            const SizedBox(height: 20.0), // Espacement

            Text(
              "Score: $score",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                fontSize: 28.0,
                color: Color.fromARGB(255, 12, 115, 199),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

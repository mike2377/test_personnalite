import 'package:flutter/material.dart';
import 'package:test_personnalite/models/question.dart';
import 'package:test_personnalite/services/serveur_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final ServeurQuestion serveurQuestion = ServeurQuestion();
  late Question currentquestions;
  int score = 0;
  int? selectedOptionIndex;
  bool? isCorrect;

  void verifierReponse(int reponseUtilisateur) {
    setState(() {
      if (serveurQuestion.testTerminer()) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Quiz terminé'),
                content: Text('Votre score : $score'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        score = 0;
                        serveurQuestion.reinitialiser();
                        selectedOptionIndex =
                            null; // Réinitialiser l'option sélectionnée
                        isCorrect = null;
                      });
                    },
                    child: const Text("Recommencer le Quiz"),
                  )
                ],
              );
            });
      } else {
        if (reponseUtilisateur == serveurQuestion.getSelectOption()) {
          score++;
          isCorrect = true;
        } else {
          isCorrect = false;
        }
        selectedOptionIndex = reponseUtilisateur;
        serveurQuestion.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Augmentez la hauteur ici
        child: AppBar(
          title: Row(
            children: [
              Image.asset('lib/assets/images/icon.png', height: 70,), // Ajoutez votre icône ici
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                "${serveurQuestion.getText()}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.bold),
              ),

            const Spacer(),
            
            Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: serveurQuestion
                      .getOptions()
                      .asMap()
                      .entries
                      .map((entry) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 13.0),
                                minimumSize: const Size(double.infinity, 50.0),
                                backgroundColor: Colors.blue[800],
                              ),
                              child: Text(
                                entry.value,
                                style: const TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                verifierReponse(entry.key);
                              },
                            ),
                          ))
                      .toList()),
            const Spacer(),
            const Text(
                "Score : ",
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

import 'package:flutter/material.dart';

class ResultatScreen extends StatelessWidget {
  final int score;
  final String resultat;
  final VoidCallback onRestart;

  const ResultatScreen({
    super.key,
    required this.score,
    required this.resultat,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Résultats",
          style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Votre Score : $score",
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              resultat,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Colors.blue[800],
              ),
              child: const Text(
                "Recommencer",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

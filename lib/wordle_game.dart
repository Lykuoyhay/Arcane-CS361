import 'dart:math';
import 'package:flutter/material.dart';

class WordleGame extends StatefulWidget {
  const WordleGame({super.key});

  @override
  _WordleGameState createState() => _WordleGameState();
}

class _WordleGameState extends State<WordleGame> {
  final List<String> wordList = ["apple", "grape", "mango", "peach", "berry"];
  late String targetWord;
  List<String> guesses = [];
  String currentGuess = "";

  @override
  void initState() {
    super.initState();
    targetWord = wordList[Random().nextInt(wordList.length)];
  }

  void submitGuess() {
    if (currentGuess.length == 5) {
      setState(() {
        guesses.add(currentGuess);
        currentGuess = "";
      });
    }
  }

  List<Color> evaluateGuess(String guess) {
    List<Color> result = List.filled(5, Colors.grey);
    for (int i = 0; i < 5; i++) {
      if (guess[i] == targetWord[i]) {
        result[i] = Colors.green;
      } else if (targetWord.contains(guess[i])) {
        result[i] = Colors.yellow;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wordle"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: guesses.length,
              itemBuilder: (context, index) {
                String guess = guesses[index];
                List<Color> colors = evaluateGuess(guess);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (i) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: colors[i],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        guess[i].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    if (value.length <= 5) {
                      setState(() {
                        currentGuess = value.toLowerCase();
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter your guess",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: submitGuess,
                  child: const Text("Submit Guess"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

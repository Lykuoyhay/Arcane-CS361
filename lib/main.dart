import 'package:flutter/material.dart';
import 'tic_tac_toe_game.dart'; // Import for "Play with Friends"
import 'tic_tac_toe_bot.dart'; // Import for "Play with Bot"

void main() {
  runApp(const ArcaneGameHub());
}

class ArcaneGameHub extends StatelessWidget {
  const ArcaneGameHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GameSelectionScreen(),
    );
  }
}

// Game Selection Screen (Tic Tac Toe, Wordle, Sudoku)
class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/arcane.jpg', // Path to your image file
              fit: BoxFit.cover,
            ),
          ),
          // Game Selection Title
          const Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Arcane Game Hub',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Game Buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Tic Tac Toe Mode Selection Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TicTacToeModeSelectionScreen(),
                      ),
                    );
                  },
                  style: _buttonStyle(Colors.blueAccent),
                  child: const Text(
                    'Tic Tac Toe',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder for Wordle
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Wordle Coming Soon!')),
                    );
                  },
                  style: _buttonStyle(Colors.greenAccent),
                  child: const Text(
                    'Wordle',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder for Sudoku
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sudoku Coming Soon!')),
                    );
                  },
                  style: _buttonStyle(Colors.orangeAccent),
                  child: const Text(
                    'Sudoku',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Button Style
  ButtonStyle _buttonStyle(Color color) {
    return ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

// Tic Tac Toe Mode Selection Screen
class TicTacToeModeSelectionScreen extends StatelessWidget {
  const TicTacToeModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe - Select Mode'),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/arcane.jpg', // Path to your image file
              fit: BoxFit.cover,
            ),
          ),
          // Mode Selection Buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Play with Friends
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  TicTacToeGame(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Play with Friends',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Play with Bot
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicTacToeBotGame(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Play with Bot',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

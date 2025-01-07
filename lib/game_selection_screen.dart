import 'package:flutter/material.dart';
import 'tictactoe_mode_screen.dart';

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arcane Game Hub'),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/arcane_background.png', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          // Game Buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Tic Tac Toe Mode Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TicTacToeModeScreen(),
                      ),
                    );
                  },
                  style: _buttonStyle(Colors.blue),
                  child: const Text('Tic Tac Toe'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder navigation for Wordle
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlaceholderScreen(
                          title: 'Wordle',
                        ),
                      ),
                    );
                  },
                  style: _buttonStyle(Colors.green),
                  child: const Text('Wordle'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Placeholder navigation for Sudoku
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlaceholderScreen(
                          title: 'Sudoku',
                        ),
                      ),
                    );
                  },
                  style: _buttonStyle(Colors.orange),
                  child: const Text('Sudoku'),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.indigo,
      ),
      body: const Center(
        child: Text(
          'Coming Soon!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

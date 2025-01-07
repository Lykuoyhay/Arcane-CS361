import 'package:flutter/material.dart';

class TicTacToeModeScreen extends StatelessWidget {
  const TicTacToeModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe - Select Mode'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigation logic for "Play with Friend"
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Play with Friend clicked!'),
                ));
              },
              style: _buttonStyle(Colors.blue),
              child: const Text('Play with Friend'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigation logic for "Play with Bot"
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Play with Bot clicked!'),
                ));
              },
              style: _buttonStyle(Colors.green),
              child: const Text('Play with Bot'),
            ),
          ],
        ),
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

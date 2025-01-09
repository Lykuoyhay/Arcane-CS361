import 'dart:math';
import 'package:flutter/material.dart';

class TicTacToeBotGame extends StatefulWidget {
  const TicTacToeBotGame({super.key});

  @override
  _TicTacToeBotGameState createState() => _TicTacToeBotGameState();
}

class _TicTacToeBotGameState extends State<TicTacToeBotGame> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String? winner;
  List<int>? winningPattern;

  final Random _random = Random();

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      winner = null;
      winningPattern = null;
    });
  }

  void _makeMove(int index) {
    if (board[index] == '' && winner == null) {
      setState(() {
        board[index] = currentPlayer;
        if (_checkWinner()) {
          winner = currentPlayer;
        } else if (!board.contains('')) {
          winner = 'Draw';
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
          if (currentPlayer == 'O') {
            _botMove();
          }
        }
      });
    }
  }

  void _botMove() {
    // Find all available positions
    List<int> availablePositions = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i] == '') {
        availablePositions.add(i);
      }
    }

    if (availablePositions.isNotEmpty) {
      int botIndex =
          availablePositions[_random.nextInt(availablePositions.length)];
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          board[botIndex] = 'O';
          if (_checkWinner()) {
            winner = 'O';
          } else if (!board.contains('')) {
            winner = 'Draw';
          } else {
            currentPlayer = 'X';
          }
        });
      });
    }
  }

  bool _checkWinner() {
    const winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] != '' &&
          board[pattern[0]] == board[pattern[1]] &&
          board[pattern[0]] == board[pattern[2]]) {
        winningPattern = pattern;
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe - Play with Bot',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/arcane1.jpg', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue[50]?.withOpacity(
                      0.8), // Add opacity to blend with the background
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          final isWinningCell = winningPattern != null &&
                              winningPattern!.contains(index);

                          return GestureDetector(
                            onTap: () => _makeMove(index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isWinningCell
                                    ? Colors.blue[100]
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: Colors.black, width: 1),
                              ),
                              child: Center(
                                child: Text(
                                  board[index],
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: isWinningCell
                                        ? Colors.blue
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      if (winningPattern != null)
                        CustomPaint(
                          size: Size.infinite,
                          painter: LineDrawer(winningPattern!),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (winner != null)
                Text(
                  winner == 'Draw' ? 'It\'s a Draw!' : 'Player $winner Wins!',
                  style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black background
                  foregroundColor: Colors.white, // White text
                ),
                child: const Text('Restart Game'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LineDrawer extends CustomPainter {
  final List<int> winningPattern;

  LineDrawer(this.winningPattern);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final cellSize = size.width / 3;

    // Map grid indices to their center coordinates
    Offset getCellCenter(int index) {
      final x = (index % 3) * cellSize + cellSize / 2;
      final y = (index ~/ 3) * cellSize + cellSize / 2;
      return Offset(x, y);
    }

    final start = getCellCenter(winningPattern[0]);
    final end = getCellCenter(winningPattern[2]);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

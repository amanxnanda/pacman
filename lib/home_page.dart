import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pacman/path.dart';
import 'package:pacman/pixel.dart';
import 'package:pacman/player.dart';

import 'constant_files.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  int player = numberInRow * 15 + 1;

  String direction = 'right';

  List<int> food = [];

  static bool reset = false;
  int score = 0;

  void resetGame() {
    setState(() {
      reset = true;
      player = numberInRow * 15 + 1;
      food.clear();
      direction = 'right';
      score = 0;
    });

    Future.delayed(Duration(seconds: 2), () {
      reset = false;
    });
  }

  void startGame() {
    getFood();
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (reset) {
        timer.cancel();
      }
      if (food.contains(player)) {
        food.remove(player);
        score++;
      }

      if (timer.isActive) {
        switch (direction) {
          case 'left':
            moveLeft();
            break;
          case 'right':
            moveRight();
            break;
          case 'up':
            moveUp();
            break;
          case 'down':
            moveDown();
            break;
        }
      }
    });
  }

  void getFood() {
    for (var i = 0; i < numberOfSquares; i++) {
      if (!barriers.contains(i)) {
        food.add(i);
      }
    }
  }

  void moveLeft() {
    setState(() {
      if (!barriers.contains(player - 1)) {
        player--;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (!barriers.contains(player + 1)) {
        player++;
      }
    });
  }

  void moveUp() {
    setState(() {
      if (!barriers.contains(player - numberInRow)) {
        player -= numberInRow;
      }
    });
  }

  void moveDown() {
    setState(() {
      if (!barriers.contains(player + numberInRow)) {
        player += numberInRow;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  direction = 'down';
                } else if (details.delta.dy < 0) {
                  direction = 'up';
                }
                print(direction);
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  direction = 'right';
                } else if (details.delta.dx < 0) {
                  direction = 'left';
                }
                print(direction);
              },
              child: Container(
                child: GridView.builder(
                  itemCount: numberOfSquares,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: numberInRow),
                  itemBuilder: (BuildContext context, int index) {
                    if (barriers.contains(index)) {
                      return MyPixel(
                        outerColor: Colors.blue[900],
                        innerColor: Colors.blue[700],
                      );
                    } else if (index == player) {
                      switch (direction) {
                        case 'left':
                          return RotatedBox(quarterTurns: 2, child: MyPlayer());
                          break;
                        case 'right':
                          return MyPlayer();
                          break;
                        case 'up':
                          return RotatedBox(quarterTurns: 3, child: MyPlayer());
                          break;
                        case 'down':
                          return RotatedBox(quarterTurns: 1, child: MyPlayer());
                          break;
                      }
                    }
                    if (food.contains(index)) {
                      return MyPath(
                        innerColor: Colors.yellow,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'SCORE: $score',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: startGame,
                        child: Card(
                          color: Colors.grey[800],
                          child: Text(
                            'P L A Y',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: resetGame,
                        child: Card(
                          color: Colors.grey[800],
                          child: Text(
                            'RESET',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

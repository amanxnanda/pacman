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

  void startGame() {
    Timer.periodic(Duration(milliseconds: 120), (timer) {
      setState(() {
        if (!barriers.contains(player + 1)) {
          player++;
        }
      });
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
                      return MyPlayer();
                    }

                    return MyPath(
                      innerColor: Colors.yellow,
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Score: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

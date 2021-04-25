import 'package:flutter/material.dart';
import 'package:pacman/path.dart';
import 'package:pacman/pixel.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  List<int> barriers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    22,
    33,
    44,
    55,
    66,
    77,
    99,
    110,
    121,
    132,
    143,
    154,
    165,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    175,
    164,
    153,
    142,
    131,
    120,
    109,
    87,
    76,
    65,
    54,
    43,
    32,
    21,
    156,
    145,
    134,
    123,
    162,
    151,
    140,
    129,
    158,
    147,
    148,
    149,
    160,
    100,
    101,
    102,
    103,
    114,
    125,
    108,
    107,
    106,
    105,
    116,
    127,
    78,
    79,
    80,
    81,
    70,
    59,
    86,
    85,
    84,
    83,
    72,
    61,
    24,
    35,
    46,
    57,
    30,
    41,
    52,
    63,
    26,
    37,
    38,
    39,
    28,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            flex: 6,
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
                      child: Text(index.toString()),
                    );
                  }

                  return MyPath(
                    outerColor: Colors.grey[900],
                    innerColor: Colors.yellow,
                    // child: Text(index.toString()),
                  );
                },
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
                  Text(
                    'P L A Y',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
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

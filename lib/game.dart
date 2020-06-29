import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:audioplayers/audio_cache.dart';

import 'children_at_different_game_states.dart';

enum Direction { LEFT, RIGHT, UP, DOWN }
enum GameState { START, RUNNING, FAILURE }

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GameState();
}

class _GameState extends State<Game> {
  AudioCache audioPlayer = AudioCache(respectSilence: true);

  @override
  void initState() {
    // playGameMusic();

    super.initState();
  }

  void playGameMusic() async {
    audioPlayer.play('lalala.wav');
    //var result = await audioPlayer.
  }

  void playMiniSound() {
    audioPlayer.play('Boinkk.mp3');
  }

  var snakePosition;
  Point newPointPosition;
  Timer timer;
  Direction _direction = Direction.UP;
  var gameState = GameState.START;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            //  color: Colors.grey[400],
            gradient: LinearGradient(
                colors: [
                  Color(0xFFED8D7C),
                  Color(0xFFAF1D54),
                  Color(0xFF951C55),
                  Color(0xFF751047),
                  Color(0xFF560A3B),
                  Color(0xFF6D1064),
                  Color(0xFF340645),
                  Color(0xFF1A0229),
                ],
                tileMode: TileMode.repeated,
                end: Alignment.topRight,
                begin: Alignment.bottomLeft),
            //backgroundBlendMode: BlendMode.dstATop
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: Offset(1, 5))
              ],
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15)),
              color: Colors.grey,
            ),
            height: MediaQuery.of(context).size.height * 0.80,
            width: MediaQuery.of(context).size.width * 0.80,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFFF42371),
                      Color(0xFFF53442),
                      Color(0xFFF5801C),
                      //  Color(0xFFF5B904),
                    ]),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(10),
                    ),
                    //       color: Colors.grey[700],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: EdgeInsets.all(10),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTapUp: (tapUpDetails) {
                        //  playGameMusic();
                        _handleTap(tapUpDetails);
                      },
                      child: _getChildBasedOnGameState(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: RichText(
                      //  textWidthBasis: TextWidthBasis.longestLine,

                      // textAlign: TextAlign.justify,
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Nintendo',
                          style:
                              TextStyle(fontSize: 20, fontFamily: 'Gill Sans'),
                        ),
                        TextSpan(
                          text: ' GAME BOY',
                          style: TextStyle(
                              fontFamily: 'Gill Sans',
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic,
                              fontSize: 20),
                        )
                      ]),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          playMiniSound();

                          _direction = Direction.UP;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Icon(Icons.arrow_drop_up, size: 50),
                      ),
                    ),
                    // SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              playMiniSound();

                              _direction = Direction.LEFT;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Icon(Icons.arrow_left, size: 50),
                          ),
                        ),
                        SizedBox(width: 40),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              playMiniSound();

                              _direction = Direction.RIGHT;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Icon(Icons.arrow_right, size: 50),
                          ),
                        ),
                      ],
                    ),
                    //    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          audioPlayer.play('Boinkk2.wav');

                          _direction = Direction.DOWN;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Icon(Icons.arrow_drop_down, size: 50),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void _handleTap(TapUpDetails tapUpDetails) {
    switch (gameState) {
      case GameState.START:
        startToRunState();
        break;
      case GameState.RUNNING:
        break;
      case GameState.FAILURE:
        setGameState(GameState.START);
        break;
    }
  }

  void startToRunState() {
    startingSnake();
    generatenewPoint();
    _direction = Direction.UP;
    setGameState(GameState.RUNNING);
    timer = new Timer.periodic(new Duration(milliseconds: 250), onTimeTick);
  }

  void startingSnake() {
    setState(() {
      final midPoint = (320 / 20 / 2);
      snakePosition = [
        Point(midPoint, midPoint - 1),
        Point(midPoint, midPoint),
        Point(midPoint, midPoint + 1),
      ];
    });
  }

  void generatenewPoint() {
    setState(() {
      Random rng = Random();
      var min = 0;
      var max = 250 ~/ 20;
      var nextX = min + rng.nextInt(max - min);
      var nextY = min + rng.nextInt(max - min);

      var newRedPoint = Point(nextX.toDouble(), nextY.toDouble());

      if (snakePosition.contains(newRedPoint)) {
        generatenewPoint();
      } else {
        newPointPosition = newRedPoint;
      }
    });
  }

  void setGameState(GameState _gameState) {
    setState(() {
      gameState = _gameState;
    });
  }

  Widget _getChildBasedOnGameState() {
    var child;
    switch (gameState) {
      case GameState.START:
        setState(() {
          //  if (game) playGameMusic();
          score = 0;
        });
        child = startingGameChild;
        break;

      case GameState.RUNNING:
        List<Positioned> snakePiecesWithNewPoints = List();
        snakePosition.forEach(
          (i) {
            snakePiecesWithNewPoints.add(
              Positioned(
                child: gameRunningChild,
                left: i.x * 15.5,
                top: i.y * 15.5,
              ),
            );
          },
        );
        final latestPoint = Positioned(
          child: newSnakePointInGame,
          left: newPointPosition.x * 15.5,
          top: newPointPosition.y * 15.5,
        );
        snakePiecesWithNewPoints.add(latestPoint);
        child = Stack(children: snakePiecesWithNewPoints);
        break;

      case GameState.FAILURE:
        timer.cancel();
        child = Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Text(
              "SCORE: $score \n\n Tap to Play",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
        break;
    }
    return child;
  }

  void onTimeTick(Timer timer) {
    setState(() {
      snakePosition.insert(0, getLatestSnake());
      snakePosition.removeLast();
    });

    var currentHeadPosition = snakePosition.first;
    if (currentHeadPosition.x < 0 || // RIGHT BOUNDARY
        currentHeadPosition.y < 0 || //LEFT BOUNDARY
        currentHeadPosition.x >
            MediaQuery.of(context).size.height * 0.4 / 20 || //TOP BOUNDARY
        currentHeadPosition.y >
            MediaQuery.of(context).size.width * 0.709 / 20) {
      //BOTTOM BOUNDARY
      setGameState(GameState.FAILURE);
      return;
    }

    if (snakePosition.first.x == newPointPosition.x &&
        snakePosition.first.y == newPointPosition.y) {
      generatenewPoint();
      setState(() {
        if (score <= 10)
          score = score + 1;
        //Score Multiplier---2X
        else if (score > 10 && score <= 25)
          score = score + 2;
        else
          //ScoreMultiplier-- 3X
          score = score + 3;
        snakePosition.insert(0, getLatestSnake());
      });
    }
  }

  Point getLatestSnake() {
    var newHeadPosition;

    switch (_direction) {
      case Direction.LEFT:
        var currentHeadPosition = snakePosition.first;
        newHeadPosition =
            Point(currentHeadPosition.x - 1, currentHeadPosition.y);
        break;

      case Direction.RIGHT:
        var currentHeadPos = snakePosition.first;
        newHeadPosition = Point(currentHeadPos.x + 1, currentHeadPos.y);
        break;

      case Direction.UP:
        var currentHeadPos = snakePosition.first;
        newHeadPosition = Point(currentHeadPos.x, currentHeadPos.y - 1);
        break;

      case Direction.DOWN:
        var currentHeadPos = snakePosition.first;
        newHeadPosition = Point(currentHeadPos.x, currentHeadPos.y + 1);
        break;
    }

    return newHeadPosition;
  }
}

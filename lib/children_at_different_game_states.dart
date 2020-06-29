import 'package:flutter/material.dart';
import 'dart:math';

final Widget startingGameChild = Container(
  width: 200,
  height: 200,
  padding: const EdgeInsets.all(32),
  child: Center(
    child: Text(
      "Tap to start!",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.purple,
      ),
    ),
  ),
);

// List<> colors = [Colors.red, Colors.blue, Colors.grey, Colors.purple];

// var randomColor = Random(colors);

final Widget gameRunningChild = Container(
  width: 15.5,
  height: 15.5,
  decoration: new BoxDecoration(
    color: const Color(0xFFFFFFFF),
    shape: BoxShape.circle,
  ),
);

final Widget newSnakePointInGame = Container(
  width: 15.5,
  height: 15.5,
  decoration: new BoxDecoration(
    color: Colors.purple,
    border: new Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(20),
  ),
);

//class which gives the snake HEAD
class Point {
  double x;
  double y;

  Point(double x, double y) {
    this.x = x;
    this.y = y;
  }
}

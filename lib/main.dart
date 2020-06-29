import 'package:cyberpunk/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       // primarySwatch: Colors.gr,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GameTime(),
    );
  }
}

class GameTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
      body: Game(),
    );
  }
}




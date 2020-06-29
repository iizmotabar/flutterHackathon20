import 'package:cyberpunk/game.dart';
import 'package:cyberpunk/screens/IntroScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      home: IntroScreen(),
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

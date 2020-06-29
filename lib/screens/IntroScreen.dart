import 'package:cyberpunk/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Opacity(
                  opacity: 0.1,
                  child: Image.network(
                      'https://www.itl.cat/pngfile/big/28-287251_retro-games-wallpaper-iphone.jpg'),
                ),
              ),
              Center(
                child: SafeArea(
                  child: Text(
                    'RETRO GAMEBOY',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: 'Pixel',
                    ),
                  ),
                ),
              ),
            ],
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GameTime(),
              ));
            },
            color: Colors.white,
            child: Text('LETS PLAY'),
          ),


          
        ],
      ),
    );
  }
}

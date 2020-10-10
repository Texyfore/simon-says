import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simon_says/pages/game.dart';
import 'package:simon_says/pages/gameLoad.dart';
import 'package:simon_says/pages/home.dart';
import 'package:simon_says/pages/settings.dart';
import 'package:simon_says/pages/stats.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/gameLoad',
      routes: {
        '/home': (context) => Home(),
        '/stats': (context) => Stats(),
        '/settings': (context) => Settings(),
        '/gameLoad': (context) => GameLoad(),
        '/game': (context) => Game(),
      },
    );
  }
}

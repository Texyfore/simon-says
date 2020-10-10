import 'package:flutter/material.dart';
import 'package:simon_says/pages/game.dart';
import 'package:simon_says/pages/gameLoad.dart';
import 'package:simon_says/pages/home.dart';
import 'package:simon_says/pages/settings.dart';
import 'package:simon_says/pages/stats.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/stats': (context) => Stats(),
    '/settings': (context) => Settings(),
    '/gameLoad': (context) => GameLoad(),
    '/game': (context) => Game(),
  },
));
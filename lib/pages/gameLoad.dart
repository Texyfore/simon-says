import 'dart:math';
import 'package:flutter/material.dart';

class GameLoad extends StatefulWidget {
  @override
  _GameLoadState createState() => _GameLoadState();
}

class _GameLoadState extends State<GameLoad> {

  final Color backgroundColor = Color(0xFF1D1E18);
  final Color letterColor = Color(0xFFFEFEFD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Text('gameLoad.dart'),
      ),
    );
  }
}

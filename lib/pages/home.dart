import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Color backgroundColor = Color(0xFF1D1E18);
  final Color letterColor = Color(0xFFFEFEFD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text('HOME'),
              ),
              body: Container(
                child: Text('home.dart'),
              ),
            ),
        ),
      ),
    );
  }
}

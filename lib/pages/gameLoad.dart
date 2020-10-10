import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GameLoad extends StatefulWidget {
  @override
  _GameLoadState createState() => _GameLoadState();
}

class _GameLoadState extends State<GameLoad> {

  final Color backgroundColor = Color(0xFF3F3F3F);
  final Color letterColor = Color(0xFFFEFEFD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            // Cím
            Text(
              'Ciceró\nMondja',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 40.0,
                color: letterColor,
              ),
            ),

            // Forgó
            SpinKitFadingCube(
              size: 40.0,
              color: letterColor,
            ),

            // Játék tulajdonságai
            Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                'Csempék: 9\nSebesség: 14',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22.0,
                  color: letterColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

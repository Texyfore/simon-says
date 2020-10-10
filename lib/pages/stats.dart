import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {

  final Color backgroundColor = Color(0xFF3F3F3F);
  final Color letterColor = Color(0xFFFEFEFD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
            // Cím vonalak között
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  Divider(
                    thickness: 1.5,
                    color: letterColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Statisztikák',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40.0,
                        color: letterColor,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: letterColor,
                  ),
                ],
              ),
            ),
            // Játszott játékok
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Játszott játékok\n20',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      color: letterColor,
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: letterColor,
                  ),
                ],
              ),
            ),
            // Leghosszabb sorozat
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Leghosszabb sorozat\n20',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      color: letterColor,
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: letterColor,
                  ),
                ],
              ),
            ),
            // Játszott idő
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Játszott idő\n10:10:10',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      color: letterColor,
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: letterColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

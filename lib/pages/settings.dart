import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

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
                      'Beállítások',
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
            // Csempék beállítása
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Beállítás név
                  Text(
                    'Csempék',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 26.0,
                      color: letterColor,
                    ),
                  ),
                  // Számláló
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Mínusz gomb
                      IconButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: letterColor,
                          ),
                          height: double.infinity,
                          width: double.infinity,
                          child: Icon(
                            Icons.remove_rounded,
                          ),
                        ),
                        onPressed: () {},
                        color: backgroundColor,
                        splashRadius: 20.0,
                        enableFeedback: true,
                        splashColor: Colors.white,
                      ),
                      // Szám
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '6',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 26.0,
                            color: letterColor,
                          ),
                        ),
                      ),
                      // Plusz gomb
                      IconButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: letterColor,
                          ),
                          height: double.infinity,
                          width: double.infinity,
                          child: Icon(
                            Icons.add_rounded,
                          ),
                        ),
                        onPressed: () {},
                        color: backgroundColor,
                        splashRadius: 20.0,
                        enableFeedback: true,
                        splashColor: Colors.white,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.5,
                    color: letterColor,
                  ),
                ],
              ),
            ),

            // Sebesség beállítása
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Beállítás név
                  Text(
                    'Sebesség',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 26.0,
                      color: letterColor,
                    ),
                  ),
                  // Számláló
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Mínusz gomb
                      IconButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: letterColor,
                          ),
                          height: double.infinity,
                          width: double.infinity,
                          child: Icon(
                            Icons.remove_rounded,
                          ),
                        ),
                        onPressed: () {},
                        color: backgroundColor,
                        splashRadius: 20.0,
                        enableFeedback: true,
                        splashColor: Colors.white,
                      ),
                      // Szám
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '6',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 26.0,
                            color: letterColor,
                          ),
                        ),
                      ),
                      // Plusz gomb
                      IconButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: letterColor,
                          ),
                          height: double.infinity,
                          width: double.infinity,
                          child: Icon(
                            Icons.add_rounded,
                          ),
                        ),
                        onPressed: () {},
                        color: backgroundColor,
                        splashRadius: 20.0,
                        enableFeedback: true,
                        splashColor: Colors.white,
                      ),
                    ],
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

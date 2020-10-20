import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simon_says/language.dart';

class GameOverWidget extends StatefulWidget {
  @override
  _GameOverWidgetState createState() => _GameOverWidgetState();
}

class _GameOverWidgetState extends State<GameOverWidget> {
  bool isEnabled = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        this.isEnabled = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, ModalRoute.withName('/home'));
        return true;
      },
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Szünet
                Text(
                  lang.gameover,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 50.0,
                    color: Colors.redAccent,
                    shadows: <Shadow>[
                      letterShadow,
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                // Játék újra
                ElevatedButton(
                  onPressed: !isEnabled
                      ? null
                      : () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/game", ModalRoute.withName('/home'));
                        },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.replay_rounded,
                        color: letterColor,
                        size: 28.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        lang.newgame,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          color: letterColor,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: backgroundColor,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: !isEnabled
                      ? null
                      : () {
                          Navigator.popUntil(
                              context, ModalRoute.withName('/home'));
                        },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.clear_rounded,
                        color: letterColor,
                        size: 28.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        lang.quit,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          color: letterColor,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: backgroundColor,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);
final Shadow letterShadow = Shadow(
  offset: Offset(1.0, 1.0),
  blurRadius: 2,
  color: Color.fromARGB(40, 0, 0, 0),
);

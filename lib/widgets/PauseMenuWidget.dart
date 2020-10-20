import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simon_says/language.dart';

class PauseMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Material(
      type: MaterialType.transparency,
      child: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 200.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Szünet
              Text(
                lang.paused,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30.0,
                  color: letterColor,
                  shadows: <Shadow>[
                    letterShadow,
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: letterColor,
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      lang.continuegame,
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
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
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

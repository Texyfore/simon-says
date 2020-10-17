import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameOverWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'Játék Vége',
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
                onPressed: () {
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
                      'Új játék',
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
                      'Kilépés',
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

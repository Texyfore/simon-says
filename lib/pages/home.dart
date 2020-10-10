import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:simon_says/pages/colorchanger.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color darkColor = Color(0xFF3F3F3F);
  final Color letterColor = Color(0xFFFEFEFD);
  final Shadow letterShadow = Shadow(
    offset: Offset(1.0, 1.0),
    blurRadius: 2,
    color: Color.fromARGB(40, 0, 0, 0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: ColorChanger(
          child: Padding(
            padding: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Cím
                Text(
                  'Ciceró\nMondja',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 40.0,
                    color: letterColor,
                    shadows: <Shadow>[
                      letterShadow,
                    ],
                  ),
                ),

                // Gombok
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Játék indítása gomb
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/gameLoad");
                        },
                        child: Text(
                          'Játék',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            color: letterColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: darkColor,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),

                      // Statisztikák gomb
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/stats");
                        },
                        child: Text(
                          'Statisztikák',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            color: letterColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: darkColor,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),

                      // Beállítások gomb
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/settings");
                        },
                        child: Text(
                          'Beállítások',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            color: letterColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: darkColor,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                        ),
                      ),
                    ],
                  ),
                ),

                // Csapatnév
                Text(
                  'Fejlesztették:\nPro-grammers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    color: letterColor,
                    shadows: <Shadow>[
                      letterShadow,
                    ]
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

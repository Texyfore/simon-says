import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:simon_says/bloc/volumeCubit.dart';
import 'package:simon_says/language.dart';
import 'package:simon_says/pages/colorchanger.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final Color darkColor = Color(0xFF3F3F3F);
  final Color letterColor = Color(0xFFFEFEFD);
  final Shadow letterShadow = Shadow(
    offset: Offset(1.0, 1.0),
    blurRadius: 2,
    color: Color.fromARGB(40, 0, 0, 0),
  );

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    var volume = context.bloc<VolumeCubit>();
    return VisibilityDetector(
      key: Key("home-visibility-detector"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          volume.set(1.0);
        } else {
          volume.set(0.0);
        }
      },
      child: Scaffold(
        body: SizedBox.expand(
          child: ColorChanger(
            child: Padding(
              padding: EdgeInsets.only(top: 120.0, bottom: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Cím
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.0),
                    child: Image(
                      image: AssetImage('assets/cicmoicon2.png'),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.gamepad_rounded,
                                color: letterColor,
                                size: 28.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                lang.play,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                  color: letterColor,
                                ),
                              ),
                              SizedBox(),
                            ],
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.equalizer_rounded,
                                color: letterColor,
                                size: 30.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                lang.statistics,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                  color: letterColor,
                                ),
                              ),
                            ],
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.settings_rounded,
                                color: letterColor,
                                size: 28.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                lang.settings,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                  color: letterColor,
                                ),
                              ),
                            ],
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
                    lang.devby("Pro-grammers"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16.0,
                        color: letterColor,
                        shadows: <Shadow>[
                          letterShadow,
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ) ;
  }
}

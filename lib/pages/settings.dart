import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simon_says/bloc/musicCubit.dart';
import 'package:simon_says/bloc/tilesCubit.dart';
import 'package:simon_says/widgets/settings/boolSetting.dart';
import 'package:simon_says/widgets/settings/speedSetting.dart';
import './../widgets/settings/numberSetting.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30.0,
          ),
          splashRadius: 25.0,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Cím
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              children: [
                SizedBox(height: 30.0,),
                Image(
                  image: AssetImage('assets/cicmoicon.png'),
                ),
                SizedBox(height: 50.0,)
              ],
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
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Divider(
              thickness: 1.5,
              color: letterColor,
              height: 1.5,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                NumberSetting<TilesCubit>(
                  name: "Csempék",
                ),
                // Sebesség beállítása
                SpeedSetting(
                  name: "Sebesség",
                ),
                BoolSetting<MusicCubit>(name: "Zene"),

                Padding(
                  padding: EdgeInsets.only(left: 120.0, right: 120.0, bottom: 30.0, top: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Beállítás név
                      Text(
                        'Nyelv',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 26.0,
                          color: letterColor,
                        ),
                      ),
                      // Kiválasztó gomb
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/");
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
                              'Játék',
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
                          primary: backgroundColor,
                          elevation: 0.0,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
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
        ],
      ),
    );
  }
}

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);

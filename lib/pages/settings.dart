import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simon_says/bloc/musicCubit.dart';
import 'package:simon_says/bloc/speedCubit.dart';
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
              ],
            ),
          ),
          Divider(
            thickness: 1.5,
            color: letterColor,
            height: 1.5,
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

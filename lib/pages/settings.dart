import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/bloc/tilesCubit.dart';
import './../widgets/settings/numberSetting.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tilesCubit = context.bloc<TilesCubit>();

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
            NumberSetting<TilesCubit>(
              name: "Csempék",
              cubit: tilesCubit,
            ),
            // Sebesség beállítása
            /*NumberSetting(
              name: "Sebesség",
            ),*/
          ],
        ),
      ),
    );
  }
}

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);

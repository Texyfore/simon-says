import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simon_says/bloc/speedCubit.dart';
import 'package:simon_says/bloc/tilesCubit.dart';
import 'package:simon_says/language.dart';

class GameLoad extends StatefulWidget {
  @override
  _GameLoadState createState() => _GameLoadState();
}

class _GameLoadState extends State<GameLoad> {
  final Color backgroundColor = Color(0xFF3F3F3F);
  final Color letterColor = Color(0xFFFEFEFD);

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, "/game");
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            // Cím
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Image(
                image: AssetImage('assets/cicmoicon.png'),
              ),
            ),

            // Forgó
            SpinKitFadingCube(
              size: 40.0,
              color: letterColor,
            ),

            // Játék tulajdonságai
            Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: BlocBuilder<TilesCubit, int>(builder: (context, tiles) {
                return BlocBuilder<SpeedCubit, Speed>(
                    builder: (context, speed) {
                  return Text(
                    '${lang.tiles_num(tiles)}\n${lang.speed_enum(speedToString(lang, speed))}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22.0,
                      color: letterColor,
                    ),
                  );
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}

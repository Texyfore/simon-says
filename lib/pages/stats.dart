import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/bloc/stats/gameTimeCubit.dart';
import 'package:simon_says/bloc/stats/gamesPlayedCubit.dart';
import 'package:simon_says/bloc/stats/longestStreakCubit.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  final Color backgroundColor = Color(0xFF3F3F3F);
  final Color letterColor = Color(0xFFFEFEFD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Image(
                image: AssetImage('assets/cicmoicon.png'),
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
                      'Statisztikák',
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
            // Játszott játékok
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<GamesPlayedCubit, int>(
                      builder: (context, gamesPlayed) {
                    return Text(
                      'Játszott játékok\n$gamesPlayed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: letterColor,
                      ),
                    );
                  }),
                  Divider(
                    thickness: 1.5,
                    color: letterColor,
                  ),
                ],
              ),
            ),
            // Leghosszabb sorozat
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<LongestStreakCubit, int>(
                      builder: (context, longestStreak) {
                    return Text(
                      'Leghosszabb sorozat\n$longestStreak',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: letterColor,
                      ),
                    );
                  }),
                  Divider(
                    thickness: 1.5,
                    color: letterColor,
                  ),
                ],
              ),
            ),
            // Játszott idő
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<GameTimeCubit, Duration>(
                      builder: (context, gametime) {
                    return Text(
                      'Játszott idő\n${gametime.toString().split(".")[0]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: letterColor,
                      ),
                    );
                  }),
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

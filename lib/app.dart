import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simon_says/bloc/musicCubit.dart';
import 'package:simon_says/bloc/stats/gamesPlayedCubit.dart';
import 'package:simon_says/bloc/stats/longestStreakCubit.dart';
import 'package:simon_says/pages/game.dart';
import 'package:simon_says/pages/gameLoad.dart';
import 'package:simon_says/pages/home.dart';
import 'package:simon_says/pages/settings.dart';
import 'package:simon_says/pages/stats.dart';
import 'package:simon_says/widgets/musicPlayer.dart';

import 'bloc/speedCubit.dart';
import 'bloc/stats/gameTimeCubit.dart';
import 'bloc/tilesCubit.dart';
import 'bloc/volumeCubit.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Building app");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    return FutureBuilder<SharedPreferences>(
        future: _prefs,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Material();
          }
          var prefs = snapshot.data;
          return MultiBlocProvider(
            providers: [
              //Settings
              BlocProvider(create: (_) => TilesCubit(prefs)),
              BlocProvider(create: (_) => SpeedCubit(prefs)),
              BlocProvider(create: (_) => MusicCubit(prefs)),
              //Stats
              BlocProvider(create: (_) => GamesPlayedCubit(prefs)),
              BlocProvider(create: (_) => GameTimeCubit(prefs)),
              BlocProvider(create: (_) => LongestStreakCubit(prefs)),
              //Music volume
              BlocProvider(create: (_) => VolumeCubit()),
            ],
            child: MusicPlayer(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: '/home',
                routes: {
                  '/home': (context) => Home(),
                  '/stats': (context) => Stats(),
                  '/settings': (context) => Settings(),
                  '/gameLoad': (context) => GameLoad(),
                  '/game': (context) => GameScreen(),
                },
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        //Settings
        BlocProvider(create: (_) => TilesCubit()),
        BlocProvider(create: (_) => SpeedCubit()),
        BlocProvider(create: (_) => MusicCubit()),
        //Music volume
        BlocProvider(create: (_) => VolumeCubit()),
        //Stats
        BlocProvider(create: (_) => GamesPlayedCubit()),
        BlocProvider(create: (_) => GameTimeCubit()),
        BlocProvider(create: (_) => LongestStreakCubit()),
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
  }
}

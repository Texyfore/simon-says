import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/bloc/musicCubit.dart';
import 'package:simon_says/pages/game.dart';
import 'package:simon_says/pages/gameLoad.dart';
import 'package:simon_says/pages/home.dart';
import 'package:simon_says/pages/settings.dart';
import 'package:simon_says/pages/stats.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:simon_says/widgets/musicPlayer.dart';

import 'bloc/speedCubit.dart';
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
        BlocProvider(create: (_) => TilesCubit()),
        BlocProvider(create: (_) => SpeedCubit()),
        BlocProvider(create: (_) => MusicCubit()),
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
  }
}

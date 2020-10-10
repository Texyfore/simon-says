import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/bloc/TilesCubit.dart';
import 'package:simon_says/pages/game.dart';
import 'package:simon_says/pages/gameLoad.dart';
import 'package:simon_says/pages/home.dart';
import 'package:simon_says/pages/settings.dart';
import 'package:simon_says/pages/stats.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Building app");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return BlocProvider<TilesCubit>(
      create: (_) => TilesCubit(),
      lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => Home(),
          '/stats': (context) => Stats(),
          '/settings': (context) => Settings(),
          '/gameLoad': (context) => GameLoad(),
          '/game': (context) => Game(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simon_says/bloc/languageCubit.dart';
import 'package:simon_says/language.dart';
import 'package:simon_says/pages/settingsSliver.dart';

import 'bloc/musicCubit.dart';
import 'bloc/speedCubit.dart';
import 'bloc/stats/gameTimeCubit.dart';
import 'bloc/stats/gamesPlayedCubit.dart';
import 'bloc/stats/longestStreakCubit.dart';
import 'bloc/tilesCubit.dart';
import 'bloc/volumeCubit.dart';
import 'pages/game.dart';
import 'pages/gameLoad.dart';
import 'pages/home.dart';
import 'pages/stats.dart';
import 'widgets/musicPlayer.dart';

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
              //Language selector
              BlocProvider(create: (_) => LanguageCubit(-1)),
              //Music volume
              BlocProvider(create: (_) => VolumeCubit()),
            ],
            child: MusicPlayer(child: BlocBuilder<LanguageCubit, int>(
                builder: (context, selectedLanguage) {
              return MaterialApp(
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: supportedLocales,
                locale: selectedLanguage > 0
                    ? supportedLanguages[selectedLanguage].locale
                    : null,
                localeListResolutionCallback: (locale, supportedLocales) {
                  var lang = locale.firstWhere(
                    (element) => supportedLocales.contains(element),
                    orElse: () => null,
                  );
                  if (lang != null) {
                    return lang;
                  }
                  for (var l in locale) {
                    lang = supportedLocales.firstWhere(
                      (element) => element.languageCode == l.languageCode,
                      orElse: () => null,
                    );
                    if (lang != null) {
                      return lang;
                    }
                  }
                  return Locale("en", "US");
                },
                debugShowCheckedModeBanner: false,
                initialRoute: '/home',
                routes: {
                  '/home': (context) => Home(),
                  '/stats': (context) => Stats(),
                  '/settings': (context) => SettingsSliver(),
                  '/gameLoad': (context) => GameLoad(),
                  '/game': (context) => GameScreen(),
                },
              );
            })),
          );
        });
  }
}

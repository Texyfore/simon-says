import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simon_says/l10n/messages_all.dart';

const supportedLanguages = [
  LanguageOptions(Locale("en", "US"), "English"),
  LanguageOptions(Locale("hu", "HU"), "Magyar"),
  LanguageOptions(Locale("de", "DE"), "Deutsche"),
  LanguageOptions(Locale("pl", "PL"), "Polski"),
  LanguageOptions(Locale("nl", "NL"), "Nederlands"),
  LanguageOptions(Locale("tr", "TR"), "Türk"),
  LanguageOptions(Locale("ro", "RO"), "Română"),
  LanguageOptions(Locale("ko", "KR"), "한국어"),
  LanguageOptions(Locale("ja", "JP"), "日本語"),
];

var supportedLocales = supportedLanguages.map((e) => e.locale).toList();

class LanguageOptions {
  final Locale locale;
  final String name;
  const LanguageOptions(this.locale, this.name);
}

class AppLocalizations {
  static AppLocalizationsDelegate delegate = AppLocalizationsDelegate();
  AppLocalizations(this.localeName);

  String localeName;

  static Future<AppLocalizations> load(Locale locale) async {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get play => Intl.message("Play", name: "play", locale: localeName);
  String get statistics =>
      Intl.message("Statistics", name: "statistics", locale: localeName);
  String get settings =>
      Intl.message("Settings", name: "settings", locale: localeName);
  String devby(String developer) => Intl.message("Made by:\n$developer",
      name: "devby",
      args: [developer],
      locale: localeName,
      examples: const {'developer': 'Pro-grammers'});
  String get tiles => Intl.message("Tiles", name: "tiles", locale: localeName);
  String get speed => Intl.message("Speed", name: "speed", locale: localeName);
  String get music => Intl.message("Music", name: "music", locale: localeName);
  String get gamesPlayed =>
      Intl.message("Games played", name: "gamesPlayed", locale: localeName);
  String get longestStreak =>
      Intl.message("Longest streak", name: "longestStreak", locale: localeName);
  String get gameTime =>
      Intl.message("Game time", name: "gameTime", locale: localeName);
  String tiles_num(int tiles) => Intl.message("Tiles: $tiles",
      name: "tiles_num",
      args: [tiles],
      locale: localeName,
      examples: const {'tiles': '5'});
  String speed_enum(String speed) => Intl.message("Speed: $speed",
      name: "speed_enum",
      args: [speed],
      locale: localeName,
      examples: const {'speed': 'Fast'});
  String get slow => Intl.message("Slow", name: "slow", locale: localeName);
  String get normal =>
      Intl.message("Normal", name: "normal", locale: localeName);
  String get fast => Intl.message("Fast", name: "fast", locale: localeName);
  String get veryfast =>
      Intl.message("Very fast", name: "veryfast", locale: localeName);
  String get paused =>
      Intl.message("Paused", name: "paused", locale: localeName);
  String get continuegame =>
      Intl.message("Continue", name: "continuegame", locale: localeName);
  String get quit => Intl.message("Quit", name: "quit", locale: localeName);
  String get gameover =>
      Intl.message("Game over", name: "gameover", locale: localeName);
  String get newgame =>
      Intl.message("New game", name: "newgame", locale: localeName);
  String get languages =>
      Intl.message("Languages", name: "languages", locale: localeName);
  String get translatorcredit =>
      Intl.message("Translated by the Pro-grammers team",
          name: "translatorcredit", locale: localeName);
  String get defaultlang => Intl.message("System language",
      name: "defaultlang",
      locale: localeName,
      desc: "Language set by the operating system");
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return supportedLocales.contains(locale);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    var localizations = await AppLocalizations.load(locale);
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

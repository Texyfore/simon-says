// What the fuck did you just fucking say about me, you little bitch?
// I’ll have you know I graduated top of my class in the Navy Seals, and I’ve been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills.
// I am trained in gorilla warfare and I’m the top sniper in the entire US armed forces.
// You are nothing to me but just another target.
// I will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words.
// You think you can get away with saying that shit to me over the Internet? Think again, fucker.
// As we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot.
// The storm that wipes out the pathetic little thing you call your life.
// You’re fucking dead, kid.
// I can be anywhere, anytime, and I can kill you in over seven hundred ways, and that’s just with my bare hands.
// Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit.
// If only you could have known what unholy retribution your little “clever” comment was about to bring down upon you, maybe you would have held your fucking tongue.
// But you couldn’t, you didn’t, and now you’re paying the price, you goddamn idiot.
// I will shit fury all over you and you will drown in it.
// You’re fucking dead, kiddo.

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

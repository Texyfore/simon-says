// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl_PL locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pl_PL';

  static m0(developer) => "Autorzy:\n${developer}";

  static m1(speed) => "Prędkość: ${speed}";

  static m2(tiles) => "Liczba kafelek: ${tiles}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "continuegame" : MessageLookupByLibrary.simpleMessage("Powrót do gry"),
    "devby" : m0,
    "fast" : MessageLookupByLibrary.simpleMessage("Szybko"),
    "gameTime" : MessageLookupByLibrary.simpleMessage("Czas gry"),
    "gameover" : MessageLookupByLibrary.simpleMessage("Koniec gry"),
    "gamesPlayed" : MessageLookupByLibrary.simpleMessage("Rozegrane gry"),
    "languages" : MessageLookupByLibrary.simpleMessage(""),
    "longestStreak" : MessageLookupByLibrary.simpleMessage("Kafelki z rzędu"),
    "music" : MessageLookupByLibrary.simpleMessage("Muzyka"),
    "newgame" : MessageLookupByLibrary.simpleMessage("Nowa gra"),
    "normal" : MessageLookupByLibrary.simpleMessage("Normalnie"),
    "paused" : MessageLookupByLibrary.simpleMessage("Gra zatrzymana"),
    "play" : MessageLookupByLibrary.simpleMessage("Nowa gra"),
    "quit" : MessageLookupByLibrary.simpleMessage("Wyjście"),
    "settings" : MessageLookupByLibrary.simpleMessage("Ustawienia"),
    "slow" : MessageLookupByLibrary.simpleMessage("Wolno"),
    "speed" : MessageLookupByLibrary.simpleMessage("Prędkość"),
    "speed_enum" : m1,
    "statistics" : MessageLookupByLibrary.simpleMessage("Statystyki"),
    "tiles" : MessageLookupByLibrary.simpleMessage("Liczba kafelek"),
    "tiles_num" : m2,
    "translatorcredit" : MessageLookupByLibrary.simpleMessage(""),
    "veryfast" : MessageLookupByLibrary.simpleMessage("Bardzo szybko")
  };
}

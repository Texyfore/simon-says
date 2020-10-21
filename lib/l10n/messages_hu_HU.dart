// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hu_HU locale. All the
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
  String get localeName => 'hu_HU';

  static m0(developer) => "Készítették:\n${developer}";

  static m1(speed) => "Sebesség: ${speed}";

  static m2(tiles) => "Csempék: ${tiles}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "continuegame" : MessageLookupByLibrary.simpleMessage("Folytatás"),
    "defaultlang" : MessageLookupByLibrary.simpleMessage("Rendszernyelv"),
    "devby" : m0,
    "fast" : MessageLookupByLibrary.simpleMessage("Gyors"),
    "gameTime" : MessageLookupByLibrary.simpleMessage("Játékidő"),
    "gameover" : MessageLookupByLibrary.simpleMessage("Játék vége"),
    "gamesPlayed" : MessageLookupByLibrary.simpleMessage("Játékok"),
    "languages" : MessageLookupByLibrary.simpleMessage("Nyelvek"),
    "longestStreak" : MessageLookupByLibrary.simpleMessage("Leghosszabb sorozat"),
    "music" : MessageLookupByLibrary.simpleMessage("Zene"),
    "newgame" : MessageLookupByLibrary.simpleMessage("Új játék"),
    "normal" : MessageLookupByLibrary.simpleMessage("Normál"),
    "paused" : MessageLookupByLibrary.simpleMessage("Szünet"),
    "play" : MessageLookupByLibrary.simpleMessage("Játék"),
    "quit" : MessageLookupByLibrary.simpleMessage("Kilépés"),
    "settings" : MessageLookupByLibrary.simpleMessage("Beállítások"),
    "slow" : MessageLookupByLibrary.simpleMessage("Lassú"),
    "speed" : MessageLookupByLibrary.simpleMessage("Sebesség"),
    "speed_enum" : m1,
    "statistics" : MessageLookupByLibrary.simpleMessage("Statisztikák"),
    "tiles" : MessageLookupByLibrary.simpleMessage("Csempék"),
    "tiles_num" : m2,
    "translatorcredit" : MessageLookupByLibrary.simpleMessage("Fordította a Pro-grammers csapata"),
    "veryfast" : MessageLookupByLibrary.simpleMessage("Nagyon gyors")
  };
}

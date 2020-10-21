// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de_DE locale. All the
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
  String get localeName => 'de_DE';

  static m0(developer) => "Hergestellt von:\n${developer}";

  static m1(speed) => "Geschwindigkeit: ${speed}";

  static m2(tiles) => "Kacheln: ${tiles}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "continuegame" : MessageLookupByLibrary.simpleMessage("fortfahren"),
    "devby" : m0,
    "fast" : MessageLookupByLibrary.simpleMessage("schnell"),
    "gameTime" : MessageLookupByLibrary.simpleMessage("Spiel Zeit"),
    "gameover" : MessageLookupByLibrary.simpleMessage("Spiel ist aus"),
    "gamesPlayed" : MessageLookupByLibrary.simpleMessage("gespielte Spiele"),
    "languages" : MessageLookupByLibrary.simpleMessage(""),
    "longestStreak" : MessageLookupByLibrary.simpleMessage("längstes Streak"),
    "music" : MessageLookupByLibrary.simpleMessage("Musik"),
    "newgame" : MessageLookupByLibrary.simpleMessage("neues Spiel"),
    "normal" : MessageLookupByLibrary.simpleMessage("normal"),
    "paused" : MessageLookupByLibrary.simpleMessage("gepaused"),
    "play" : MessageLookupByLibrary.simpleMessage("spielen"),
    "quit" : MessageLookupByLibrary.simpleMessage("ausloggen"),
    "settings" : MessageLookupByLibrary.simpleMessage("Einstellungen"),
    "slow" : MessageLookupByLibrary.simpleMessage("langsam"),
    "speed" : MessageLookupByLibrary.simpleMessage("Geschwindigkeit"),
    "speed_enum" : m1,
    "statistics" : MessageLookupByLibrary.simpleMessage("Statistik"),
    "tiles" : MessageLookupByLibrary.simpleMessage("Kacheln"),
    "tiles_num" : m2,
    "translatorcredit" : MessageLookupByLibrary.simpleMessage(""),
    "veryfast" : MessageLookupByLibrary.simpleMessage("sehr schnell")
  };
}

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nl_NL locale. All the
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
  String get localeName => 'nl_NL';

  static m0(developer) => "Gemaakt door:\n${developer}";

  static m1(speed) => "Snelheid: ${speed}";

  static m2(tiles) => "Tegels: ${tiles}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "continuegame" : MessageLookupByLibrary.simpleMessage("Doorgaan"),
    "devby" : m0,
    "fast" : MessageLookupByLibrary.simpleMessage("Snel"),
    "gameTime" : MessageLookupByLibrary.simpleMessage("Tijd gespeeld"),
    "gameover" : MessageLookupByLibrary.simpleMessage("Spel voorbij"),
    "gamesPlayed" : MessageLookupByLibrary.simpleMessage("Potjes gespeeld"),
    "languages" : MessageLookupByLibrary.simpleMessage(""),
    "longestStreak" : MessageLookupByLibrary.simpleMessage("Langste reeks"),
    "music" : MessageLookupByLibrary.simpleMessage("Muziek"),
    "newgame" : MessageLookupByLibrary.simpleMessage("Nieuw spel"),
    "normal" : MessageLookupByLibrary.simpleMessage("Middelmatig"),
    "paused" : MessageLookupByLibrary.simpleMessage("Gepauzeerd"),
    "play" : MessageLookupByLibrary.simpleMessage("Speel"),
    "quit" : MessageLookupByLibrary.simpleMessage("Sluiten"),
    "settings" : MessageLookupByLibrary.simpleMessage("Instellingen"),
    "slow" : MessageLookupByLibrary.simpleMessage("Langzaam"),
    "speed" : MessageLookupByLibrary.simpleMessage("Snelheid"),
    "speed_enum" : m1,
    "statistics" : MessageLookupByLibrary.simpleMessage("Statistieken"),
    "tiles" : MessageLookupByLibrary.simpleMessage("Tegels"),
    "tiles_num" : m2,
    "translatorcredit" : MessageLookupByLibrary.simpleMessage(""),
    "veryfast" : MessageLookupByLibrary.simpleMessage("Zeer Snel")
  };
}

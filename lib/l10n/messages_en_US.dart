// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  static m0(developer) => "Made by:\n${developer}";

  static m1(speed) => "Speed: ${speed}";

  static m2(tiles) => "Tiles: ${tiles}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "continuegame" : MessageLookupByLibrary.simpleMessage("Continue"),
    "devby" : m0,
    "fast" : MessageLookupByLibrary.simpleMessage("Fast"),
    "gameTime" : MessageLookupByLibrary.simpleMessage("Game time"),
    "gameover" : MessageLookupByLibrary.simpleMessage("Game over"),
    "gamesPlayed" : MessageLookupByLibrary.simpleMessage("Games played"),
    "languages" : MessageLookupByLibrary.simpleMessage("Languages"),
    "longestStreak" : MessageLookupByLibrary.simpleMessage("Longest streak"),
    "music" : MessageLookupByLibrary.simpleMessage("Music"),
    "newgame" : MessageLookupByLibrary.simpleMessage("New game"),
    "normal" : MessageLookupByLibrary.simpleMessage("Normal"),
    "paused" : MessageLookupByLibrary.simpleMessage("Paused"),
    "play" : MessageLookupByLibrary.simpleMessage("Play"),
    "quit" : MessageLookupByLibrary.simpleMessage("Quit"),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "slow" : MessageLookupByLibrary.simpleMessage("Slow"),
    "speed" : MessageLookupByLibrary.simpleMessage("Speed"),
    "speed_enum" : m1,
    "statistics" : MessageLookupByLibrary.simpleMessage("Statistics"),
    "tiles" : MessageLookupByLibrary.simpleMessage("Tiles"),
    "tiles_num" : m2,
    "translatorcredit" : MessageLookupByLibrary.simpleMessage("CREDIT HERE"),
    "veryfast" : MessageLookupByLibrary.simpleMessage("Very fast")
  };
}

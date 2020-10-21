// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ro_RO locale. All the
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
  String get localeName => 'ro_RO';

  static m0(developer) => "A făcut:\n${developer}";

  static m1(speed) => "Viteză";

  static m2(tiles) => "Pătrat: ${tiles}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "continuegame" : MessageLookupByLibrary.simpleMessage("Continuare"),
    "defaultlang" : MessageLookupByLibrary.simpleMessage("Limbajul sistemului"),
    "devby" : m0,
    "fast" : MessageLookupByLibrary.simpleMessage("Rapid"),
    "gameTime" : MessageLookupByLibrary.simpleMessage("Timp de joc"),
    "gameover" : MessageLookupByLibrary.simpleMessage("Jocul terminat"),
    "gamesPlayed" : MessageLookupByLibrary.simpleMessage("Jocuri"),
    "languages" : MessageLookupByLibrary.simpleMessage("Limbi"),
    "longestStreak" : MessageLookupByLibrary.simpleMessage("Seria câşstigătoare"),
    "music" : MessageLookupByLibrary.simpleMessage("Muzică"),
    "newgame" : MessageLookupByLibrary.simpleMessage("Joc nou"),
    "normal" : MessageLookupByLibrary.simpleMessage("Normal"),
    "paused" : MessageLookupByLibrary.simpleMessage("Pauză"),
    "play" : MessageLookupByLibrary.simpleMessage("Joc"),
    "quit" : MessageLookupByLibrary.simpleMessage("Ieşire"),
    "settings" : MessageLookupByLibrary.simpleMessage("Setări"),
    "slow" : MessageLookupByLibrary.simpleMessage("încet"),
    "speed" : MessageLookupByLibrary.simpleMessage("Viteză"),
    "speed_enum" : m1,
    "statistics" : MessageLookupByLibrary.simpleMessage("Statistici"),
    "tiles" : MessageLookupByLibrary.simpleMessage("Pătrat"),
    "tiles_num" : m2,
    "translatorcredit" : MessageLookupByLibrary.simpleMessage("Traducător: Kertész Balázs"),
    "veryfast" : MessageLookupByLibrary.simpleMessage("Foarte rapid")
  };
}

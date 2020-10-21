// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr_TR locale. All the
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
  String get localeName => 'tr_TR';

  static m0(developer) => "${developer} tarafından yapıldı.";

  static m1(speed) => "Hız: ${speed}";

  static m2(tiles) => "Kareler: ${tiles}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "continuegame" : MessageLookupByLibrary.simpleMessage("Devam et"),
    "devby" : m0,
    "fast" : MessageLookupByLibrary.simpleMessage("Hızlı"),
    "gameTime" : MessageLookupByLibrary.simpleMessage("Oyun süresi"),
    "gameover" : MessageLookupByLibrary.simpleMessage("Oyun Bitti"),
    "gamesPlayed" : MessageLookupByLibrary.simpleMessage("Oynanan oyun sayısı"),
    "languages" : MessageLookupByLibrary.simpleMessage(""),
    "longestStreak" : MessageLookupByLibrary.simpleMessage("Yanmadan oynanan en çok el sayısı"),
    "music" : MessageLookupByLibrary.simpleMessage("Müzik"),
    "newgame" : MessageLookupByLibrary.simpleMessage("Yeni Oyun"),
    "normal" : MessageLookupByLibrary.simpleMessage("Normal"),
    "paused" : MessageLookupByLibrary.simpleMessage("Durduruldu"),
    "play" : MessageLookupByLibrary.simpleMessage("Oyna"),
    "quit" : MessageLookupByLibrary.simpleMessage("Çık"),
    "settings" : MessageLookupByLibrary.simpleMessage("Ayarlar"),
    "slow" : MessageLookupByLibrary.simpleMessage("Yavaş"),
    "speed" : MessageLookupByLibrary.simpleMessage("Hız"),
    "speed_enum" : m1,
    "statistics" : MessageLookupByLibrary.simpleMessage("İstatistikler"),
    "tiles" : MessageLookupByLibrary.simpleMessage("Kareler"),
    "tiles_num" : m2,
    "translatorcredit" : MessageLookupByLibrary.simpleMessage("Translated to Turkish by Alper Kaya.\nTürkçeye Alper Kaya tarafından çevirilmiştir."),
    "veryfast" : MessageLookupByLibrary.simpleMessage("Çok Hızlı")
  };
}

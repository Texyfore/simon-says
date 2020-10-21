// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja_JP locale. All the
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
  String get localeName => 'ja_JP';

  static m0(developer) => "作られた:\n${developer}";

  static m1(speed) => "速度: ${speed}";

  static m2(tiles) => "タイル: ${tiles}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "continuegame" : MessageLookupByLibrary.simpleMessage("続ける"),
    "defaultlang" : MessageLookupByLibrary.simpleMessage("システム言語"),
    "devby" : m0,
    "fast" : MessageLookupByLibrary.simpleMessage("速い"),
    "gameTime" : MessageLookupByLibrary.simpleMessage("プレイした時間"),
    "gameover" : MessageLookupByLibrary.simpleMessage("ゲームオーバー"),
    "gamesPlayed" : MessageLookupByLibrary.simpleMessage("プレイしたゲーム"),
    "languages" : MessageLookupByLibrary.simpleMessage("言語"),
    "longestStreak" : MessageLookupByLibrary.simpleMessage("最長ストリーク"),
    "music" : MessageLookupByLibrary.simpleMessage("音楽"),
    "newgame" : MessageLookupByLibrary.simpleMessage("新ゲーム"),
    "normal" : MessageLookupByLibrary.simpleMessage("通常"),
    "paused" : MessageLookupByLibrary.simpleMessage("休止"),
    "play" : MessageLookupByLibrary.simpleMessage("プレー"),
    "quit" : MessageLookupByLibrary.simpleMessage("終了する"),
    "settings" : MessageLookupByLibrary.simpleMessage("設定"),
    "slow" : MessageLookupByLibrary.simpleMessage("遅い"),
    "speed" : MessageLookupByLibrary.simpleMessage("速度"),
    "speed_enum" : m1,
    "statistics" : MessageLookupByLibrary.simpleMessage("統計"),
    "tiles" : MessageLookupByLibrary.simpleMessage("タイル数"),
    "tiles_num" : m2,
    "translatorcredit" : MessageLookupByLibrary.simpleMessage("YertofeXによって日本語に訳されました。"),
    "veryfast" : MessageLookupByLibrary.simpleMessage("極速い")
  };
}

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko_KR locale. All the
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
  String get localeName => 'ko_KR';

  static m0(developer) => "의해 만들어진:\n${developer}";

  static m1(speed) => "속도: ${speed}";

  static m2(tiles) => "타일: ${tiles}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "continuegame" : MessageLookupByLibrary.simpleMessage("계속하다"),
    "defaultlang" : MessageLookupByLibrary.simpleMessage("시스템 언어"),
    "devby" : m0,
    "fast" : MessageLookupByLibrary.simpleMessage("빨리"),
    "gameTime" : MessageLookupByLibrary.simpleMessage("노는 시간"),
    "gameover" : MessageLookupByLibrary.simpleMessage("게임 오버"),
    "gamesPlayed" : MessageLookupByLibrary.simpleMessage("놀이를 하다"),
    "languages" : MessageLookupByLibrary.simpleMessage("언어"),
    "longestStreak" : MessageLookupByLibrary.simpleMessage("가장 긴 스트리크"),
    "music" : MessageLookupByLibrary.simpleMessage("음악"),
    "newgame" : MessageLookupByLibrary.simpleMessage("신작 게임"),
    "normal" : MessageLookupByLibrary.simpleMessage("정상"),
    "paused" : MessageLookupByLibrary.simpleMessage("일시 정지한"),
    "play" : MessageLookupByLibrary.simpleMessage("놀다"),
    "quit" : MessageLookupByLibrary.simpleMessage("그만두다"),
    "settings" : MessageLookupByLibrary.simpleMessage("설정"),
    "slow" : MessageLookupByLibrary.simpleMessage("느린"),
    "speed" : MessageLookupByLibrary.simpleMessage("속도"),
    "speed_enum" : m1,
    "statistics" : MessageLookupByLibrary.simpleMessage("통계학"),
    "tiles" : MessageLookupByLibrary.simpleMessage("타일"),
    "tiles_num" : m2,
    "translatorcredit" : MessageLookupByLibrary.simpleMessage("누군가에 의해 번역된"),
    "veryfast" : MessageLookupByLibrary.simpleMessage("매우 빨리")
  };
}

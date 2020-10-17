import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class ButtonState {
  Color color;
  Stream<ButtonEvent> incomingEvents;
  Stream onClickStream;
  StreamController _onClick;

  void onClick() {
    _onClick.add(null);
  }

  String sound;
  ButtonState({this.color, this.incomingEvents, this.sound}) {
    _onClick = StreamController();
    onClickStream = _onClick.stream;
  }
  AudioCache cache = new AudioCache();
  void dispose() {}

  Future<void> playSound() async {
    var player = await cache.play('sounds/notes/$sound.mp3');
    await player.onPlayerCompletion.first;
    player.dispose();
  }
}

class ButtonEvent {
  bool flashCPU;
  bool flashPlayer;
  ButtonEvent({this.flashCPU, this.flashPlayer});
}

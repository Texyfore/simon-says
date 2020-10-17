import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class ButtonState {
  Color color;
  Stream<ButtonEvent> incomingEvents;
  String sound;
  ButtonState({this.color, this.incomingEvents, this.sound});
  AudioCache cache = new AudioCache();
  void dispose() {}
  Future<void> playSound() async {
    var player = await cache.play('sounds/notes/$sound.mp3');
    await player.onPlayerCompletion.first;
    player.dispose();
  }
}

class ButtonEvent {
  bool flash;
  ButtonEvent({this.flash = false});
}

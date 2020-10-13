import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MusicPlayer extends StatefulWidget {
  Widget child;

  MusicPlayer({Key key, @required this.child}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

//TODO: React to Music setting
class _MusicPlayerState extends State<MusicPlayer> {
  Future<AudioPlayer> player;

  _MusicPlayerState() : super() {
    _loadAudio();
  }

  void _loadAudio() async {
    AudioCache cache = new AudioCache();
    player = cache.loop("sounds/cicero_loop_128.mp3");
    var _player = await player;
    await _player.pause();
  }

  Future<void> _playAudio() async {
    var _player = await player;
    await _player.resume();
  }

  Future<void> _pauseAudio() async {
    var _player = await player;
    await _player.pause();
  }

  void isActive() async {
    _playAudio();
  }

  void isInactive() async {
    _pauseAudio();
  }

  void disposePlayer() async {
    var _player = await player;
    await _player.stop();
  }

  @override
  void dispose() {
    //TODO: Sound disposal
    disposePlayer();
    super.dispose();
  }

  String targetName;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        onVisibilityChanged: (VisibilityInfo visibilityInfo) {
          if (visibilityInfo.visibleFraction > .5) {
            isActive();
          } else {
            isInactive();
          }
        },
        key: Key("music-visibility-detector"),
        child: this.widget.child);
  }
}

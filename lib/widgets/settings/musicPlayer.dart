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
class _MusicPlayerState extends State<MusicPlayer>
    with SingleTickerProviderStateMixin {
  Future<AudioPlayer> player;

  AnimationController _volumeController;
  @override
  void initState() {
    super.initState();
    _volumeController = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        debugLabel: "Music volume animator",
        vsync: this,
        value: 1.0,
        duration: Duration(seconds: 1));
    _volumeController.addListener(this._onVolumeAnimation);
    _loadAudio();
  }

  void _onVolumeAnimation() async {
    print('VOLUME CHANGE! ${_volumeController.value}');
    var _player = await player;
    await _player.setVolume(_volumeController.value);
  }

  void _loadAudio() async {
    AudioCache cache = new AudioCache();
    player = cache.loop("sounds/cicero_loop_128.mp3");
    //var _player = await player;
    //await _player.pause();
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
    print("Activating...");
    await _volumeController.animateTo(1.0);
    print("Active!");
  }

  void isInactive() async {
    print("DeActivating...");
    //await _volumeController.animateBack(0.25);
    _volumeController.value = 0.0;
    print("DeActive!");
  }

  void disposePlayer() async {
    var _player = await player;
    await _player.stop();
  }

  @override
  void dispose() {
    //TODO: Sound disposal
    disposePlayer();
    _volumeController.view.removeListener(this._onVolumeAnimation);
    _volumeController.dispose();
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
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/bloc/musicCubit.dart';
import 'package:simon_says/bloc/volumeCubit.dart';

class MusicPlayer extends StatefulWidget {
  final Widget child;

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
        duration: Duration(milliseconds: 200));
    _volumeController.addListener(this._onVolumeAnimation);
    _loadAudio();
  }

  void _onVolumeAnimation() async {
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

  void disposePlayer() async {
    var _player = await player;
    await _player.stop();
  }

  void animateVolume(double volume) async {
    await _volumeController.animateTo(volume);
  }

  @override
  void dispose() {
    disposePlayer();
    _volumeController.view.removeListener(this._onVolumeAnimation);
    _volumeController.dispose();
    super.dispose();
  }

  String targetName;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MusicCubit, bool>(
      listener: (context, state) {
        animateVolume(0);
      },
      child: BlocListener<VolumeCubit, double>(
          listener: (BuildContext context, volume) {
            var music = BlocProvider.of<MusicCubit>(context).state;
            var target = music ? volume : 0.0;
            animateVolume(target);
          },
          child: this.widget.child),
    );
  }
}

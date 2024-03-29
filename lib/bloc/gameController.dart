import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simon_says/bloc/buttonState.dart';
import 'package:simon_says/bloc/speedCubit.dart';

class _ButtonPreset {
  Color color;
  String sound;
  _ButtonPreset(this.color, this.sound);
}

class GameController {
  int buttonCount;
  Speed speed;
  List<_ControllableButton> buttons = List<_ControllableButton>();
  Timer _timer;
  Random random = Random();
  void Function() onGameOver;
  GameController({this.buttonCount = 4, this.speed = Speed.NORMAL});
  List<_ControllableButton> correctString = List();
  List<_ControllableButton> currentString = List();

  ValueNotifier<bool> isPlayingNotifier = ValueNotifier(false);
  bool get isPlaying {
    return isPlayingNotifier.value;
  }

  set isPlaying(bool value) {
    isPlayingNotifier.value = value;
  }

  void Function() roundCorrect;

  void nextRound() {
    print("Next round");
    isPlaying = true;
    Timer(Duration(seconds: 1), () {
      //Új gomb hozzáadása a kombinációhoz
      var index = random.nextInt(buttons.length);
      var button = buttons[index];
      correctString.add(button);
      currentString = List.from(correctString);
      //Kombináció lejátszása
      var i = 0;
      _timer = Timer.periodic(speedToDuration(this.speed), (timer) {
        if (i < correctString.length) {
          correctString[i].streamController.add(ButtonEvent(flashCPU: true));
          i++;
        } else {
          //Ha nincs több gomb, akkor hagyja abba a lejátszást
          _timer.cancel();
          print("Timer over");
          isPlaying = false;
        }
      });
    });
  }

  void input(_ControllableButton button) {
    //Ha éppen a kombináció játszódik le, akkor tiltsa le a bemeneted

    if (isPlaying) {
      return;
    }
    //Ha a következő gomb megegyezik a lenyomott gombbal
    if (currentString[0] == button) {
      //Egy gomb ellenőrizve
      currentString.removeAt(0);
      print("Right choice");
      //Ha nem kell több gombot ellenőrizni
      if (currentString.length == 0) {
        streak = correctString.length;
        print('$streak');
        if (roundCorrect != null) {
          roundCorrect();
        }
        //Next round
        nextRound();
      }
    } else {
      //Incorrect choice. Game Over
      print("Game over");
      if (onGameOver != null) {
        _gameEnded();
        onGameOver();
      }
    }
  }

  final List<_ButtonPreset> buttonPresets = [
    _ButtonPreset(Color(0xFFF34336), "F#8"),
    _ButtonPreset(Color(0xFFFEC008), "F8"),
    _ButtonPreset(Color(0xFF01BDD6), "E8"),
    _ButtonPreset(Color(0xFF9B28AF), "C#8"),
    _ButtonPreset(Color(0xFF4DB151), "C8"),
    _ButtonPreset(Color(0xFF1D944C), "A#7"),
    _ButtonPreset(Color(0xFFE62062), "G#7"),
    _ButtonPreset(Color(0xFFFFEA3A), "F#7"),
    _ButtonPreset(Color(0xFF91B16A), "F7"),
    _ButtonPreset(Color(0xFFC95D63), "E7"),
    _ButtonPreset(Color(0xFFC2F970), "C#7"),
    _ButtonPreset(Color(0xFFCA4DA7), "C7"),
    _ButtonPreset(Color(0xFF6889FE), "A#6"),
    _ButtonPreset(Color(0xFF5FB7D6), "G#6"),
    _ButtonPreset(Color(0xFFEDAE49), "F#6"),
    _ButtonPreset(Color(0xFFBEBAE5), "F6"),
    _ButtonPreset(Color(0xFF795246), "E6"),
    _ButtonPreset(Color(0xFF643AB6), "C#6"),
    _ButtonPreset(Color(0xFF4251B8), "C6"),
    _ButtonPreset(Color(0xFF009788), "A#5"),
    _ButtonPreset(Color(0xFFFD9805), "G#5"),
    _ButtonPreset(Color(0xFF581010), "F#5"),
    _ButtonPreset(Color(0xFF567922), "F5"),
    _ButtonPreset(Color(0xFF253940), "E5"),
  ];

  void Function() onGameStart;
  void Function(Duration gametime, int streak) onGameEnd;

  ValueNotifier<int> streakNotifier = ValueNotifier(0);
  int get streak {
    return streakNotifier.value;
  }

  set streak(int value) {
    streakNotifier.value = value;
  }

  bool hasEnded = false;
  void _gameEnded() {
    gametimer.stop();
    if (!hasEnded) {
      if (onGameEnd != null) {
        onGameEnd(gametimer.elapsed, streak);
      }
    }
  }

  Stopwatch gametimer = Stopwatch();

  List<ButtonState> startGame() {
    var states = List<ButtonState>();
    //Gombok létrehozása
    for (var i = 0; i < this.buttonCount; i++) {
      //Ezt a stream-et a dispose metódusban bezárjuk
      // ignore: close_sinks
      var stream = StreamController<ButtonEvent>();
      var preset = buttonPresets[i];
      var state = ButtonState(
        color: preset.color,
        sound: preset.sound,
        incomingEvents: stream.stream,
      );
      states.add(state);

      _ControllableButton controllable;
      //Feliratkozás a gomb onClick eventjére
      //Ezt a dispose metódusban elhalasszuk
      // ignore: cancel_subscriptions
      var subscription = state.onClickStream.listen((event) {
        if (!isPlaying) {
          stream.add(ButtonEvent(flashPlayer: true));
        }
        input(controllable);
      });
      controllable = _ControllableButton(state, stream, subscription);
      buttons.add(controllable);
    }
    nextRound();
    if (onGameStart != null) {
      onGameStart();
    }
    gametimer.start();
    return states;
  }

  void dispose() {
    _gameEnded();
    for (var button in buttons) {
      button.streamController.close();
      button.subscription.cancel();
    }
    if (_timer != null) {
      _timer.cancel();
    }
  }
}

class _ControllableButton {
  ButtonState buttonState;
  StreamController<ButtonEvent> streamController;
  StreamSubscription<dynamic> subscription;
  _ControllableButton(
      this.buttonState, this.streamController, this.subscription);
}

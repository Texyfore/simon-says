import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simon_says/bloc/buttonState.dart';

class _ButtonPreset {
  Color color;
  String sound;
  _ButtonPreset(this.color, this.sound);
}

class GameController {
  int buttonCount;
  List<_ControllableButton> buttons = List<_ControllableButton>();
  Timer _timer;
  Random random = Random();
  //TODO: Get game speed
  GameController({this.buttonCount}) {
    var _rand = Random();
  }
  List<_ControllableButton> correctString = List();
  List<_ControllableButton> currentString = List();
  void nextRound() {
    print("Next round");
    var index = random.nextInt(buttons.length);
    var button = buttons[index];
    correctString.add(button);
    currentString = List.from(correctString);
    var i = 0;
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (i < correctString.length) {
        correctString[i].streamController.add(ButtonEvent(flash: true));
        i++;
      } else {
        _timer.cancel();
        print("Timer over");
      }
    });
  }

  void input(_ControllableButton button) {
    if (_timer != null && _timer.isActive) {
      return;
    }
    if (currentString[0] == button) {
      //Correct choice
      currentString.removeAt(0);
      print("Right choice");
      if (currentString.length == 0) {
        //Next round
        Timer(Duration(seconds: 1), () {
          nextRound();
        });
      }
    } else {
      //Incorrect choice. Game Over
      //TODO: Game over
      print("Game over");
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

  List<ButtonState> generateButtonStates() {
    var states = List<ButtonState>();
    for (var i = 0; i < this.buttonCount; i++) {
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
      var subscription = state.onClickStream.listen((event) {
        stream.add(ButtonEvent(flash: true));
        input(controllable);
      });
      controllable = _ControllableButton(state, stream, subscription);
      buttons.add(controllable);
    }
    nextRound();
    return states;
  }

  void dispose() {
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

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
  GameController({this.buttonCount}) {
    var _rand = Random();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var index = _rand.nextInt(buttons.length);
      var button = buttons[index];
      button.streamController.add(ButtonEvent(flash: true));
    });
  }

  final List<_ButtonPreset> buttonPresets = [
    _ButtonPreset(Colors.red, "C#5"),
    _ButtonPreset(Colors.green, "E#5"),
    _ButtonPreset(Colors.blue, "F#5"),
    _ButtonPreset(Colors.orange, "G#5"),
  ];

  List<ButtonState> generateButtonStates() {
    var states = List<ButtonState>();
    for (var i = 0; i < this.buttonCount; i++) {
      var stream = StreamController<ButtonEvent>();
      var preset = buttonPresets[i];
      var state = ButtonState(
        color: preset.color,
        incomingEvents: stream.stream,
      );
      states.add(state);

      var controllable = _ControllableButton(state, stream);
      buttons.add(controllable);
    }
    return states;
  }

  void dispose() {
    for (var button in buttons) {
      button.streamController.close();
    }
    _timer.cancel();
  }
}

class _ControllableButton {
  ButtonState buttonState;
  StreamController<ButtonEvent> streamController;
  _ControllableButton(this.buttonState, this.streamController);
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simon_says/bloc/buttonState.dart';

class GameController {
  int buttonCount;
  List<_ControllableButton> buttons = List<_ControllableButton>();
  GameController({this.buttonCount});

  List<ButtonState> generateButtonStates() {
    var states = List<ButtonState>();
    for (var i = 0; i < this.buttonCount; i++) {
      var stream = StreamController<ButtonEvent>();
      var state = ButtonState(
        color: Colors.green,
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
  }
}

class _ControllableButton {
  ButtonState buttonState;
  StreamController<ButtonEvent> streamController;
  _ControllableButton(this.buttonState, this.streamController);
}

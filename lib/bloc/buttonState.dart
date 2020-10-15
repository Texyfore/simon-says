import 'package:flutter/material.dart';

class ButtonState {
  Color color;
  Stream<ButtonEvent> incomingEvents;
  ButtonState({this.color, this.incomingEvents});
}

class ButtonEvent {}

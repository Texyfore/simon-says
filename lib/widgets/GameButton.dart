import 'package:flutter/material.dart';
import 'package:simon_says/bloc/buttonState.dart';

class GameButton extends StatefulWidget {
  GameButton({Key key, this.buttonState}) : super(key: key);
  final ButtonState buttonState;
  @override
  _GameButtonState createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        height: 75,
        width: 75,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Hello'),
        ),
      ),
    );
  }
}

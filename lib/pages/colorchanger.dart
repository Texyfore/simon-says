import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ColorChanger extends StatefulWidget {
  final Widget child;
  const ColorChanger({Key key, this.child}) : super(key: key);

  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  int min = 0;
  int max = 15;
  Random rnd = new Random();
  int colorIndex = 0;
  _ColorChangerState() {
    colorIndex = min + rnd.nextInt(max - min);
  }

  static const int _duration = 3;
  Timer _timer;
  MaterialAccentColor get _color {
    return Colors.accents[colorIndex];
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: _duration), (Timer t) {
      // print('colorIndex = $colorIndex');
      setState(() {
        colorIndex =
            colorIndex == Colors.accents.length - 1 ? 0 : colorIndex + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: _color,
      duration: Duration(seconds: _duration),
      child: widget.child,
    );
  }
}

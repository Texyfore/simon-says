import 'dart:async';

import 'package:flutter/material.dart';

class ControlledSplash extends StatefulWidget {
  final Widget child;
  ControlledSplash({Key key, @required this.child}) : super(key: key);

  @override
  ControlledSplashState createState() => ControlledSplashState();
}

class ControlledSplashState extends State<ControlledSplash> {
  List<InteractiveInkFeature> splashes = List<InteractiveInkFeature>();

  @override
  void dispose() {
    var _splashes = List<InteractiveInkFeature>.from(splashes);
    for (var splash in _splashes) {
      splash.dispose();
    }
    super.dispose();
  }

  void splash() {
    print("splash");
    var renderBox = context.findRenderObject() as RenderBox;

    var inkController = Material.of(context);
    InteractiveInkFeature splash;
    void onRemoved() {
      if (splash != null && splashes.contains(splash)) {
        splashes.remove(splash);
      }
    }

    splash = InkRipple(
        controller: inkController,
        referenceBox: renderBox,
        textDirection: TextDirection.ltr,
        color: Color.fromARGB(128, 255, 255, 255),
        onRemoved: onRemoved,
        position: renderBox.paintBounds.center,
        containedInkWell: false);
    splashes.add(splash);
    Timer(Duration(milliseconds: 250), () {
      splash.confirm();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: Container(child: this.widget.child));
  }
}

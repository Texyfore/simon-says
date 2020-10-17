import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simon_says/bloc/buttonState.dart';
import 'package:simon_says/widgets/ControlledSplash.dart';

class GameButton extends StatefulWidget {
  GameButton({Key key, this.buttonState, this.tilesInRow, this.tilesCount})
      : super(key: key);
  final ButtonState buttonState;
  final int tilesInRow;
  final int tilesCount;
  @override
  _GameButtonState createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {
  StreamSubscription<ButtonEvent> _subscription;
  @override
  void initState() {
    super.initState();
    _subscription = widget.buttonState.incomingEvents.listen((event) {
      key.currentState.splash();
      widget.buttonState.playSound();
    });
  }

  bool flash = false;

  @override
  void dispose() {
    _subscription.cancel();
    widget.buttonState.dispose();
    super.dispose();
  }

  final key = new GlobalKey<ControlledSplashState>();

  @override
  Widget build(BuildContext context) {
    //Padding értéke
    var paddingSize = 6.0;
    // csempék száma egy teli sorban
    var nOfTilesInRow = widget.tilesInRow;
    var nOfButtons = widget.tilesCount;
    // egy csempe magassága és szélessége
    //TODO: Interaktív megoldás
    var tileSize = (nOfButtons == 7 || nOfButtons == 8)
        ? (MediaQuery.of(context).size.width / nOfTilesInRow) -
            (6 * nOfTilesInRow * paddingSize)
        : (MediaQuery.of(context).size.width / nOfTilesInRow) -
            (nOfTilesInRow * paddingSize);

    return Padding(
      padding: EdgeInsets.all(paddingSize),
      child: Container(
        height: tileSize,
        width: tileSize,
        child: Stack(
          children: [
            SizedBox.expand(
              child: GestureDetector(
                  onTap: () {
                    key.currentState.splash();
                  },
                  child: Stack(
                    children: [
                      Container(color: widget.buttonState.color),
                      Material(
                        color: Colors.transparent,
                        child: ControlledSplash(
                            key: key,
                            child: Container(color: Colors.transparent)),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

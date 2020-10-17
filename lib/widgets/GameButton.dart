import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simon_says/bloc/buttonState.dart';
import 'package:simon_says/widgets/ControlledSplash.dart';

class GameButton extends StatefulWidget {
  GameButton(
      {Key key,
      this.buttonState,
      this.tilesInRow,
      this.tilesCount,
      this.viewportSize})
      : super(key: key);
  final ButtonState buttonState;
  final int tilesInRow;
  final int tilesCount;
  final ValueNotifier<Size> viewportSize;
  @override
  _GameButtonState createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {
  StreamSubscription<ButtonEvent> _subscription;
  @override
  void initState() {
    super.initState();
    _subscription = widget.buttonState.incomingEvents.listen((event) {
      if (event.flashCPU == true) {
        key.currentState.splash(Color.fromARGB(128, 0, 0, 0));
      }
      if (event.flashPlayer == true) {
        key.currentState.splash(Color.fromARGB(128, 255, 255, 255));
      }
      if (event.flashCPU == true || event.flashPlayer == true) {
        widget.buttonState.playSound();
      }
    });
  }

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
    var nOfTilesInColumn = (nOfButtons / nOfTilesInRow).ceil();
    return Padding(
      padding: EdgeInsets.all(paddingSize),
      child: ValueListenableBuilder<Size>(
          valueListenable: widget.viewportSize,
          builder: (context, size, _) {
            if (size == null) {
              return Container();
            }
            var tileSizeW =
                (size.width / nOfTilesInRow) - (nOfTilesInRow * paddingSize);
            var tileSizeH = (size.height / nOfTilesInColumn) -
                (nOfTilesInColumn * paddingSize);
            var tileSize = min(tileSizeW, tileSizeH);
            return Container(
              height: tileSize,
              width: tileSize,
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: GestureDetector(
                        onTap: () {
                          widget.buttonState.onClick();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Stack(
                            children: [
                              Container(color: widget.buttonState.color),
                              Material(
                                color: Colors.transparent,
                                child: ControlledSplash(
                                    key: key,
                                    child:
                                        Container(color: Colors.transparent)),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

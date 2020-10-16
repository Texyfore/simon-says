import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simon_says/bloc/buttonState.dart';

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
      setState(() {
        this.flash = true;
        Timer(Duration(milliseconds: 500), () {
          setState(() {
            this.flash = false;
          });
        });
      });
    });
  }

  bool flash = false;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Padding értéke
    var paddingSize = 6.0;
    // csempék száma egy teli sorban
    var nOfTilesInRow = widget.tilesInRow;
    var nOfButtons = widget.tilesCount;
    // egy csempe magassága és szélessége
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
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: widget.buttonState.color),
                onPressed: () {},
                //child: Text('Hello'),
              ),
            ),
            Container(
              color: this.flash
                  ? Color.fromARGB(128, 128, 128, 128)
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

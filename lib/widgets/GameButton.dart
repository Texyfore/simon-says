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

    //Padding értéke
    var paddingSize = 6.0;
    // csempék száma egy teli sorban
    var nOfTilesInRow = 2;
    var nOfButtons = 7;
    // egy csempe magassága és szélessége
    var tileSize = (nOfButtons == 7 || nOfButtons == 8) ? (MediaQuery.of(context).size.width / nOfTilesInRow) - (6 * nOfTilesInRow * paddingSize) : (MediaQuery.of(context).size.width / nOfTilesInRow) - (nOfTilesInRow * paddingSize);

    return Padding(
      padding: EdgeInsets.all(paddingSize),
      child: Container(
        height: tileSize,
        width: tileSize,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Hello'),
        ),
      ),
    );
  }
}
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/bloc/buttonState.dart';
import 'package:simon_says/bloc/gameController.dart';
import 'package:simon_says/bloc/speedCubit.dart';
import 'package:simon_says/bloc/tilesCubit.dart';
import 'package:simon_says/widgets/GameButton.dart';
import 'package:simon_says/widgets/PauseMenuWidget.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Widget getRow(List<Widget> elements) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: elements,
    );
  }

  List<Widget> getRows(List<ButtonState> buttons) {
    var buttonCount = buttons.length;
    var rowCount = sqrt(buttonCount).floor();
    var rows = List<Widget>();
    var currentRow = List<Widget>();
    var i = 0;
    for (var j = 0; j < buttonCount; j++) {
      currentRow.add(GameButton(
          buttonState: buttons[j],
          tilesInRow: rowCount,
          tilesCount: buttonCount));
      i++;
      if (i >= rowCount) {
        i = 0;
        rows.add(getRow(currentRow));
        currentRow = List<Widget>();
      }
    }
    if (i != 0) {
      rows.add(getRow(currentRow));
    }
    return rows.reversed.toList();
  }

  GameController gameController;
  List<ButtonState> buttons;

  @override
  void initState() {
    super.initState();
    var buttonCount = context.bloc<TilesCubit>().state;
    var speed = context.bloc<SpeedCubit>().state;
    gameController = GameController(buttonCount: buttonCount, speed: speed);
    buttons = gameController.generateButtonStates();
  }

  @override
  void dispose() {
    gameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //I really hope we aren't planning to change the tile count during gameplay

    var rows = getRows(buttons);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => PauseMenuWidget(),
            );
          },
          icon: Icon(
            Icons.pause_rounded,
            size: 30.0,
          ),
          splashRadius: 25.0,
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: rows),
    );
  }
}

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/bloc/buttonState.dart';
import 'package:simon_says/bloc/gameController.dart';
import 'package:simon_says/bloc/speedCubit.dart';
import 'package:simon_says/bloc/tilesCubit.dart';
import 'package:simon_says/widgets/GameButton.dart';
import 'package:simon_says/widgets/GameOverWidget.dart';
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
        tilesCount: buttonCount,
        viewportSize: _columnSize,
      ));
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

  void onGameOver() {
    showDialog(
        context: context,
        builder: (context) => GameOverWidget(),
        barrierDismissible: false);
  }

  @override
  void initState() {
    super.initState();
    var buttonCount = context.bloc<TilesCubit>().state;
    var speed = context.bloc<SpeedCubit>().state;
    gameController = GameController(buttonCount: buttonCount, speed: speed);
    gameController.onGameOver = onGameOver;
    buttons = gameController.generateButtonStates();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _columnSize.value = _columnKey.currentContext.size;
    });
  }

  final ValueNotifier<Size> _columnSize = ValueNotifier(null);

  @override
  void dispose() {
    gameController.dispose();
    super.dispose();
  }

  void onBack() {
    showDialog(
      context: context,
      builder: (context) => PauseMenuWidget(),
    );
  }

  final GlobalKey _columnKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //I really hope we aren't planning to change the tile count during gameplay

    var rows = getRows(buttons);
    return WillPopScope(
      onWillPop: () async {
        onBack();
        return true;
      },
      child: ValueListenableBuilder(
          valueListenable: gameController.isPlayingNotifier,
          builder: (context, isPlaying, _) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 250),
              color: isPlaying ? backgroundColorAlt : backgroundColor,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 70.0,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: onBack,
                    icon: Icon(
                      Icons.pause_rounded,
                      size: 30.0,
                    ),
                    splashRadius: 25.0,
                  ),
                ),
                backgroundColor: Colors.transparent,
                body: Column(
                    key: _columnKey,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: rows),
              ),
            );
          }),
    );
  }
}

final Color backgroundColor = Color(0xFF3F3F3F);
final Color backgroundColorAlt = Color(0xFF161616);
final Color letterColor = Color(0xFFFEFEFD);

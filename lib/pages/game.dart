import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/bloc/buttonState.dart';
import 'package:simon_says/bloc/gameController.dart';
import 'package:simon_says/bloc/speedCubit.dart';
import 'package:simon_says/bloc/stats/gameTimeCubit.dart';
import 'package:simon_says/bloc/stats/gamesPlayedCubit.dart';
import 'package:simon_says/bloc/stats/longestStreakCubit.dart';
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

  AudioCache cache = new AudioCache();

  void onGameOver() {
    showDialog(
        context: context,
        builder: (context) => GameOverWidget(),
        barrierDismissible: false);
    () async {
      var player = await cache.play("sounds/cicero_game_over.mp3");
      await player.onPlayerCompletion.first;
      await player.dispose();
    }();
  }

  void roundCorrect() {
    () async {
      var player = await cache.play("sounds/cicero_pattern_ok.mp3");
      await player.onPlayerCompletion.first;
      await player.dispose();
    }();
  }

  GameTimeCubit gameTimeCubit;
  LongestStreakCubit longestStreakCubit;

  void onGameEnd(Duration gametime, int streak) {
    gameTimeCubit.add(gametime);
    longestStreakCubit.report(streak);
  }

  void onGameStart() {
    context.bloc<GamesPlayedCubit>().increase();
  }

  @override
  void initState() {
    super.initState();

    gameTimeCubit = context.bloc<GameTimeCubit>();
    longestStreakCubit = context.bloc<LongestStreakCubit>();

    var buttonCount = context.bloc<TilesCubit>().state;
    var speed = context.bloc<SpeedCubit>().state;
    gameController = GameController(buttonCount: buttonCount, speed: speed);
    gameController.onGameOver = onGameOver;
    gameController.onGameEnd = onGameEnd;
    gameController.onGameStart = onGameStart;
    gameController.roundCorrect = roundCorrect;
    buttons = gameController.startGame();

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
                  centerTitle: true,
                  // Sorozat hossza
                  title: ValueListenableBuilder(
                      valueListenable: gameController.streakNotifier,
                      builder: (context, streak, _) {
                        return Text(
                          '$streak',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22.0,
                            color: letterColor,
                          ),
                        );
                      }),
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

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simon_says/widgets/PauseMenuWidget.dart';

class GameScreen extends StatelessWidget {

  Widget GameButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Hello'),
        ),
      ),
    );
  }
  Widget getRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GameButton(context),
        GameButton(context),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getRow(context),
            getRow(context),
          ],
        ),
      ),
    );
  }
}

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LanguageSelectButton extends StatelessWidget {

  final Function onPressed;
  final String languageName;

  final Color backgroundColor = Color(0xFF3F3F3F);
  final Color letterColor = Color(0xFFFEFEFD);

  LanguageSelectButton({this.languageName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        languageName,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20.0,
          color: letterColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        elevation: 0.0,
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

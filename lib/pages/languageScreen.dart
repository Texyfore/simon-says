import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simon_says/language.dart';
import 'package:simon_says/widgets/languageSelectButton.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30.0,
          ),
          splashRadius: 25.0,
        ),
        title: Text(
          'Languages',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22.0,
            color: letterColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          LanguageSelectButton(
            onPressed: () {},
            languageName: 'English',
          ),
          LanguageSelectButton(
            onPressed: () {},
            languageName: 'Deutsche',
          ),
          LanguageSelectButton(
            onPressed: () {},
            languageName: 'Français',
          ),
          LanguageSelectButton(
            onPressed: () {},
            languageName: 'Magyar',
          ),
          LanguageSelectButton(
            onPressed: () {},
            languageName: 'Nederlands',
          ),
          LanguageSelectButton(
            onPressed: () {},
            languageName: 'Polskie',
          ),
          LanguageSelectButton(
            onPressed: () {},
            languageName: 'Türk',
          ),
          LanguageSelectButton(
            onPressed: () {},
            languageName: 'Română',
          ),
          LanguageSelectButton(
            onPressed: () {},
            languageName: '日本語',
          ),
          LanguageSelectButton(
            onPressed: () {},
            languageName: '한국어',
          ),
        ],
      ),
    );
  }
}

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);

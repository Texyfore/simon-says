import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simon_says/bloc/musicCubit.dart';
import 'package:simon_says/bloc/tilesCubit.dart';
import 'package:simon_says/language.dart';
import 'package:simon_says/widgets/languageSelectButton.dart';
import 'package:simon_says/widgets/settings/boolSetting.dart';
import 'package:simon_says/widgets/settings/speedSetting.dart';
import 'package:simon_says/widgets/settingsSliverHeader.dart';
import './../widgets/settings/numberSetting.dart';

final Color backgroundColor = Color(0xFF3F3F3F);
final Color letterColor = Color(0xFFFEFEFD);

class SettingsSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            expandedHeight: 260,
            backgroundColor: backgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Image(
                image: AssetImage('assets/cicmoicon.png'),
              ),
              centerTitle: true,
              titlePadding: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
            ),
          ),
          SettingsSliverHeader(
            title: lang.settings,
            padding: EdgeInsets.only(right: 40.0, left: 40.0, top: 20.0),
          ),
          SliverFixedExtentList(
            itemExtent: 170,
            delegate: SliverChildListDelegate(
              [
                NumberSetting<TilesCubit>(
                  name: lang.tiles,
                ),
                // Sebesség beállítása
                SpeedSetting(
                  name: lang.speed,
                ),
                BoolSetting<MusicCubit>(name: lang.music),
              ]
            ),
          ),
          SettingsSliverHeader(
            title: 'Languages',
            padding: EdgeInsets.only(right: 40.0, left: 40.0, top: 0.0),
          ),
          SliverFixedExtentList(
            itemExtent: 60,
            delegate: SliverChildListDelegate(
                [
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
                ]
            ),
          ),
        ],
      ),
    );
  }
}

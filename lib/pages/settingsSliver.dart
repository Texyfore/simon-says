import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/bloc/languageCubit.dart';
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
            padding: EdgeInsets.only(
              right: 40.0,
              left: 40.0,
              top: 20.0,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 170,
            delegate: SliverChildListDelegate([
              NumberSetting<TilesCubit>(
                name: lang.tiles,
              ),
              // Sebesség beállítása
              SpeedSetting(
                name: lang.speed,
              ),
              BoolSetting<MusicCubit>(name: lang.music),
            ]),
          ),
          SettingsSliverHeader(
            title: lang.languages,
            padding:
                EdgeInsets.only(right: 40.0, left: 40.0, top: 0.0, bottom: 0.0),
          ),
          BlocBuilder<LanguageCubit, int>(builder: (context, selectedLanguage) {
            return SliverFixedExtentList(
              itemExtent: 60,
              delegate: SliverChildBuilderDelegate((context, index) {
                var langCubit = context.bloc<LanguageCubit>();
                String languageName;
                Function() onClick;
                if (index == 0) {
                  languageName = lang.defaultlang;
                  onClick = () {
                    langCubit.setDefault();
                  };
                } else {
                  var _index = index - 1;
                  var language = supportedLanguages[_index];
                  languageName = language.name;
                  onClick = () {
                    print("Changing locale to: ${language.locale}");
                    langCubit.changeLocale(language.locale);
                  };
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.0),
                  child: RadioListTile(
                    title: Text(
                      languageName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: letterColor,
                      ),
                    ),
                    onChanged: (_) => onClick(),
                    value: index,
                    groupValue: selectedLanguage + 1,
                    activeColor: letterColor,
                  ),
                );
              }, childCount: supportedLanguages.length + 1),
            );
          }),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Divider(
                      thickness: 1.5,
                      color: letterColor,
                    ),
                    Text(
                      lang.translatorcredit,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        color: letterColor,
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                      color: letterColor,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

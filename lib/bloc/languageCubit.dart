import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simon_says/language.dart';

class LanguageCubit extends Cubit<int> {
  SharedPreferences prefs;
  Locale get pref {
    var localeName = prefs.getString("language");
    if (localeName == null) {
      return null;
    }
    var language = localeName.split("_")[0];
    var country = localeName.split("_")[1];
    var locale = Locale(language, country);
    return locale;
  }

  set pref(Locale val) {
    var localeName = val.toString();
    prefs.setString("language", localeName);
  }

  @override
  void onChange(Change<int> change) {
    pref = this.toLocale();
    super.onChange(change);
  }

  LanguageCubit(this.prefs)
      : assert(prefs != null),
        super(4) {
    var _pref = pref;
    if (_pref != null) {
      changeLocale(_pref);
    }
  }

  Locale toLocale() {
    return supportedLanguages[state].locale;
  }

  void changeLocale(Locale locale) {
    AppLocalizations.delegate.load(locale);
    var index =
        supportedLanguages.indexWhere((element) => element.locale == locale);
    if (index < 0) {
      index = -1;
    }

    setIndex(index);
  }

  void setDefault() {
    setIndex(-1);
  }

  void setIndex(int index) {
    emit(index);
  }
}

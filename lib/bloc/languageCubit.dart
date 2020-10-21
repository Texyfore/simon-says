import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simon_says/language.dart';

class LanguageCubit extends Cubit<int> {
  SharedPreferences prefs;
  int get pref {
    return prefs.getInt("language");
  }

  set pref(int val) {
    prefs.setInt("language", val);
  }

  @override
  void onChange(Change<int> change) {
    pref = change.nextState;
    super.onChange(change);
  }

  LanguageCubit(this.prefs)
      : assert(prefs != null),
        super(-1) {
    var _pref = pref;
    if (_pref != null) {
      setIndex(_pref);
    }
  }

  Locale toLocale() {
    return supportedLanguages[state].locale;
  }

  Locale valueToLocale(int value) {
    return supportedLanguages[value].locale;
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

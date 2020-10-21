import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:simon_says/language.dart';

class LanguageCubit extends Cubit<int> {
  LanguageCubit(int state) : super(state);

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

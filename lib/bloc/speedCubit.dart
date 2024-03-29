import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simon_says/language.dart';

class SpeedCubit extends Cubit<Speed> {
  SharedPreferences prefs;
  Speed get pref {
    var _pref = prefs.get("speed");
    if (_pref == null) {
      return null;
    }
    return Speed.values[_pref];
  }

  set pref(Speed val) {
    prefs.setInt("speed", val.index);
  }

  @override
  void onChange(Change<Speed> change) {
    pref = change.nextState;
    super.onChange(change);
  }

  SpeedCubit(this.prefs)
      : assert(prefs != null),
        super(Speed.NORMAL) {
    var _pref = pref;
    if (_pref != null) {
      emit(pref);
    }
  }

  void _increaseSpeed(int by) {
    var index = state.index;
    index += by;
    index %= Speed.values.length;
    emit(Speed.values[index]);
  }

  void increase() => _increaseSpeed(1);
  void decrease() => _increaseSpeed(-1);
}

enum Speed { SLOW, NORMAL, FAST, VERY_FAST }

String speedToString(AppLocalizations lang, Speed speed) {
  switch (speed) {
    case Speed.SLOW:
      return lang.slow;
      break;
    case Speed.NORMAL:
      return lang.normal;
      break;
    case Speed.FAST:
      return lang.fast;
      break;
    case Speed.VERY_FAST:
      return lang.veryfast;
      break;
  }
  return "Unknown";
}

Duration speedToDuration(Speed speed) {
  switch (speed) {
    case Speed.SLOW:
      return const Duration(seconds: 2);
      break;
    case Speed.NORMAL:
      return const Duration(seconds: 1);
      break;
    case Speed.FAST:
      return const Duration(milliseconds: 500);
      break;
    case Speed.VERY_FAST:
      return const Duration(milliseconds: 250);
      break;
  }
  return speedToDuration(Speed.NORMAL);
}

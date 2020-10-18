import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simon_says/widgets/settings/numberCubit.dart';

class TilesCubit extends NumberCubit {
  SharedPreferences prefs;
  int get pref {
    return prefs.get("tiles");
  }

  set pref(int val) {
    prefs.setInt("tiles", val);
  }

  @override
  void onChange(Change<int> change) {
    pref = change.nextState;
    super.onChange(change);
  }

  TilesCubit(this.prefs)
      : assert(prefs != null),
        super(4) {
    var _pref = pref;
    if (_pref != null) {
      emit(pref);
    }
  }

  static const int MAX = 24;
  static const int MIN = 4;

  _emitChecked(int val) {
    if (val > MAX) {
      emit(MAX);
      return;
    }
    if (val < MIN) {
      emit(MIN);
      return;
    }
    emit(val);
  }

  @override
  void increase() => _emitChecked(state + 1);
  @override
  void decrease() => _emitChecked(state - 1);
}

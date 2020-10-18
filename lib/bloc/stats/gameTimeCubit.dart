import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameTimeCubit extends Cubit<Duration> {
  SharedPreferences prefs;
  Duration get pref {
    var _pref = prefs.get("gametime");
    if (_pref == null) {
      return null;
    }
    return Duration(milliseconds: _pref);
  }

  set pref(Duration val) {
    prefs.setInt("gametime", val.inMilliseconds);
  }

  @override
  void onChange(Change<Duration> change) {
    pref = change.nextState;
    super.onChange(change);
  }

  GameTimeCubit(this.prefs)
      : assert(prefs != null),
        super(Duration.zero) {
    var _pref = pref;
    if (_pref != null) {
      emit(pref);
    }
  }

  void add(Duration value) => emit(state + value);
}

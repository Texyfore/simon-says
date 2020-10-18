import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GamesPlayedCubit extends Cubit<int> {
  SharedPreferences prefs;
  int get pref {
    return prefs.get("gamesplayed");
  }

  set pref(int val) {
    prefs.setInt("gamesplayed", val);
  }

  @override
  void onChange(Change<int> change) {
    pref = change.nextState;
    super.onChange(change);
  }

  GamesPlayedCubit(this.prefs)
      : assert(prefs != null),
        super(0) {
    var _pref = pref;
    if (_pref != null) {
      emit(pref);
    }
  }

  void increase() => emit(state + 1);
}

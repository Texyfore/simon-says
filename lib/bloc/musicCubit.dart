import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simon_says/widgets/settings/boolCubit.dart';

class MusicCubit extends BoolCubit {
  SharedPreferences prefs;
  bool get pref {
    return prefs.get("music");
  }

  set pref(bool val) {
    prefs.setBool("music", val);
  }

  @override
  void onChange(Change<bool> change) {
    pref = change.nextState;
    super.onChange(change);
  }

  MusicCubit(this.prefs)
      : assert(prefs != null),
        super(true) {
    var _pref = pref;
    if (_pref != null) {
      emit(pref);
    }
  }
  void value(bool value) => emit(value);
}

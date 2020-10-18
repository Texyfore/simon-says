import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LongestStreakCubit extends Cubit<int> {
  SharedPreferences prefs;
  int get pref {
    return prefs.get("longeststreak");
  }

  set pref(int val) {
    prefs.setInt("longeststreak", val);
  }

  @override
  void onChange(Change<int> change) {
    pref = change.nextState;
    super.onChange(change);
  }

  LongestStreakCubit(this.prefs)
      : assert(prefs != null),
        super(0) {
    var _pref = pref;
    if (_pref != null) {
      emit(pref);
    }
  }
  void report(int streak) {
    if (streak > state) {
      emit(streak);
    }
  }
}

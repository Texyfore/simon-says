import 'package:bloc/bloc.dart';
import 'package:simon_says/widgets/settings/numberCubit.dart';

class SpeedCubit extends Cubit<Speed> {
  SpeedCubit() : super(Speed.NORMAL);

  void _increaseSpeed(int by) {
    var index = state.index;
    index += by;
    index %= Speed.values.length;
    emit(Speed.values[index]);
  }

  @override
  void increase() => _increaseSpeed(1);
  @override
  void decrease() => _increaseSpeed(-1);
}

enum Speed { SLOW, NORMAL, FAST, VERY_FAST }

String speed_to_string(Speed speed) {
  switch (speed) {
    case Speed.SLOW:
      return "Lassú";
      break;
    case Speed.NORMAL:
      return "Normál";
      break;
    case Speed.FAST:
      return "Gyors";
      break;
    case Speed.VERY_FAST:
      return "Nagyon gyors";
      break;
  }
}

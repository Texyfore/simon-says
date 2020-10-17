import 'package:bloc/bloc.dart';

class SpeedCubit extends Cubit<Speed> {
  SpeedCubit() : super(Speed.NORMAL);

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

String speedToString(Speed speed) {
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
  return "Ismeretlen";
}

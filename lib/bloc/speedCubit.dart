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

import 'package:simon_says/widgets/settings/numberCubit.dart';

class TilesCubit extends NumberCubit {
  TilesCubit() : super(4);
  static const int MAX = 20;
  static const int MIN = 4;

  _emit_checked(int val) {
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
  void increase() => _emit_checked(state + 1);
  @override
  void decrease() => _emit_checked(state - 1);
}


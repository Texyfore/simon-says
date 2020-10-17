import 'package:simon_says/widgets/settings/numberCubit.dart';

class TilesCubit extends NumberCubit {
  TilesCubit() : super(4);
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

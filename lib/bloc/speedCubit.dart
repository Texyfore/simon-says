import 'package:simon_says/widgets/settings/numberCubit.dart';

class SpeedCubit extends NumberCubit {
  SpeedCubit() : super(0);
  @override
  void increase() => emit(state + 1);
  @override
  void decrease() => emit(state - 1);
}

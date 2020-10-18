import 'package:flutter_bloc/flutter_bloc.dart';

class LongestStreakCubit extends Cubit<int> {
  LongestStreakCubit() : super(0);

  void report(int streak) {
    if (streak > state) {
      emit(streak);
    }
  }
}

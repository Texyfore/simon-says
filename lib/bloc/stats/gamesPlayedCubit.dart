import 'package:bloc/bloc.dart';

class GamesPlayedCubit extends Cubit<int> {
  GamesPlayedCubit() : super(0);

  void increase() => emit(state + 1);
}

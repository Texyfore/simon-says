import 'package:bloc/bloc.dart';

class GameTimeCubit extends Cubit<Duration> {
  GameTimeCubit() : super(Duration.zero);

  void add(Duration value) => emit(state + value);
}

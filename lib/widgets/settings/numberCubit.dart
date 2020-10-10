import 'package:flutter_bloc/flutter_bloc.dart';

class NumberCubit extends Cubit<int> {
  NumberCubit(int state) : super(state);
  void increase() {}
  void decrease() {}
}

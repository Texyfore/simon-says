import 'package:bloc/bloc.dart';

class VolumeCubit extends Cubit<double> {
  VolumeCubit() : super(1.0);

  void set(double volume) => emit(volume);
}

import 'package:simon_says/widgets/settings/boolCubit.dart';

class MusicCubit extends BoolCubit {
  MusicCubit() : super(true);
  void value(bool value) => emit(value);
}

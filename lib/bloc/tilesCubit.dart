import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simon_says/widgets/settings/numberCubit.dart';

class TilesCubit extends NumberCubit {
  TilesCubit() : super(4);
  @override
  void increase() => emit(state + 1);
  @override
  void decrease() => emit(state + 1);
}

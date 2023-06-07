import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(
        ThemeState(switchValue: true),
      );
    });
    on<SwitchOffEvent>((event, emit) {
      emit(
        ThemeState(switchValue: false),
      );
    });
  }
}

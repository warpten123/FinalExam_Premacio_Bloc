import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(SwitchState(switchValue: true));
    });
    on<SwitchOffEvent>((event, emit) {
      emit(SwitchState(switchValue: false));
    });
  }
}

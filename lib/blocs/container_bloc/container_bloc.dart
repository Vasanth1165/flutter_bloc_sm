import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sm/blocs/container_bloc/container_event.dart';
import 'package:flutter_bloc_sm/blocs/container_bloc/container_state.dart';

class ContainerBloc extends Bloc<ContainerEvent, ContainerState> {
  ContainerBloc() : super(const ContainerState()) {
    on<SwitchEvent>(_switch);
    on<OpacityEvent>(_opacity);
  }

  void _switch(SwitchEvent event, Emitter<ContainerState> emit) {
    emit(state.copyWith(mode: !state.isSwitched));
  }

  void _opacity(OpacityEvent event, Emitter<ContainerState> emit) {
    emit(state.copyWith(opacityValue: event.opacity));
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sm/blocs/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_sm/blocs/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounterEvent>(_increment);
    on<DecrementCounterEvent>(_decrement);
    on<ResetCounterEvent>(_reset);
  }

  void _increment(IncrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.count + 1));
  }

  void _decrement(DecrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.count - 1));
  }

  void _reset(ResetCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0));
  }
}

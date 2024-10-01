
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      
    });
  }
}

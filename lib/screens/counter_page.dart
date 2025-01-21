import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sm/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_sm/blocs/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_sm/blocs/counter_bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter"),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            print(state.count);
            return Center(
              child: Text(
                "${state.count}",
                style: const TextStyle(color: Colors.black, fontSize: 128),
              ),
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounterEvent());
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: state.count == 0
                    ? null
                    : () {
                        context
                            .read<CounterBloc>()
                            .add(DecrementCounterEvent());
                      },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: state.count == 0
                    ? null
                    : () {
                        context.read<CounterBloc>().add(ResetCounterEvent());
                      },
                child: const Icon(Icons.exposure_zero_outlined),
              )
            ],
          ),
        ));
  }
}

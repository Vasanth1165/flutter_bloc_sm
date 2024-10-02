import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sm/blocs/container_bloc/container_bloc.dart';
import 'package:flutter_bloc_sm/blocs/container_bloc/container_event.dart';
import 'package:flutter_bloc_sm/blocs/container_bloc/container_state.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Turn on Notifications",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                BlocBuilder<ContainerBloc, ContainerState>(
                  buildWhen: (previous, current) => previous.isSwitched != current.isSwitched,
                  builder: (context, state) {
                    return CupertinoSwitch(
                        value: state.isSwitched,
                        onChanged: (val) {
                          context.read<ContainerBloc>().add(SwitchEvent());
                        });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<ContainerBloc, ContainerState>(
                builder: (context, state) => Container(
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width - 30,
                      color: Colors.red.withOpacity(state.opacity),
                    )),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<ContainerBloc, ContainerState>(
              builder: (context, state) => Slider(
                value: state.opacity,
                onChanged: (val) {
                  context.read<ContainerBloc>().add(OpacityEvent(opacity: val));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

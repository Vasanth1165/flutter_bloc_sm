import 'package:equatable/equatable.dart';

class ContainerState extends Equatable {
  final bool isSwitched;
  final double opacity;
  const ContainerState({this.isSwitched = false, this.opacity = 0.5});

  ContainerState copyWith({bool? mode, double? opacityValue}) {
    return ContainerState(
        isSwitched: mode ?? isSwitched, opacity: opacityValue ?? opacity);
  }

  @override
  List<Object> get props => [isSwitched, opacity];
}

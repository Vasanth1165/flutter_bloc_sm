abstract class ContainerEvent {}

class SwitchEvent extends ContainerEvent {}

class OpacityEvent extends ContainerEvent {
  final double opacity;
  OpacityEvent({required this.opacity});

  List<Object> get props => [opacity];
}
part of 'locator_bloc.dart';

abstract class LocatorEvent extends Equatable {
  const LocatorEvent();

  @override
  List<Object> get props => [];
}

class CalculateDistance extends LocatorEvent {
  const CalculateDistance();
}

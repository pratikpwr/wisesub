import 'package:equatable/equatable.dart';

abstract class AppInitializationEvent extends Equatable {
  const AppInitializationEvent();

  @override
  List<Object> get props => [];
}

class CheckOnboardingStatusEvent extends AppInitializationEvent {
  const CheckOnboardingStatusEvent();
}

class MarkOnboardingCompletedEvent extends AppInitializationEvent {
  const MarkOnboardingCompletedEvent();
}

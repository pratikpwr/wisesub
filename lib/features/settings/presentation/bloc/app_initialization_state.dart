import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';

class AppInitializationError extends AppInitializationState {
  final Failure failure;

  const AppInitializationError(this.failure);

  @override
  List<Object> get props => [failure];
}

class AppInitializationInitial extends AppInitializationState {
  const AppInitializationInitial();
}

class AppInitializationLoading extends AppInitializationState {
  const AppInitializationLoading();
}

abstract class AppInitializationState extends Equatable {
  const AppInitializationState();

  @override
  List<Object> get props => [];
}

class OnboardingCompleted extends AppInitializationState {
  const OnboardingCompleted();
}

class OnboardingRequired extends AppInitializationState {
  const OnboardingRequired();
}

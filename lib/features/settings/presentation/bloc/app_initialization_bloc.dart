import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/check_onboarding_status.dart';
import '../../domain/usecases/mark_onboarding_completed.dart';
import 'app_initialization_event.dart';
import 'app_initialization_state.dart';

class AppInitializationBloc
    extends Bloc<AppInitializationEvent, AppInitializationState> {
  final CheckOnboardingStatus _checkOnboardingStatus;
  final MarkOnboardingCompleted _markOnboardingCompleted;

  AppInitializationBloc({
    required CheckOnboardingStatus checkOnboardingStatus,
    required MarkOnboardingCompleted markOnboardingCompleted,
  }) : _checkOnboardingStatus = checkOnboardingStatus,
       _markOnboardingCompleted = markOnboardingCompleted,
       super(const AppInitializationInitial()) {
    on<CheckOnboardingStatusEvent>(_onCheckOnboardingStatus);
    on<MarkOnboardingCompletedEvent>(_onMarkOnboardingCompleted);
  }

  Future<void> _onCheckOnboardingStatus(
    CheckOnboardingStatusEvent event,
    Emitter<AppInitializationState> emit,
  ) async {
    emit(const AppInitializationLoading());

    final result = await _checkOnboardingStatus(NoParams());

    result.fold((failure) => emit(AppInitializationError(failure)), (
      isCompleted,
    ) {
      if (isCompleted) {
        emit(const OnboardingCompleted());
      } else {
        emit(const OnboardingRequired());
      }
    });
  }

  Future<void> _onMarkOnboardingCompleted(
    MarkOnboardingCompletedEvent event,
    Emitter<AppInitializationState> emit,
  ) async {
    final result = await _markOnboardingCompleted(NoParams());

    result.fold(
      (failure) => emit(AppInitializationError(failure)),
      (_) => emit(const OnboardingCompleted()),
    );
  }
}

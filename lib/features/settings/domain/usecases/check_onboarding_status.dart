import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/settings_repository.dart';

class CheckOnboardingStatus implements UseCase<bool, NoParams> {
  final SettingsRepository repository;

  CheckOnboardingStatus(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    final result = await repository.getSettings();
    return result.fold(
      (failure) => Left(failure),
      (settings) => Right(settings.isOnboardingCompleted),
    );
  }
}

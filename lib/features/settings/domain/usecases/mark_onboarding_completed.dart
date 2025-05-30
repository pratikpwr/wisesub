import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/settings_repository.dart';

class MarkOnboardingCompleted implements UseCase<Unit, NoParams> {
  final SettingsRepository repository;

  MarkOnboardingCompleted(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.markOnboardingCompleted();
  }
}

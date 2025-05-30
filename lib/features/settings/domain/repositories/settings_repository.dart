import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/app_settings.dart';

abstract class SettingsRepository {
  Future<Either<Failure, AppSettings>> getSettings();
  Future<Either<Failure, Unit>> markOnboardingCompleted();
  Future<Either<Failure, Unit>> updateSettings(AppSettings settings);
}

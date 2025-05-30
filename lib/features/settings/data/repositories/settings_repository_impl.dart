import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_data_source.dart';
import '../models/app_settings_model.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, AppSettings>> getSettings() async {
    try {
      final settingsModel = await localDataSource.getSettings();

      if (settingsModel != null) {
        return Right(settingsModel.toEntity());
      } else {
        // Return default settings if none exist
        final defaultSettings = const AppSettings(isOnboardingCompleted: false);
        return Right(defaultSettings);
      }
    } catch (e) {
      return const Left(StorageFailure('Failed to get settings'));
    }
  }

  @override
  Future<Either<Failure, Unit>> markOnboardingCompleted() async {
    try {
      final currentSettings = await localDataSource.getSettings();
      final updatedSettings =
          currentSettings?.copyWith(isOnboardingCompleted: true) ??
          const AppSettingsModel(isOnboardingCompleted: true);

      await localDataSource.updateSettings(updatedSettings);
      return const Right(unit);
    } catch (e) {
      return const Left(
        StorageFailure('Failed to mark onboarding as completed'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> updateSettings(AppSettings settings) async {
    try {
      final settingsModel = AppSettingsModel.fromEntity(settings);
      await localDataSource.updateSettings(settingsModel);
      return const Right(unit);
    } catch (e) {
      return const Left(StorageFailure('Failed to update settings'));
    }
  }
}

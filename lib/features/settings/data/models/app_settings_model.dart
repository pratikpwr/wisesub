import '../../domain/entities/app_settings.dart';

class AppSettingsModel extends AppSettings {
  const AppSettingsModel({required bool isOnboardingCompleted})
    : super(isOnboardingCompleted: isOnboardingCompleted);

  factory AppSettingsModel.fromEntity(AppSettings settings) {
    return AppSettingsModel(
      isOnboardingCompleted: settings.isOnboardingCompleted,
    );
  }

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) {
    return AppSettingsModel(
      isOnboardingCompleted: json['isOnboardingCompleted'] ?? false,
    );
  }

  @override
  AppSettingsModel copyWith({bool? isOnboardingCompleted}) {
    return AppSettingsModel(
      isOnboardingCompleted:
          isOnboardingCompleted ?? this.isOnboardingCompleted,
    );
  }

  AppSettings toEntity() {
    return AppSettings(isOnboardingCompleted: isOnboardingCompleted);
  }

  // Simple serialization for storage
  Map<String, dynamic> toJson() {
    return {'isOnboardingCompleted': isOnboardingCompleted};
  }
}

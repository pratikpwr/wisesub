import 'package:equatable/equatable.dart';

class AppSettings extends Equatable {
  final bool isOnboardingCompleted;

  const AppSettings({required this.isOnboardingCompleted});

  @override
  List<Object> get props => [isOnboardingCompleted];

  AppSettings copyWith({bool? isOnboardingCompleted}) {
    return AppSettings(
      isOnboardingCompleted:
          isOnboardingCompleted ?? this.isOnboardingCompleted,
    );
  }
}

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_theme.dart';

/// Theme extension for custom colors
@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension();

  LinearGradient get primaryGradient => AppColors.primaryGradient;
  LinearGradient get secondaryGradient => AppColors.secondaryGradient;

  List<Color> get subscriptionColors => AppColors.subscriptionColors;

  @override
  AppColorsExtension copyWith() => const AppColorsExtension();
  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    return const AppColorsExtension();
  }
}

/// Main app theme configuration
class AppTheme {
  /// Color scheme
  static const ColorScheme lightColorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.textPrimary,
    primaryContainer: AppColors.primaryDark,
    onPrimaryContainer: AppColors.textPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.background,
    secondaryContainer: AppColors.secondaryDark,
    onSecondaryContainer: AppColors.textPrimary,
    tertiary: AppColors.accentSecondary,
    onTertiary: AppColors.textPrimary,
    tertiaryContainer: AppColors.accentTertiary,
    onTertiaryContainer: AppColors.textPrimary,
    error: AppColors.error,
    onError: AppColors.textPrimary,
    errorContainer: AppColors.errorLight,
    onErrorContainer: AppColors.background,
    background: AppColors.background,
    onBackground: AppColors.textPrimary,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    surfaceVariant: AppColors.surfaceVariant,
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.border,
    outlineVariant: AppColors.borderLight,
    shadow: AppColors.shadowMedium,
    scrim: AppColors.overlayDark,
    inverseSurface: AppColors.textPrimary,
    onInverseSurface: AppColors.background,
    inversePrimary: AppColors.primaryLight,
    surfaceTint: AppColors.primary,
  );

  /// Dark theme
  static ThemeData get darkTheme => lightTheme;

  /// Light theme (currently using dark colors for dark mode app)
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: lightColorScheme,
    textTheme: AppTextTheme.lightTextTheme,
    fontFamily: AppTextTheme.fontFamily,
    scaffoldBackgroundColor: AppColors.background,
    splashColor: AppColors.primary.withOpacity(0.1),
    highlightColor: AppColors.primary.withOpacity(0.05),
    focusColor: AppColors.primary.withOpacity(0.12),
    hoverColor: AppColors.primary.withOpacity(0.04),
    extensions: const [AppColorsExtension()],
  );

  AppTheme._();
}

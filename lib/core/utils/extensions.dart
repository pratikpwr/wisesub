import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Theme-related extensions
extension BuildContextTheme on BuildContext {
  /// Get custom app colors extension
  AppColorsExtension? get appColors =>
      Theme.of(this).extension<AppColorsExtension>();

  Color get backgroundColor => colorScheme.background;

  /// Get color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get errorColor => colorScheme.error;

  /// Helper methods for quick access to common colors
  Color get primaryColor => colorScheme.primary;
  Color get surfaceColor => colorScheme.surface;

  /// Text color helpers
  Color get textPrimary => AppColors.textPrimary;
  Color get textSecondary => AppColors.textSecondary;

  Color get textTertiary => AppColors.textTertiary;

  /// Get text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get theme data
  ThemeData get theme => Theme.of(this);
}

extension ColorExtension on String {
  Color toColor() {
    return Color(int.parse(replaceFirst('#', '0xff')));
  }
}

extension ColorToHex on Color {
  String toHex() {
    return '#${value.toRadixString(16).padLeft(8, '0').substring(2)}';
  }
}

extension EitherExtensions<L, R> on Either<L, R> {
  /// Simplify chaining operations that can fail
  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) {
    return fold((l) => Left(l), (r) => f(r));
  }

  L getLeft() => (this as Left<L, R>).value;

  R getRight() => (this as Right<L, R>).value;

  /// For use in UI to map to different widgets based on success/failure
  Widget when({
    required Widget Function(L failure) failure,
    required Widget Function(R data) success,
  }) {
    return fold((l) => failure(l), (r) => success(r));
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension ThemeDataExtension on ThemeData {
  /// Check if theme is dark
  bool get isDark => brightness == Brightness.dark;

  /// Check if theme is light
  bool get isLight => brightness == Brightness.light;
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Custom text styles for specific use cases
class AppTextStyles {
  // Button text styles
  static TextStyle get buttonPrimary => AppTextTheme.getTextStyle(
    fontSize: 16,
    fontWeight: AppTextTheme.semiBold,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  static TextStyle get buttonSecondary => AppTextTheme.getTextStyle(
    fontSize: 16,
    fontWeight: AppTextTheme.medium,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  static TextStyle get buttonSmall => AppTextTheme.getTextStyle(
    fontSize: 14,
    fontWeight: AppTextTheme.medium,
    color: AppColors.textPrimary,
    height: 1.43,
  );

  static TextStyle get cardBadge => AppTextTheme.getTextStyle(
    fontSize: 14,
    fontWeight: AppTextTheme.medium,
    color: AppColors.textPrimaryContrast,
    height: 1.43,
  );

 
  static TextStyle get chipText => AppTextTheme.getTextStyle(
    fontSize: 12,
    fontWeight: AppTextTheme.regular,
    color: AppColors.textPrimary,
    height: 1.33,
  );

  static TextStyle get emptyStateSubtitle => AppTextTheme.getTextStyle(
    fontSize: 14,
    fontWeight: AppTextTheme.regular,
    color: AppColors.textQuaternary,
    height: 1.43,
  );

  // Empty state styles
  static TextStyle get emptyStateTitle => AppTextTheme.getTextStyle(
    fontSize: 18,
    fontWeight: AppTextTheme.medium,
    color: AppColors.textTertiary,
    height: 1.22,
  );

  // Status text styles
  static TextStyle get errorText => AppTextTheme.getTextStyle(
    fontSize: 14,
    fontWeight: AppTextTheme.regular,
    color: AppColors.error,
    height: 1.43,
  );

  // Font family getter that uses current font
  static String get fontFamily => AppTextTheme.fontFamily;

  static TextStyle get formSectionTitle => AppTextTheme.getTextStyle(
    fontSize: 16,
    fontWeight: AppTextTheme.medium,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  // Form styles
  static TextStyle get formTitle => AppTextTheme.getTextStyle(
    fontSize: 24,
    fontWeight: AppTextTheme.bold,
    color: AppColors.textPrimary,
    height: 1.17,
  );

  static TextStyle get heroSubtitle => AppTextTheme.getTextStyle(
    fontSize: 16,
    fontWeight: AppTextTheme.regular,
    color: AppColors.textTertiary,
    height: 1.5,
  );

  // Hero text styles
  static TextStyle get heroTitle => AppTextTheme.getTextStyle(
    fontSize: 36,
    fontWeight: AppTextTheme.bold,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle get inputHint => AppTextTheme.getTextStyle(
    fontSize: 16,
    fontWeight: AppTextTheme.regular,
    color: AppColors.inputHint,
    height: 1.25,
  );

  static TextStyle get inputLabel => AppTextTheme.getTextStyle(
    fontSize: 16,
    fontWeight: AppTextTheme.medium,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  // Input text styles
  static TextStyle get inputText => AppTextTheme.getTextStyle(
    fontSize: 16,
    fontWeight: AppTextTheme.regular,
    color: AppColors.inputText,
    height: 1.25,
  );


  // Section header styles
  static TextStyle get sectionHeader => AppTextTheme.getTextStyle(
    fontSize: 20,
    fontWeight: AppTextTheme.semiBold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  // Service icon text
  static TextStyle get serviceIconText => AppTextTheme.getTextStyle(
    fontSize: 32,
    fontWeight: AppTextTheme.semiBold,
    color: AppColors.background,
    height: 1.0,
  );



  static TextStyle get successText => AppTextTheme.getTextStyle(
    fontSize: 14,
    fontWeight: AppTextTheme.regular,
    color: AppColors.success,
    height: 1.43,
  );

  // Navigation text styles
  static TextStyle get tabSelected => AppTextTheme.getTextStyle(
    fontSize: 16,
    fontWeight: AppTextTheme.semiBold,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  static TextStyle get tabUnselected => AppTextTheme.getTextStyle(
    fontSize: 16,
    fontWeight: AppTextTheme.regular,
    color: AppColors.textTertiary,
    height: 1.25,
  );

  static TextStyle get warningText => AppTextTheme.getTextStyle(
    fontSize: 14,
    fontWeight: AppTextTheme.regular,
    color: AppColors.warning,
    height: 1.43,
  );

  AppTextStyles._();
}

class AppTextTheme {
  static const String _defaultFontFamily = 'Montserrat';

  static String _currentFontFamily = _defaultFontFamily;

  static const FontWeight light = FontWeight.w300;

  static const FontWeight regular = FontWeight.w400;

  static const FontWeight medium = FontWeight.w500;

  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static TextTheme get darkTextTheme => lightTextTheme;

  /// Get the current font family
  static String get fontFamily => _currentFontFamily;

  /// Material Design 3 Text Theme
  static TextTheme get lightTextTheme => TextTheme(
    // Display styles
    displayLarge: getTextStyle(
      fontSize: 57,
      fontWeight: regular,
      color: AppColors.textPrimary,
      height: 1.12,
      letterSpacing: -0.25,
    ),
    displayMedium: getTextStyle(
      fontSize: 45,
      fontWeight: regular,
      color: AppColors.textPrimary,
      height: 1.16,
    ),
    displaySmall: getTextStyle(
      fontSize: 36,
      fontWeight: regular,
      color: AppColors.textPrimary,
      height: 1.22,
    ),

    // Headline styles
    headlineLarge: getTextStyle(
      fontSize: 32,
      fontWeight: regular,
      color: AppColors.textPrimary,
      height: 1.25,
    ),
    headlineMedium: getTextStyle(
      fontSize: 28,
      fontWeight: regular,
      color: AppColors.textPrimary,
      height: 1.29,
    ),
    headlineSmall: getTextStyle(
      fontSize: 24,
      fontWeight: regular,
      color: AppColors.textPrimary,
      height: 1.33,
    ),

    // Title styles
    titleLarge: getTextStyle(
      fontSize: 22,
      fontWeight: regular,
      color: AppColors.textPrimary,
      height: 1.27,
    ),
    titleMedium: getTextStyle(
      fontSize: 16,
      fontWeight: medium,
      color: AppColors.textPrimary,
      height: 1.50,
      letterSpacing: 0.15,
    ),
    titleSmall: getTextStyle(
      fontSize: 14,
      fontWeight: medium,
      color: AppColors.textPrimary,
      height: 1.43,
      letterSpacing: 0.1,
    ),

    // Body styles
    bodyLarge: getTextStyle(
      fontSize: 16,
      fontWeight: regular,
      color: AppColors.textPrimary,
      height: 1.50,
      letterSpacing: 0.15,
    ),
    bodyMedium: getTextStyle(
      fontSize: 14,
      fontWeight: regular,
      color: AppColors.textPrimary,
      height: 1.43,
      letterSpacing: 0.25,
    ),
    bodySmall: getTextStyle(
      fontSize: 12,
      fontWeight: regular,
      color: AppColors.textSecondary,
      height: 1.33,
      letterSpacing: 0.4,
    ),

    // Label styles
    labelLarge: getTextStyle(
      fontSize: 14,
      fontWeight: medium,
      color: AppColors.textPrimary,
      height: 1.43,
      letterSpacing: 0.1,
    ),
    labelMedium: getTextStyle(
      fontSize: 12,
      fontWeight: medium,
      color: AppColors.textPrimary,
      height: 1.33,
      letterSpacing: 0.5,
    ),
    labelSmall: getTextStyle(
      fontSize: 11,
      fontWeight: medium,
      color: AppColors.textSecondary,
      height: 1.45,
      letterSpacing: 0.5,
    ),
  );

  AppTextTheme._();

  /// Get TextStyle with current Google Font
  static TextStyle getTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
    String? fontFamily,
  }) {
    return GoogleFonts.getFont(
      fontFamily ?? _currentFontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  /// Set the app font family by name
  static void setFontFamily(String fontFamily) {
    _currentFontFamily = fontFamily;
  }

  /// Helper methods
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Create a custom text style with specified font family
  static TextStyle withFont(
    String fontFamily, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return getTextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle withOpacity(TextStyle style, double opacity) {
    return style.copyWith(color: style.color?.withOpacity(opacity));
  }

  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
}

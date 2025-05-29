import 'package:flutter/material.dart';

/// App color constants
class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF0767e0);

  static const Color primaryLight = Color(0xFF5AC8FA);
  static const Color primaryDark = Color(0xFF0051D5);
  // Secondary colors
  static const Color secondary = Color(0xFF00D4AA);

  static const Color secondaryLight = Color(0xFF4CEDC4);
  static const Color secondaryDark = Color(0xFF00B894);
  // Background colors
  static const Color background = Color(0xFF0e0d12);

  static const Color backgroundSecondary = Color(0xFF17181d);
  static const Color backgroundTertiary = Color(0xFF18191f);
  static const Color surface = Color(0xFF252330);
  static const Color surfaceVariant = Color(0xFF2A2A2A);
  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textPrimaryContrast = Color(0xFF000000);

  static const Color textSecondary = Color(0xFFE5E5E7);
  static const Color textTertiary = Color(0xFF8E8E93);
  static const Color textQuaternary = Color(0xFF636366);
  static const Color textDisabled = Color(0xFF48484A);

  static const Color iconPrimary = Color(0xFFFFFFFF);
  static const Color iconPrimaryContrast = Color(0xFF000000);
  // Accent colors
  static const Color accent = Color(0xFF007AFF);

  static const Color accentSecondary = Color(0xFF5856D6);
  static const Color accentTertiary = Color(0xFFAF52DE);
  // Semantic colors
  static const Color success = Color(0xFF34C759);

  static const Color successLight = Color(0xFF59E26A);
  static const Color warning = Color(0xFFFF9500);
  static const Color warningLight = Color(0xFFFFB340);
  static const Color error = Color(0xFFFF3B30);
  static const Color errorLight = Color(0xFFFF6961);
  static const Color info = Color(0xFF007AFF);

  // Glass effect colors
  static const Color glassLight = Color(0x1AFFFFFF);

  static const Color glassMedium = Color(0x33FFFFFF);
  static const Color glassDark = Color(0x0DFFFFFF);
  // Border colors
  static const Color border = Color(0xFF38383A);

  static const Color borderLight = Color(0xFF48484A);
  static const Color borderDark = Color(0xFF1C1C1E);
  // Shadow colors
  static const Color shadowLight = Color(0x1A000000);

  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowDark = Color(0x4D000000);
  // Overlay colors
  static const Color overlayLight = Color(0x1A000000);

  static const Color overlayMedium = Color(0x4D000000);
  static const Color overlayDark = Color(0x80000000);
  // Input colors
  static const Color inputFill = Color(0xFF2A2A2A);

  static const Color inputBorder = Color(0xFF007AFF);
  static const Color inputBorderFocused = Color(0xFF5AC8FA);
  static const Color inputText = Color(0xFFFFFFFF);
  static const Color inputHint = Color(0xFF8E8E93);
  // Button colors
  static const Color buttonPrimary = Color(0xFF007AFF);

  static const Color buttonPrimaryPressed = Color(0xFF0051D5);
  static const Color buttonSecondary = Color(0xFF2A2A2A);
  static const Color buttonSecondaryPressed = Color(0xFF3A3A3A);
  static const Color buttonDanger = Color(0xFFFF3B30);
  static const Color buttonDangerPressed = Color(0xFFD70015);
  // Subscription card colors
  static const List<Color> subscriptionColors = [
    Color(0xFF007AFF),
    Color(0xFF00D4AA),
    Color(0xFFFF9500),
    Color(0xFFFF3B30),
    Color(0xFF5856D6),
    Color(0xFFAF52DE),
    Color(0xFF34C759),
    Color(0xFFFF2D92),
    Color(0xFF00C7BE),
    Color(0xFFFFCC02),
    Color(0xFF8E8E93),
    Color(0xFF636366),
  ];

  // Gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [background, backgroundSecondary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  AppColors._();

  static MaterialColor createMaterialColor(Color color) {
    List<double> strengths = [.05, .1, .2, .3, .4, .5, .6, .7, .8, .9];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      swatch[(i + 1) * 100] = Color.fromRGBO(
        r + ((255 - r) * (1 - strengths[i] - .1)).round(),
        g + ((255 - g) * (1 - strengths[i] - .1)).round(),
        b + ((255 - b) * (1 - strengths[i] - .1)).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  // Helper methods
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
}

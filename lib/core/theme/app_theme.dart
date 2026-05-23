import 'package:flutter/material.dart';

class AppColors {
  // Surfaces
  static const Color surface = Color(0xFFF8F9FF),
      surfaceDim = Color(0xFFCBDBF5),
      surfaceBright = Color(0xFFF8F9FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF),
      surfaceContainerLow = Color(0xFFEFF4FF),
      surfaceContainer = Color(0xFFE5EEFF),
      surfaceContainerHigh = Color(0xFFDCE9FF),
      surfaceContainerHighest = Color(0xFFD3E4FE);

  // Text & Borders
  static const Color onSurface = Color(0xFF0B1C30),
      onSurfaceVariant = Color(0xFF464555),
      outline = Color(0xFF777587),
      outlineVariant = Color(0xFFC7C4D8);
  static const Color textPrimary = Color(0xFF1E293B),
      textSecondary = Color(0xFF64748B),
      textMuted = Color(0xFF94A3B8),
      textDarkIndigo = Color(0xFF3730A3),
      textDarkNearBlack = Color(0xFF1B1B1B),
      textSlate700 = Color(0xFF334155);

  // Inverse & Functional
  static const Color inverseSurface = Color(0xFF213145),
      inverseOnSurface = Color(0xFFEAF1FF),
      success = Color(0xFF10B981),
      warning = Color(0xFFF59E0B),
      teal = Color(0xFF009688),
      error = Color(0xFFBA1A1A),
      errorContainer = Color(0xFFFFDAD6),
      onError = Color(0xFFFFFFFF),
      onErrorContainer = Color(0xFF93000A);

  // Brand, Primary, Secondary, Tertiary
  static const Color primary = Color(0xFF3525CD),
      primaryContainer = Color(0xFF4F46E5),
      onPrimary = Color(0xFFFFFFFF),
      onPrimaryContainer = Color(0xFFDAD7FF),
      brandPurple = Color(0xFF7C3AED);
  static const Color secondary = Color(0xFF712AE2),
      secondaryContainer = Color(0xFF8A4CFC),
      onSecondary = Color(0xFFFFFFFF),
      onSecondaryContainer = Color(0xFFFFFBFF);
  static const Color tertiary = Color(0xFF004D70),
      tertiaryContainer = Color(0xFF006693),
      onTertiary = Color(0xFFFFFFFF),
      onTertiaryContainer = Color(0xFFB8E0FF);

  // Extra UI & Accents
  static const Color divider = Color(0xFFF1F5F9),
      inputBorder = Color(0xFFE2E8F0),
      background = Color(0xFFF8F9FF),
      onBackground = Color(0xFF0B1C30),
      surfaceVariant = Color(0xFFD3E4FE);
  static const Color backgroundSlate = Color(0xFFF8FAFC),
      backgroundLightIndigo = Color(0xFFEEF2F6),
      borderLightLavender = Color(0xFFC7D2FE),
      borderInactive = Color(0xFFCBD5E1),
      containerSoftIndigo = Color(0xFFEEF2FF),
      containerLightIndigo = Color(0xFFE0E7FF);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryContainer, brandPurple],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

class AppSizes {
  // Spacing (8-point Grid)
  static const double zero = 0.0, xs = 4.0, s = 8.0, m = 12.0, l = 16.0, xl = 20.0, xxl = 24.0, xxxl = 32.0, huge = 40.0;
  // Sizing (Icons, Avatars, Logos)
  static const double iconS = 14.0, iconM = 18.0, iconL = 24.0, avatarS = 24.0, avatarM = 48.0, avatarL = 96.0, logoSize = 120.0;
  // Corner Radii
  static const double radiusS = 8.0, radiusM = 12.0, radiusL = 16.0, radiusXL = 24.0, radiusXXL = 28.0;
}

import 'package:flutter/material.dart';

class AppColors {
  // Surface Colors
  static const Color surface = Color(0xFFF8F9FF);
  static const Color surfaceDim = Color(0xFFCBDBF5);
  static const Color surfaceBright = Color(0xFFF8F9FF);

  // Surface Containers
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFEFF4FF);
  static const Color surfaceContainer = Color(0xFFE5EEFF);
  static const Color surfaceContainerHigh = Color(0xFFDCE9FF);
  static const Color surfaceContainerHighest = Color(0xFFD3E4FE);

  // Text Colors
  static const Color onSurface = Color(0xFF0B1C30);
  static const Color onSurfaceVariant = Color(0xFF464555);

  // Inverse Colors
  static const Color inverseSurface = Color(0xFF213145);
  static const Color inverseOnSurface = Color(0xFFEAF1FF);

  // Borders
  static const Color outline = Color(0xFF777587);
  static const Color outlineVariant = Color(0xFFC7C4D8);

  // Primary
  static const Color primary = Color(0xFF3525CD);
  static const Color primaryContainer = Color(0xFF4F46E5);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFFDAD7FF);

  // Secondary
  static const Color secondary = Color(0xFF712AE2);
  static const Color secondaryContainer = Color(0xFF8A4CFC);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFFFFFBFF);

  // Tertiary
  static const Color tertiary = Color(0xFF004D70);
  static const Color tertiaryContainer = Color(0xFF006693);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryContainer = Color(0xFFB8E0FF);

  // Error
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF93000A);

  // Background
  static const Color background = Color(0xFFF8F9FF);
  static const Color onBackground = Color(0xFF0B1C30);

  // Surface Variant
  static const Color surfaceVariant = Color(0xFFD3E4FE);

  static const Color brandPurple = Color(0xFF7C3AED);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      primaryContainer,
      brandPurple,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Functional Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color teal = Color(0xFF009688);

  // Extra UI Colors
  static const Color divider = Color(0xFFF1F5F9);
  static const Color inputBorder = Color(0xFFE2E8F0);

  // Additional UI & Slate/Indigo Accents
  static const Color textPrimary = Color(0xFF1E293B);      // slate-800
  static const Color textSecondary = Color(0xFF64748B);    // slate-500
  static const Color textMuted = Color(0xFF94A3B8);        // slate-400
  static const Color textDarkIndigo = Color(0xFF3730A3);   // indigo-800
  static const Color textDarkNearBlack = Color(0xFF1B1B1B); // slate-900 / near black
  static const Color textSlate700 = Color(0xFF334155);      // slate-700
  
  static const Color backgroundSlate = Color(0xFFF8FAFC);  // slate-50
  static const Color backgroundLightIndigo = Color(0xFFEEF2F6); // indigo-50/100 accent
  static const Color borderLightLavender = Color(0xFFC7D2FE);   // indigo-200
  static const Color borderInactive = Color(0xFFCBD5E1);        // slate-300
  
  static const Color containerSoftIndigo = Color(0xFFEEF2FF);   // indigo-50
  static const Color containerLightIndigo = Color(0xFFE0E7FF);  // indigo-100
}
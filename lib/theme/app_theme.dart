import 'package:flutter/material.dart';

/// AppTheme
/// Implements a modern Dark Charcoal + Warm Orange + Gold theme
/// Palette (exact):
/// - Background: #0F0F14
/// - Cards: #1C1C26
/// - Primary: #FF6A00
/// - Gold: #F5C542
/// - Primary Text: #FFFFFF
/// - Secondary Text: #B3B3B3
/// - Disabled Text: #6E6E6E

class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0F0F14);
  static const Color card = Color(0xFF1C1C26);
  static const Color primary = Color(0xFFFF6A00);
  static const Color gold = Color(0xFFF5C542);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color textDisabled = Color(0xFF6E6E6E);
  static const Color inactiveIcon = textSecondary;
  static const Color softBlack = Colors.black54;
}

class AppGradients {
  AppGradients._();

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.gold],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient progressGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.gold],
  );
}

class AppSpacing {
  AppSpacing._();

  static const double screenPadding = 16.0;
  static const double horizontal = 16.0;
  static const double vertical = 16.0;

  // Gaps
  static const double gapXS = 4.0;
  static const double gapS = 8.0;
  static const double gapM = 12.0;
  static const double gapL = 16.0;
  static const double gapXL = 24.0;
}

class AppSizes {
  AppSizes._();

  // Logo sizes
  static const double logoSmall = 36.0;
  static const double logoMedium = 48.0;
  static const double logoLarge = 72.0;

  // Card heights (useful for carousels)
  static const double cardHeightSmall = 120.0;
  static const double cardHeightMedium = 160.0;
  static const double cardHeightLarge = 220.0;

  // Carousel / Ad sizes
  static const double carouselCardWidth = 280.0;
  static const double carouselAdHeight = 180.0;

  // Buttons
  static const double buttonHeightSmall = 36.0;
  static const double buttonHeightMedium = 48.0;
  static const double buttonHeightLarge = 56.0;
}

class AppTextStyles {
  AppTextStyles._();

  // Headings
  static const TextStyle heading1 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const TextStyle heading2 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static const TextStyle heading3 = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  // Body / Description
  static const TextStyle body = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static const TextStyle description = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    height: 1.35,
  );

  // Caption
  static const TextStyle caption = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  // Disabled
  static const TextStyle disabled = TextStyle(
    color: AppColors.textDisabled,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}

class AppDecorations {
  AppDecorations._();

  static BoxDecoration cardDecoration({double radius = 12.0}) => BoxDecoration(
    color: AppColors.background,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(115),
        offset: Offset(0, 6),
        blurRadius: 18.0,
      ),
    ],
  );

  static BoxDecoration featuredGradient({double radius = 12.0}) =>
      BoxDecoration(
        gradient: AppGradients.primaryGradient,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withAlpha(46),
            offset: Offset(0, 8),
            blurRadius: 28.0,
          ),
        ],
      );
}

class AppTheme {
  AppTheme._();

  static ThemeData get dark {
    final base = ThemeData.dark();

    final colorScheme = ColorScheme.dark(
      surface: AppColors.card,
      primary: AppColors.primary,
      secondary: AppColors.gold,
      onPrimary: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.background,
      cardColor: AppColors.card,
      primaryColor: AppColors.primary,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: AppTextStyles.heading3,
      ),
      iconTheme: IconThemeData(color: AppColors.textSecondary),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.heading1,
        headlineMedium: AppTextStyles.heading2,
        headlineSmall: AppTextStyles.heading3,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.description,
        bodySmall: AppTextStyles.caption,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textPrimary,
          minimumSize: Size(double.infinity, AppSizes.buttonHeightMedium),
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.gapL),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.gold,
          side: BorderSide(color: AppColors.gold),
          minimumSize: Size(double.infinity, AppSizes.buttonHeightMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.card,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
        ),
      ),
      dividerColor: Colors.white12,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.black87,
        contentTextStyle: AppTextStyles.body,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.textDisabled,
        thumbColor: AppColors.primary,
        trackHeight: 4,
      ),
    );
  }
}

// Helpful small components for consistent UI
class AppComponents {
  AppComponents._();

  static Widget progressBar({double height = 4.0}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        gradient: AppGradients.progressGradient,
      ),
    );
  }

  static Widget categoryChip(String text, {bool active = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: active ? AppColors.primary.withAlpha(20) : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.gold.withAlpha(230)),
      ),
      child: Text(
        text,
        style: active
            ? AppTextStyles.body.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              )
            : AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}

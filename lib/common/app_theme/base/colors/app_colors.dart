part of '../app_theme.dart';

abstract class AppColors {
  static AppColors of(WidgetRef ref) {
    return AppTheme.of(ref).colors;
  }

  // Base

  MaterialColor get primaryColor;

  Color get surfaceColor;

  // Bottom Navigation

  Color get bottomNavigationBarColor;

  Color get bottomNavigationBarSelectedIconColor;

  Color get bottomNavigationBarUnselectedIconColor;
}

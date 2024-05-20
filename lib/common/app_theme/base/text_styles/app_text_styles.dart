part of '../app_theme.dart';

abstract class AppTextStyles {
  static AppTextStyles of(WidgetRef ref) {
    return AppTheme.of(ref).textStyles;
  }

  // Base
  TextStyle get appBarTitle;
  TextStyle get bottomNavigationSelectedText;
  TextStyle get bottomNavigationUnselectedText;

  // PokemonSummaryPage
  TextStyle get pokemonSummaryName;
}

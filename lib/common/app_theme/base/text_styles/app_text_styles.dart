part of '../app_theme.dart';

abstract class AppTextStyles {
  static AppTextStyles of(WidgetRef ref) {
    return AppTheme.of(ref).textStyles;
  }

  // Base
  TextStyle get appBarTitle;
  TextStyle get bottomNavigationSelectedText;
  TextStyle get bottomNavigationUnselectedText;
  TextStyle get errorText;
  TextStyle get dialogTitle;
  TextStyle get dialogContent;
  TextStyle get dialogTextButton;

  // PokemonSummaryPage
  TextStyle get pokemonSummaryName;

  // PokemonDetailPage
  TextStyle get pokemonDetailNumber;
  TextStyle get pokemonDetailDescription;
  TextStyle get pokemonDetailStats;
}

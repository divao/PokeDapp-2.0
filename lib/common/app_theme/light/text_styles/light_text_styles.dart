part of '../light_app_theme.dart';

class LightTextStyles extends AppTextStyles {

  // Base
  @override
  TextStyle get appBarTitle => const TextStyle(
    color: _white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: _montserratFontFamily,
  );

  @override
  TextStyle get bottomNavigationSelectedText => const TextStyle(
    color: _englishVermillion,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    fontFamily: _montserratFontFamily,
  );

  @override
  TextStyle get bottomNavigationUnselectedText => const TextStyle(
    color: _graniteGray,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    fontFamily: _montserratFontFamily,
  );

  // PokemonSummaryPage
  @override
  TextStyle get pokemonSummaryName => const TextStyle(
        color: _black,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        fontFamily: _montserratFontFamily,
      );
}
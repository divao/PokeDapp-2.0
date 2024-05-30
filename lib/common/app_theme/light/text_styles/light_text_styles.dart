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

  @override
  TextStyle get errorText => const TextStyle(
    color: _black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _montserratFontFamily,
  );

  @override
  TextStyle get dialogTitle => const TextStyle(
    color: _black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: _montserratFontFamily,
  );

  @override
  TextStyle get dialogContent => const TextStyle(
    color: _black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _montserratFontFamily,
  );

  @override
  TextStyle get dialogTextButton => const TextStyle(
    color: _englishVermillion,
    fontSize: 14,
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

  // PokemonDetailPage
  @override
  TextStyle get pokemonDetailNumber => const TextStyle(
    color: _black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: _montserratFontFamily,
  );

  @override
  TextStyle get pokemonDetailDescription => const TextStyle(
    color: _black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: _montserratFontFamily,
  );

  @override
  TextStyle get pokemonDetailStats => const TextStyle(
    color: _black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontFamily: _montserratFontFamily,
  );
}

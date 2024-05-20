part of '../light_app_theme.dart';

class LightColors implements AppColors {
  // Base

  @override
  MaterialColor get primaryColor => MaterialColor(
        _englishVermillion.value,
        {
          50: _englishVermillion.withOpacity(.1),
          100: _englishVermillion.withOpacity(.2),
          200: _englishVermillion.withOpacity(.3),
          300: _englishVermillion.withOpacity(.4),
          400: _englishVermillion.withOpacity(.5),
          500: _englishVermillion.withOpacity(.6),
          600: _englishVermillion.withOpacity(.7),
          700: _englishVermillion.withOpacity(.8),
          800: _englishVermillion.withOpacity(.9),
          900: _englishVermillion.withOpacity(1),
        },
      );

  @override
  Color get surfaceColor => _white;

  @override
  Color get imagePlaceholderColor => _taupeGray;

  // Bottom Navigation

  @override
  Color get bottomNavigationBarColor => _white;

  @override
  Color get bottomNavigationBarSelectedIconColor => _englishVermillion;

  @override
  Color get bottomNavigationBarUnselectedIconColor => _graniteGray;
}

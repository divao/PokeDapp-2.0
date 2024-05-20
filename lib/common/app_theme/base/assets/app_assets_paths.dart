part of '../app_theme.dart';

abstract class AppAssetsPaths {
  static AppAssetsPaths of(WidgetRef ref) {
    return AppTheme.of(ref).assets;
  }

  // Base
  String get pokeballIcon;

  String get pokedexIcon;
}
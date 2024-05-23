part of '../app_theme.dart';

abstract class AppAssetsPaths {
  static AppAssetsPaths of(WidgetRef ref) {
    return AppTheme.of(ref).assets;
  }

  // Base
  String get pokeballIcon;

  String get pokedexIcon;

  // PokemonTypes
  String get typeBugIcon;

  String get typeDarkIcon;

  String get typeDragonIcon;

  String get typeElectricIcon;

  String get typeFairyIcon;

  String get typeFightingIcon;

  String get typeFireIcon;

  String get typeFlyingIcon;

  String get typeGhostIcon;

  String get typeGrassIcon;

  String get typeGroundIcon;

  String get typeIceIcon;

  String get typeNormalIcon;

  String get typePoisonIcon;

  String get typePsychicIcon;

  String get typeRockIcon;

  String get typeSteelIcon;

  String get typeWaterIcon;
}
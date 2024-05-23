import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/data/view/model/pokemon_detail_vm.dart';
import 'package:poke_dapp_2/data/view/model/pokemon_type_vm.dart';

PokemonTypeVM pokemonTypeFromString(String type) {
  switch (type) {
    case 'normal':
      return PokemonTypeVM.normal;
    case 'fighting':
      return PokemonTypeVM.fighting;
    case 'flying':
      return PokemonTypeVM.flying;
    case 'poison':
      return PokemonTypeVM.poison;
    case 'ground':
      return PokemonTypeVM.ground;
    case 'rock':
      return PokemonTypeVM.rock;
    case 'bug':
      return PokemonTypeVM.bug;
    case 'ghost':
      return PokemonTypeVM.ghost;
    case 'steel':
      return PokemonTypeVM.steel;
    case 'fire':
      return PokemonTypeVM.fire;
    case 'water':
      return PokemonTypeVM.water;
    case 'grass':
      return PokemonTypeVM.grass;
    case 'electric':
      return PokemonTypeVM.electric;
    case 'psychic':
      return PokemonTypeVM.psychic;
    case 'ice':
      return PokemonTypeVM.ice;
    case 'dragon':
      return PokemonTypeVM.dragon;
    case 'dark':
      return PokemonTypeVM.dark;
    case 'fairy':
      return PokemonTypeVM.fairy;
    default:
      return PokemonTypeVM.normal;
  }
}

String pokemonTypeToAssetPath(WidgetRef ref, PokemonTypeVM type) {
  return switch (type) {
    PokemonTypeVM.normal => ref.assets.typeNormalIcon,
    PokemonTypeVM.fighting => ref.assets.typeFightingIcon,
    PokemonTypeVM.flying => ref.assets.typeFlyingIcon,
    PokemonTypeVM.poison => ref.assets.typePoisonIcon,
    PokemonTypeVM.ground => ref.assets.typeGroundIcon,
    PokemonTypeVM.rock => ref.assets.typeRockIcon,
    PokemonTypeVM.bug => ref.assets.typeBugIcon,
    PokemonTypeVM.ghost => ref.assets.typeGhostIcon,
    PokemonTypeVM.steel => ref.assets.typeSteelIcon,
    PokemonTypeVM.fire => ref.assets.typeFireIcon,
    PokemonTypeVM.water => ref.assets.typeWaterIcon,
    PokemonTypeVM.grass => ref.assets.typeGrassIcon,
    PokemonTypeVM.electric => ref.assets.typeElectricIcon,
    PokemonTypeVM.psychic => ref.assets.typePsychicIcon,
    PokemonTypeVM.ice => ref.assets.typeIceIcon,
    PokemonTypeVM.dragon => ref.assets.typeDragonIcon,
    PokemonTypeVM.dark => ref.assets.typeDarkIcon,
    PokemonTypeVM.fairy => ref.assets.typeFairyIcon,
  };
}

StatVM stringToStat(String stat) {
  return switch (stat) {
    'hp' => StatVM.hp,
    'attack' => StatVM.attack,
    'defense' => StatVM.defense,
    'special-attack' => StatVM.specialAttack,
    'special-defense' => StatVM.specialDefense,
    'speed' => StatVM.speed,
    _ => StatVM.error,
  };

}

String statToString(WidgetRef ref, StatVM stat) {
  return switch (stat) {
    StatVM.hp => ref.s.pokemonStatHp,
    StatVM.attack => ref.s.pokemonStatAttack,
    StatVM.defense => ref.s.pokemonStatDefense,
    StatVM.specialAttack => ref.s.pokemonStatSpecialAttack,
    StatVM.specialDefense => ref.s.pokemonStatSpecialDefense,
    StatVM.speed => ref.s.pokemonStatSpeed,
    StatVM.error => '',
  };
}

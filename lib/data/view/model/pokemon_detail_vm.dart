import 'package:poke_dapp_2/data/view/model/pokemon_type_vm.dart';

class PokemonDetailVM {
  PokemonDetailVM({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.stats,
    required this.cryUrl,
    required this.description,
  });

  final int id;
  final String name;
  final String imageUrl;
  final List<PokemonTypeVM> types;
  final List<PokemonStatVM> stats;
  final String cryUrl;
  final String description;
}

class PokemonStatVM {
  PokemonStatVM({
    required this.name,
    required this.value,
  });

  final StatVM name;
  final int value;
}

enum StatVM {
  hp,
  attack,
  defense,
  specialAttack,
  specialDefense,
  speed,
  error,
}
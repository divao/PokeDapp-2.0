import 'package:isar/isar.dart';

part 'pokemon_detail_cm.g.dart';

@collection
class PokemonDetailCM {
  PokemonDetailCM({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.stats,
    required this.cryUrl,
    required this.description,
  });

  final Id id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final List<PokemonStatCM> stats;
  final String cryUrl;
  final String description;
}

@embedded
class PokemonStatCM {
  String? name;
  int? value;
}
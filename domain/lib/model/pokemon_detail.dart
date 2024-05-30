class PokemonDetail {
  PokemonDetail({
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
  final List<String> types;
  final List<PokemonStat> stats;
  final String cryUrl;
  final String description;
}

class PokemonStat {
  PokemonStat({
    required this.name,
    required this.value,
  });

  final String name;
  final int value;
}

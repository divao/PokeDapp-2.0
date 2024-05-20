import 'package:isar/isar.dart';

part 'pokemon_summary_cm.g.dart';

@collection
class PokemonSummaryCM {
  PokemonSummaryCM({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final Id id;
  final String name;
  final String imageUrl;
}
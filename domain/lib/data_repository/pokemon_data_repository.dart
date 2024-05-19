import 'package:domain/model/pokemon_summary.dart';

abstract class PokemonDataRepository {
  Future<List<PokemonSummary>> getPokemonSummaryList();
}

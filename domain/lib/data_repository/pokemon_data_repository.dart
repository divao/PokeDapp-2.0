import 'package:domain/model/pokemon_detail.dart';
import 'package:domain/model/pokemon_summary.dart';

abstract class PokemonDataRepository {
  Future<List<PokemonSummary>> getPokemonSummaryList();
  Future<PokemonDetail> getPokemonDetail(int pokemonId);
}

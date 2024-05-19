import 'package:domain/data_repository/pokemon_data_repository.dart';
import 'package:domain/model/pokemon_summary.dart';
import 'package:poke_dapp_2/data/mappers/cache_to_domain.dart';
import 'package:poke_dapp_2/data/mappers/remote_to_cache.dart';
import 'package:poke_dapp_2/data/remote/data_source/pokemon_rds.dart';

class PokemonRepository extends PokemonDataRepository {
  PokemonRepository({required this.pokemonRDS});

  final PokemonRDS pokemonRDS;

  @override
  Future<List<PokemonSummary>> getPokemonSummaryList() async {
    final response = await pokemonRDS.getPokemonSummaryList();
    return response.results
        .map((pokemonSummaryRM) => pokemonSummaryRM.toCM().toDM())
        .toList();
  }
}

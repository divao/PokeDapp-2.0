import 'package:domain/data_repository/pokemon_data_repository.dart';
import 'package:domain/model/pokemon_detail.dart';
import 'package:domain/model/pokemon_summary.dart';
import 'package:poke_dapp_2/common/utils/utils.dart';
import 'package:poke_dapp_2/data/mappers/cache_to_domain.dart';
import 'package:poke_dapp_2/data/mappers/remote_to_cache.dart';
import 'package:poke_dapp_2/data/mappers/remote_to_domain.dart';
import 'package:poke_dapp_2/data/remote/data_source/pokemon_rds.dart';
import 'package:poke_dapp_2/data/remote/model/get_pokemon_attributes_response_rm.dart';
import 'package:poke_dapp_2/data/remote/model/get_pokemon_description_response_rm.dart';

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

  @override
  Future<PokemonDetail> getPokemonDetail(int pokemonId) async {
    final response = await Future.wait([
      pokemonRDS.getPokemonAttributes(pokemonId),
      pokemonRDS.getPokemonDescription(pokemonId),
    ]);

    final pokemonAttributes = response[0] as GetPokemonAttributesResponseRM;
    final pokemonDescription = response[1] as GetPokemonDescriptionResponseRM;
    final pokemonTypes = pokemonAttributes.types;
    pokemonTypes.sort((a, b) => a.slot.compareTo(b.slot));

    return PokemonDetail(
      id: pokemonId,
      name: pokemonAttributes.name,
      imageUrl: pokemonIdToImageUrl(pokemonId),
      types: pokemonTypes.map((pokemonType) => pokemonType.type.toDM()).toList(),
      stats: pokemonAttributes.stats.map((stat) => stat.toDM()).toList(),
      cryUrl: pokemonAttributes.cry.toDM(),
      description: pokemonDescription.descriptionList
          .firstWhere((description) => description.language.name == 'en')
          .toDM(),
    );
  }
}

import 'package:domain/data_repository/pokemon_data_repository.dart';
import 'package:domain/model/pokemon_detail.dart';
import 'package:domain/model/pokemon_summary.dart';
import 'package:poke_dapp_2/common/utils/utils.dart';
import 'package:poke_dapp_2/data/cache/data_source/pokemon_cds.dart';
import 'package:poke_dapp_2/data/mappers/cache_to_domain.dart';
import 'package:poke_dapp_2/data/mappers/domain_to_cache.dart';
import 'package:poke_dapp_2/data/mappers/remote_to_cache.dart';
import 'package:poke_dapp_2/data/mappers/remote_to_domain.dart';
import 'package:poke_dapp_2/data/remote/data_source/pokemon_rds.dart';
import 'package:poke_dapp_2/data/remote/model/get_pokemon_attributes_response_rm.dart';
import 'package:poke_dapp_2/data/remote/model/get_pokemon_description_response_rm.dart';

class PokemonRepository extends PokemonDataRepository {
  PokemonRepository({
    required this.pokemonRDS,
    required this.pokemonCDS,
  });

  final PokemonRDS pokemonRDS;
  final PokemonCDS pokemonCDS;

  @override
  Future<List<PokemonSummary>> getPokemonSummaryList() async {
    try {
      final remoteResponse = await pokemonRDS.getPokemonSummaryList();
      final cachePokemonSummaryList = remoteResponse.results
          .map((pokemonSummaryRM) => pokemonSummaryRM.toCM())
          .toList();
      await pokemonCDS.addPokemonSummaryList(cachePokemonSummaryList);
      return cachePokemonSummaryList.map((pokemonSummaryCM) => pokemonSummaryCM.toDM()).toList();
    } catch (e) {
      final cachePokemonSummaryList = await pokemonCDS.fetchPokemonSummaryList();
      if (cachePokemonSummaryList.isEmpty) {
        rethrow;
      }
      return cachePokemonSummaryList.map((pokemonSummaryCM) => pokemonSummaryCM.toDM()).toList();
    }
  }

  @override
  Future<PokemonDetail> getPokemonDetail(int pokemonId) async {
    final PokemonDetail pokemonDetail;
    if (!await pokemonCDS.isPokemonDetailInBox(pokemonId)) {
      final remoteResponse = await Future.wait([
        pokemonRDS.getPokemonAttributes(pokemonId),
        pokemonRDS.getPokemonDescription(pokemonId),
      ]);

      final pokemonAttributes = remoteResponse[0] as GetPokemonAttributesResponseRM;
      final pokemonDescription = remoteResponse[1] as GetPokemonDescriptionResponseRM;
      final pokemonTypes = pokemonAttributes.types;
      pokemonTypes.sort((a, b) => a.slot.compareTo(b.slot));

      pokemonDetail = PokemonDetail(
        id: pokemonId,
        name: pokemonAttributes.name.capitalize(),
        imageUrl: pokemonIdToHomeImageUrl(pokemonId),
        types:
        pokemonTypes.map((pokemonType) => pokemonType.type.toDM()).toList(),
        stats: pokemonAttributes.stats.map((stat) => stat.toDM()).toList(),
        cryUrl: pokemonAttributes.cry.toDM(),
        description: pokemonDescription.descriptionList
            .firstWhere((description) => description.language.name == 'en')
            .toDM()
            .fixPokemonDescription(),
      );
      await pokemonCDS.addPokemonDetail(pokemonDetail.toCM());
    } else {
      final pokemonDetailCM = await pokemonCDS.fetchPokemonDetail(pokemonId);
      pokemonDetail = pokemonDetailCM!.toDM();
    }
    return pokemonDetail;
  }
}

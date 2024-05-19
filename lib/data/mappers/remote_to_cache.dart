import 'package:poke_dapp_2/common/utils/utils.dart';
import 'package:poke_dapp_2/data/cache/model/pokemon_summary_cm.dart';
import 'package:poke_dapp_2/data/remote/model/pokemon_summary_rm.dart';

extension PokemonSummartRMMappers on PokemonSummaryRM {
  PokemonSummaryCM toCM() {
    int pokemonId = pokemonUrlToId(url);

    return PokemonSummaryCM(
      id: pokemonId,
      name: name,
      imageUrl: pokemonIdToImageUrl(pokemonId),
    );
  }
}
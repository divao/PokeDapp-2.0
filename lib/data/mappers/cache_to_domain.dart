import 'package:domain/model/pokemon_summary.dart';
import 'package:poke_dapp_2/data/cache/model/pokemon_summary_cm.dart';


extension PokemonSummaryCMMappers on PokemonSummaryCM {
  PokemonSummary toDM() => PokemonSummary(
        id: id,
        name: name,
        imageUrl: imageUrl,
      );
}
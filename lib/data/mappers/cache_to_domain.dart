import 'package:domain/model/pokemon_detail.dart';
import 'package:domain/model/pokemon_summary.dart';
import 'package:poke_dapp_2/data/cache/model/pokemon_detail_cm.dart';
import 'package:poke_dapp_2/data/cache/model/pokemon_summary_cm.dart';

extension PokemonSummaryCMMappers on PokemonSummaryCM {
  PokemonSummary toDM() => PokemonSummary(
        id: id,
        name: name,
        imageUrl: imageUrl,
      );
}

extension PokemonDetailCMMappers on PokemonDetailCM {
  PokemonDetail toDM() => PokemonDetail(
        id: id,
        name: name,
        imageUrl: imageUrl,
        types: types,
        stats: stats.map((stat) => stat.toDM()).toList(),
        cryUrl: cryUrl,
        description: description,
      );
}

extension PokemonStatCMMappers on PokemonStatCM {
  PokemonStat toDM() => PokemonStat(
        name: name ?? '',
        value: value ?? 0,
      );
}

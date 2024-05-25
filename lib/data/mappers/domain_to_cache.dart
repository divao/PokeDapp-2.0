import 'package:domain/model/pokemon_detail.dart';
import 'package:poke_dapp_2/data/cache/model/pokemon_detail_cm.dart';

extension PokemonDetailMappers on PokemonDetail {
  PokemonDetailCM toCM() => PokemonDetailCM(
    id: id,
    name: name,
    imageUrl: imageUrl,
    types: types,
    stats: stats.map((stat) => stat.toCM()).toList(),
    cryUrl: cryUrl,
    description: description,
  );
}

extension PokemonStatMappers on PokemonStat {
  PokemonStatCM toCM() => PokemonStatCM()
    ..name = name
    ..value = value;
}
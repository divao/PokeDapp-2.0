import 'package:domain/model/pokemon_detail.dart';
import 'package:poke_dapp_2/data/remote/model/pokemon_cry_rm.dart';
import 'package:poke_dapp_2/data/remote/model/pokemon_description_rm.dart';
import 'package:poke_dapp_2/data/remote/model/pokemon_stat_rm.dart';
import 'package:poke_dapp_2/data/remote/model/stat_rm.dart';
import 'package:poke_dapp_2/data/remote/model/type_rm.dart';

extension PokemonStatRMMappers on PokemonStatRM {
  PokemonStat toDM() => PokemonStat(name: stat.toDM(), value: value);
}

extension StatRMMappers on StatRM {
  String toDM() => name;
}

extension PokemonCryRMMappers on PokemonCryRM {
  String toDM() => cryUrl;
}

extension PokemonDescriptionRMMappers on PokemonDescriptionRM {
  String toDM() => description;
}

extension TypeRMMappers on TypeRM {
  String toDM() => name;
}
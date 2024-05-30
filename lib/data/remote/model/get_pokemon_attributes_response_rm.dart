import 'package:json_annotation/json_annotation.dart';
import 'package:poke_dapp_2/data/remote/model/pokemon_cry_rm.dart';
import 'package:poke_dapp_2/data/remote/model/pokemon_stat_rm.dart';
import 'package:poke_dapp_2/data/remote/model/pokemon_type_rm.dart';

part 'get_pokemon_attributes_response_rm.g.dart';

@JsonSerializable()
class GetPokemonAttributesResponseRM {
  GetPokemonAttributesResponseRM({
    required this.name,
    required this.types,
    required this.stats,
    required this.cry,
  });

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'types')
  final List<PokemonTypeRM> types;

  @JsonKey(name: 'stats')
  final List<PokemonStatRM> stats;

  @JsonKey(name: 'cries')
  final PokemonCryRM cry;

  factory GetPokemonAttributesResponseRM.fromJson(Map<String, dynamic> json) =>
      _$GetPokemonAttributesResponseRMFromJson(json);
}
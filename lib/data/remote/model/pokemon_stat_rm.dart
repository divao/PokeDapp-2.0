import 'package:json_annotation/json_annotation.dart';
import 'package:poke_dapp_2/data/remote/model/stat_rm.dart';

part 'pokemon_stat_rm.g.dart';

@JsonSerializable()
class PokemonStatRM {
  PokemonStatRM({
    required this.value,
    required this.stat,
  });

  @JsonKey(name: 'base_stat')
  final int value;

  @JsonKey(name: 'stat')
  final StatRM stat;

  factory PokemonStatRM.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatRMFromJson(json);
}
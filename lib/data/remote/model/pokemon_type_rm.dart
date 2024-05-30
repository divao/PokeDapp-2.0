import 'package:json_annotation/json_annotation.dart';
import 'package:poke_dapp_2/data/remote/model/type_rm.dart';

part 'pokemon_type_rm.g.dart';

@JsonSerializable()
class PokemonTypeRM {
  PokemonTypeRM({
    required this.slot,
    required this.type,
  });

  @JsonKey(name: 'slot')
  final int slot;

  @JsonKey(name: 'type')
  final TypeRM type;

  factory PokemonTypeRM.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeRMFromJson(json);
}
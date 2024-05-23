import 'package:json_annotation/json_annotation.dart';

part 'pokemon_cry_rm.g.dart';

@JsonSerializable()
class PokemonCryRM {
  PokemonCryRM({
    required this.cryUrl,
  });

  @JsonKey(name: 'latest')
  final String cryUrl;

  factory PokemonCryRM.fromJson(Map<String, dynamic> json) =>
      _$PokemonCryRMFromJson(json);
}
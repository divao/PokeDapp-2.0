import 'package:json_annotation/json_annotation.dart';
import 'description_language_rm.dart';

part 'pokemon_description_rm.g.dart';

@JsonSerializable()
class PokemonDescriptionRM {
  PokemonDescriptionRM({
    required this.description,
    required this.language,
  });

  @JsonKey(name: 'flavor_text')
  final String description;

  @JsonKey(name: 'language')
  final DescriptionLanguageRM language;

  factory PokemonDescriptionRM.fromJson(Map<String, dynamic> json) =>
      _$PokemonDescriptionRMFromJson(json);
}
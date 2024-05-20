import 'package:json_annotation/json_annotation.dart';

part 'pokemon_summary_rm.g.dart';

@JsonSerializable()
class PokemonSummaryRM {
  PokemonSummaryRM({
    required this.name,
    required this.url,
  });

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  factory PokemonSummaryRM.fromJson(Map<String, dynamic> json) =>
      _$PokemonSummaryRMFromJson(json);
}
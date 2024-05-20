import 'package:json_annotation/json_annotation.dart';
import 'package:poke_dapp_2/data/remote/model/pokemon_summary_rm.dart';

part 'get_pokemon_summary_list_response_rm.g.dart';

@JsonSerializable()
class GetPokemonSummaryListResponseRM {

  GetPokemonSummaryListResponseRM({
    required this.results,
  });

  @JsonKey(name: 'results')
  final List<PokemonSummaryRM> results;

  factory GetPokemonSummaryListResponseRM.fromJson(Map<String, dynamic> json) =>
      _$GetPokemonSummaryListResponseRMFromJson(json);
}

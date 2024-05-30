import 'package:json_annotation/json_annotation.dart';
import 'package:poke_dapp_2/data/remote/model/pokemon_description_rm.dart';

part 'get_pokemon_description_response_rm.g.dart';

@JsonSerializable()
class GetPokemonDescriptionResponseRM {
  GetPokemonDescriptionResponseRM({
    required this.descriptionList,
  });

  @JsonKey(name: 'flavor_text_entries')
  final List<PokemonDescriptionRM> descriptionList;

  factory GetPokemonDescriptionResponseRM.fromJson(Map<String, dynamic> json) =>
      _$GetPokemonDescriptionResponseRMFromJson(json);
}

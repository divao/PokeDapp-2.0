// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pokemon_description_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPokemonDescriptionResponseRM _$GetPokemonDescriptionResponseRMFromJson(
        Map<String, dynamic> json) =>
    GetPokemonDescriptionResponseRM(
      descriptionList: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => PokemonDescriptionRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPokemonDescriptionResponseRMToJson(
        GetPokemonDescriptionResponseRM instance) =>
    <String, dynamic>{
      'flavor_text_entries': instance.descriptionList,
    };

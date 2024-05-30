// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pokemon_attributes_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPokemonAttributesResponseRM _$GetPokemonAttributesResponseRMFromJson(
        Map<String, dynamic> json) =>
    GetPokemonAttributesResponseRM(
      name: json['name'] as String,
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatRM.fromJson(e as Map<String, dynamic>))
          .toList(),
      cry: PokemonCryRM.fromJson(json['cries'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPokemonAttributesResponseRMToJson(
        GetPokemonAttributesResponseRM instance) =>
    <String, dynamic>{
      'name': instance.name,
      'types': instance.types,
      'stats': instance.stats,
      'cries': instance.cry,
    };

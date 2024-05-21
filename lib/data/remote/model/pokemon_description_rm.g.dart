// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_description_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDescriptionRM _$PokemonDescriptionRMFromJson(
        Map<String, dynamic> json) =>
    PokemonDescriptionRM(
      description: json['flavor_text'] as String,
      language: DescriptionLanguageRM.fromJson(
          json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonDescriptionRMToJson(
        PokemonDescriptionRM instance) =>
    <String, dynamic>{
      'flavor_text': instance.description,
      'language': instance.language,
    };

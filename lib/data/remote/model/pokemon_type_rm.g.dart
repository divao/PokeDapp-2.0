// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonTypeRM _$PokemonTypeRMFromJson(Map<String, dynamic> json) =>
    PokemonTypeRM(
      slot: (json['slot'] as num).toInt(),
      type: TypeRM.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeRMToJson(PokemonTypeRM instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

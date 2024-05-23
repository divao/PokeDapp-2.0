// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stat_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStatRM _$PokemonStatRMFromJson(Map<String, dynamic> json) =>
    PokemonStatRM(
      value: (json['base_stat'] as num).toInt(),
      stat: StatRM.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatRMToJson(PokemonStatRM instance) =>
    <String, dynamic>{
      'base_stat': instance.value,
      'stat': instance.stat,
    };

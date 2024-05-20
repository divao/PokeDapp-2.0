// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pokemon_summary_list_response_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPokemonSummaryListResponseRM _$GetPokemonSummaryListResponseRMFromJson(
        Map<String, dynamic> json) =>
    GetPokemonSummaryListResponseRM(
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonSummaryRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPokemonSummaryListResponseRMToJson(
        GetPokemonSummaryListResponseRM instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

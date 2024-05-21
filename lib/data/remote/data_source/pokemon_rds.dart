import 'package:dio/dio.dart';
import 'package:domain/exceptions.dart';
import 'package:poke_dapp_2/data/remote/infrastructure/url_builder.dart';
import 'package:poke_dapp_2/data/remote/model/get_pokemon_attributes_response_rm.dart';
import 'package:poke_dapp_2/data/remote/model/get_pokemon_description_response_rm.dart';
import 'package:poke_dapp_2/data/remote/model/get_pokemon_summary_list_response_rm.dart';

class PokemonRDS {
  PokemonRDS(this.dio);

  final Dio dio;

  Future<GetPokemonSummaryListResponseRM> getPokemonSummaryList() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        UrlBuilder.pokemonSummaryList(),
      );
      if (response.data == null) {
        throw NullResponseException();
      }
      return GetPokemonSummaryListResponseRM.fromJson(response.data!);
    } catch (e) {
      if (e is DioException) {
        throw GetPokemonSummaryListException();
      }
      throw UnexpectedException();
    }
  }

  Future<GetPokemonAttributesResponseRM> getPokemonAttributes(int pokemonId) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        UrlBuilder.pokemonAttributes(pokemonId),
      );
      if (response.data == null) {
        throw NullResponseException();
      }
      return GetPokemonAttributesResponseRM.fromJson(response.data!);
    } catch (e) {
      if (e is DioException) {
        throw GetPokemonSummaryListException();
      }
      throw UnexpectedException();
    }
  }

  Future<GetPokemonDescriptionResponseRM> getPokemonDescription(int pokemonId) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        UrlBuilder.pokemonDescription(pokemonId),
      );
      if (response.data == null) {
        throw NullResponseException();
      }
      return GetPokemonDescriptionResponseRM.fromJson(response.data!);
    } catch (e) {
      if (e is DioException) {
        throw GetPokemonSummaryListException();
      }
      throw UnexpectedException();
    }
  }

}
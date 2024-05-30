import 'package:dio/dio.dart';
import 'package:domain/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_dapp_2/data/remote/data_source/pokemon_rds.dart';
import 'package:poke_dapp_2/data/remote/infrastructure/poke_dapp_dio.dart';
import 'package:poke_dapp_2/data/remote/infrastructure/url_builder.dart';
import 'package:poke_dapp_2/data/remote/model/get_pokemon_attributes_response_rm.dart';

import 'pokemon_rds_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PokeDappDio>()])
void main() {
  late PokemonRDS sut;
  late PokeDappDio dio;
  late int pokemonId;
  late Map<String, dynamic> attributesData;
  late String path;

  void mockDioAttributesResponse() =>
      when(dio.get<Map<String, dynamic>>(path)).thenAnswer(
        (_) async =>
            Response(requestOptions: RequestOptions(), data: attributesData),
      );

  void mockDioNullResponse() =>
      when(dio.get<Map<String, dynamic>>(path)).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions()),
      );

  void mockDioErrorResponse(Exception error) =>
      when(dio.get<Map<String, dynamic>>(path)).thenThrow(error);

  setUpAll(() {
    dio = MockPokeDappDio();
    pokemonId = 1;
    attributesData = {
      'name': 'bulbasaur',
      'types': [
        {
          'slot': 1,
          'type': {'name': 'grass'},
        },
        {
          'slot': 2,
          'type': {'name': 'poison'},
        }
      ],
      'stats': [
        {
          'base_stat': 45,
          'stat': {'name': 'hp'}
        },
        {
          'base_stat': 49,
          'stat': {'name': 'attack'}
        },
        {
          'base_stat': 49,
          'stat': {'name': 'defense'}
        },
        {
          'base_stat': 65,
          'stat': {'name': 'special-attack'}
        },
        {
          'base_stat': 65,
          'stat': {'name': 'special-defense'}
        },
        {
          'base_stat': 45,
          'stat': {'name': 'speed'}
        }
      ],
      'cries': {
        'latest':
            'https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/1.ogg'
      },
    };
    path = UrlBuilder.pokemonAttributes(pokemonId);
  });

  setUp(() {
    sut = PokemonRDS(dio);
  });

  group('PokemonAttributes', () {
    test('Should call getPokemonAttributes if correct params', () async {
      mockDioAttributesResponse();
      await sut.getPokemonAttributes(pokemonId);
      verify(dio.get<Map<String, dynamic>>(path)).called(1);
    });

    test(
        'Should return a GetPokemonAttributesResponseRM when getPokemonAttributes success',
        () async {
      mockDioAttributesResponse();
      final response = await sut.getPokemonAttributes(pokemonId);
      expect(response, isA<GetPokemonAttributesResponseRM>());
    });

    test('Should throw NullResponseException if data is null', () async {
      mockDioNullResponse();
      final future = sut.getPokemonAttributes(pokemonId);
      expect(future, throwsA(isA<NullResponseException>()));
    });

    test(
        'Should throw GetPokemonAttributesException if dio thows a DioException',
        () {
      mockDioErrorResponse(DioException(requestOptions: RequestOptions()));
      final future = sut.getPokemonAttributes(pokemonId);
      expect(future, throwsA(isA<GetPokemonAttributesException>()));
    });
  });
}

import 'package:dio/dio.dart';
import 'package:domain/exceptions.dart';
import 'package:domain/logger.dart';
import 'package:domain/use_case/get_pokemon_summary_list_uc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:poke_dapp_2/common/app_theme/base/app_theme.dart';
import 'package:poke_dapp_2/common/app_theme/light/light_app_theme.dart';
import 'package:poke_dapp_2/data/remote/data_source/pokemon_rds.dart';
import 'package:poke_dapp_2/data/remote/infrastructure/poke_dapp_dio.dart';
import 'package:poke_dapp_2/data/repository/pokemon_repository.dart';
import 'package:poke_dapp_2/main.dart';

final errorLoggerProvider = Provider<ErrorLogger>((ref) => Log().logError);

final appThemeProvider = Provider<AppTheme>(
  (ref) => LightAppTheme(),
);

final isarProvider = Provider<Isar>(
  (_) => throw DatabaseNotStartedException(),
);

final _dioProvider = Provider<Dio>((ref) => PokeDappDio(
      options: BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
      ),
    ));

final _pokemonRDSProvider = Provider<PokemonRDS>((ref) {
  final dio = ref.watch(_dioProvider);
  return PokemonRDS(dio);
});

final _pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final pokemonRDS = ref.watch(_pokemonRDSProvider);
  return PokemonRepository(pokemonRDS: pokemonRDS);
});

final getPokemonSummaryListUCProvider =
    Provider<GetPokemonSummaryListUC>((ref) {
  final logger = ref.watch<ErrorLogger>(errorLoggerProvider);
  final pokemonDataRepository =
      ref.watch<PokemonRepository>(_pokemonRepositoryProvider);
  return GetPokemonSummaryListUC(
    logger: logger,
    pokemonDataRepository: pokemonDataRepository,
  );
});

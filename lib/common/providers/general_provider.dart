import 'package:dio/dio.dart';
import 'package:domain/exceptions.dart';
import 'package:domain/logger.dart';
import 'package:domain/use_case/get_pokemon_summary_list_uc.dart';
import 'package:domain/use_case/get_pokemon_detail_uc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:poke_dapp_2/common/analytics_logger.dart';
import 'package:poke_dapp_2/common/analytics_observer.dart';
import 'package:poke_dapp_2/common/app_theme/base/app_theme.dart';
import 'package:poke_dapp_2/common/app_theme/light/light_app_theme.dart';
import 'package:poke_dapp_2/data/cache/data_source/pokemon_cds.dart';
import 'package:poke_dapp_2/data/remote/data_source/pokemon_rds.dart';
import 'package:poke_dapp_2/data/remote/infrastructure/poke_dapp_dio.dart';
import 'package:poke_dapp_2/data/repository/pokemon_repository.dart';
import 'package:poke_dapp_2/main.dart';

final errorLoggerProvider = Provider<ErrorLogger>((ref) => Log().logError);

final appThemeProvider = Provider<AppTheme>(
  (ref) => LightAppTheme(),
);

final _firebaseAnalyticsProvider =
Provider<FirebaseAnalytics>((ref) => FirebaseAnalytics.instance);

final analyticsLoggerProvider = Provider<AnalyticsLogger>((ref) {
  final firebaseAnalytics =
  ref.watch<FirebaseAnalytics>(_firebaseAnalyticsProvider);
  return AnalyticsLogger(logger: firebaseAnalytics);
});

final analyticsObserverProvider = Provider<AnalyticsObserver>((ref) {
  final analyticsLogger = ref.watch(analyticsLoggerProvider);
  return AnalyticsObserver(logger: analyticsLogger);
});

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

final _pokemonCDSProvider = Provider<PokemonCDS>((ref) {
  final isar = ref.watch(isarProvider);
  return PokemonCDS(isar: isar);
});

final _pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final pokemonRDS = ref.watch(_pokemonRDSProvider);
  final pokemonCDS = ref.watch(_pokemonCDSProvider);
  return PokemonRepository(
    pokemonRDS: pokemonRDS,
    pokemonCDS: pokemonCDS,
  );
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

final getPokemonDetailUCProvider = Provider.autoDispose<GetPokemonDetailUC>(
  (ref) {
    final logger = ref.watch<ErrorLogger>(errorLoggerProvider);
    final pokemonDataRepository =
        ref.watch<PokemonRepository>(_pokemonRepositoryProvider);
    return GetPokemonDetailUC(
      logger: logger,
      pokemonDataRepository: pokemonDataRepository,
    );
  },
);

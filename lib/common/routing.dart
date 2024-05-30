import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_dapp_2/presentation/home/home_navigation_page.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/pokemon_detail_page.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/pokemon_list_page.dart';

const _slash = '/';
const _pokemonListPage = 'pokemonList';
const _pokedexListPage = 'pokedexList';
const _pokemonDetailPage = 'pokemonDetail/:id';

const _pokemonListPath = _slash + _pokemonListPage;
const _pokemonDetailPath = _pokemonListPath + _slash + _pokemonDetailPage;
const _pokedexListPath = _slash + _pokedexListPage;
const _pokedexDetailPath = _pokedexListPath + _slash + _pokemonDetailPage;

final _goRouterNavigatorKey = GlobalKey<NavigatorState>();
final _pokemonNavigatorKey = GlobalKey<NavigatorState>();
final _pokedexNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider.autoDispose<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: _goRouterNavigatorKey,
      initialLocation: _pokemonListPath,
      routes: [
        StatefulShellRoute.indexedStack(
          branches: [
            StatefulShellBranch(
              navigatorKey: _pokemonNavigatorKey,
              routes: [
                GoRoute(
                  path: _pokemonListPath,
                  builder: (context, state) => PokemonListPage.create(),
                  routes: [
                    GoRoute(
                      path: _pokemonDetailPage,
                      builder: (context, state) => PokemonDetailPage.create(
                        pokemonId: int.parse(state.pathParameters['id'] ?? '0'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _pokedexNavigatorKey,
              routes: [
                GoRoute(
                  path: _pokedexListPath,
                  builder: (context, state) => PokemonListPage.create(),
                  routes: [
                    GoRoute(
                      path: _pokemonDetailPage,
                      builder: (context, state) => PokemonDetailPage.create(
                        pokemonId: int.parse(state.pathParameters['id'] ?? '0'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
          builder: (context, state, navigationShell) => HomeNavigationPage(
            pokemonNavigatorKey: _pokemonNavigatorKey,
            pokedexNavigatorKey: _pokedexNavigatorKey,
            navigationShell: navigationShell,
          ),
        ),
      ],
    );
  },
);

extension PageNavigationExtension on GoRouter {
  void goPokemonDetail({
    required String currentPath,
    required int pokemonId,
  }) {
    final pokemonDetailPath = currentPath +
        _slash +
        _pokemonDetailPage.replaceFirst(':id', pokemonId.toString());
    go(pokemonDetailPath);
  }
}

extension GoRouterConsumerExtension on WidgetRef {
  GoRouter get goRouter => watch(goRouterProvider);
}

extension GoRouterStateExtension on ConsumerState {
  GoRouter get goRouter => ref.goRouter;
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_dapp_2/presentation/home/home_navigation_page.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/pokemon_list_page.dart';

const _slash = '/';
const _pokemonListPage = 'pokemonList';
const _pokedexListPage = '_pokedexListPage';

const _pokemonListPath = _slash + _pokemonListPage;
const _pokedexListPath = _slash + _pokedexListPage;

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
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _pokedexNavigatorKey,
              routes: [
                GoRoute(
                  path: _pokedexListPath,
                  builder: (context, state) => PokemonListPage.create(),
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

extension GoRouterConsumerExtension on WidgetRef {
  GoRouter get goRouter => watch(goRouterProvider);
}

extension GoRouterStateExtension on ConsumerState {
  GoRouter get goRouter => ref.goRouter;
}

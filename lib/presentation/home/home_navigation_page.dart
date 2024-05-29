import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/presentation/common/bottom_navigation/poke_dapp_navbar_item.dart';
import 'package:poke_dapp_2/presentation/common/bottom_navigation/poke_dapp_navbar_scaffold.dart';
import 'package:poke_dapp_2/presentation/common/pokedapp_view_keys.dart';

class HomeNavigationPage extends ConsumerStatefulWidget {
  const HomeNavigationPage({
    required this.navigationShell,
    required this.pokemonNavigatorKey,
    required this.pokedexNavigatorKey,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final GlobalKey<NavigatorState> pokemonNavigatorKey;
  final GlobalKey<NavigatorState> pokedexNavigatorKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeNavigationPageState();
}

class _HomeNavigationPageState extends ConsumerState<HomeNavigationPage> {
  StatefulNavigationShell get _navigationShell => widget.navigationShell;

  GlobalKey<NavigatorState> get _pokemonNavigatorKey => widget.pokemonNavigatorKey;

  GlobalKey<NavigatorState> get _pokedexNavigatorKey =>
      widget.pokedexNavigatorKey;

  @override
  Widget build(BuildContext context) {
    return PokeDappNavBarScaffold(
      navigationShell: _navigationShell,
      navigationBarItems: [
        PokeDappNavBarItem(
          key: PokeDappViewKeys.pokeDappBottomNavigationBarPokemon,
          svgIcon: ref.assets.pokeballIcon,
          title: s.bottomNavigationPokemonItem,
          navigatorKey: _pokemonNavigatorKey,
        ),
        PokeDappNavBarItem(
          key: PokeDappViewKeys.pokeDappBottomNavigationBarPokedex,
          svgIcon: ref.assets.pokedexIcon,
          title: s.bottomNavigationPokedexItem,
          navigatorKey: _pokedexNavigatorKey,
        ),
      ],
    );
  }
}

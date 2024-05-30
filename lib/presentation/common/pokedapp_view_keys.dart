import 'package:flutter/material.dart';

abstract class PokeDappViewKeys {

  // Pokemon List Page
  static const pokemonListPageGridView = ValueKey(
    'view.pokemon_list_page.grid_view',
  );

  // Pokemon Detail Page

  static const pokemonDetailPagePokemonNumber = ValueKey(
    'view.pokemon_detail_page.pokemon_number',
  );

  static const pokemonDetailPagePokemonDescription = ValueKey(
    'view.pokemon_detail_page.pokemon_description',
  );

  // Bottom Navigation

  static const pokeDappBottomNavigationBar = ValueKey(
    'view.bottom_navigation',
  );

  static const pokeDappBottomNavigationBarPokemon = ValueKey(
    'view.bottom_navigation.poke_dapp_bottom_navigation_bar_pokemon',
  );

  static const pokeDappBottomNavigationBarPokedex = ValueKey(
    'view.bottom_navigation.poke_dapp_bottom_navigation_bar_pokedex',
  );
}
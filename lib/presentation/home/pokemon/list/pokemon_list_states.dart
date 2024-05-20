import 'package:poke_dapp_2/data/view/model/pokemon_summary_vm.dart';

abstract class PokemonListState {}

class Success extends PokemonListState {
  Success({required this.pokemonList});

  final List<PokemonSummaryVM> pokemonList;
}

class Loading extends PokemonListState {}

class Error extends PokemonListState {}
import 'package:poke_dapp_2/data/view/model/pokemon_summary_vm.dart';
import 'package:poke_dapp_2/presentation/common/utils/generic_error_view.dart';

abstract class PokemonListState {}

class Success implements PokemonListState {
  Success({required this.pokemonList});

  final List<PokemonSummaryVM> pokemonList;
}

class Loading implements PokemonListState {}

class Error implements PokemonListState, GenericErrorView {
  const Error(this.type);

  @override
  final GenericErrorViewType type;
}

class Initial implements PokemonListState {}
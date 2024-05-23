import 'package:poke_dapp_2/data/view/model/pokemon_detail_vm.dart';

abstract class PokemonDetailState {}

class Success extends PokemonDetailState {
  Success({required this.pokemonDetail});

  final PokemonDetailVM pokemonDetail;
}

class Loading extends PokemonDetailState {}

class Error extends PokemonDetailState {}
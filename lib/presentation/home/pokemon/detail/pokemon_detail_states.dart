import 'package:poke_dapp_2/data/view/model/pokemon_detail_vm.dart';
import 'package:poke_dapp_2/presentation/common/utils/generic_error_view.dart';

abstract class PokemonDetailState {}

class Success implements PokemonDetailState {
  Success({required this.pokemonDetail});

  final PokemonDetailVM pokemonDetail;
}

class Loading implements PokemonDetailState {}

class Error implements PokemonDetailState, GenericErrorView {
  const Error(this.type);

  @override
  final GenericErrorViewType type;
}
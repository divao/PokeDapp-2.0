import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonListBlocProvider = Provider.autoDispose<PokemonListBloc>((ref) {
  final bloc = PokemonListBloc();
  // ref.onDispose(bloc.onDispose);
  return bloc;
});

class PokemonListBloc {

}
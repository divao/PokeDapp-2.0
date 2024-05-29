import 'package:bloc/bloc.dart';
import 'package:domain/use_case/get_pokemon_summary_list_uc.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/providers/general_provider.dart';
import 'package:poke_dapp_2/data/mappers/domain_to_view.dart';
import 'package:poke_dapp_2/presentation/common/utils/generic_error_view.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/bloc/pokemon_list_event.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/bloc/pokemon_list_state.dart';

final pokemonListBlocProvider = Provider.autoDispose<PokemonListBloc>((ref) {
  final getPokemonSummaryListUC = ref.watch(getPokemonSummaryListUCProvider);
  return PokemonListBloc(
    getPokemonSummaryListUC: getPokemonSummaryListUC,
  );
});

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc({
    required GetPokemonSummaryListUC getPokemonSummaryListUC,
  })  : _getPokemonSummaryListUC = getPokemonSummaryListUC,
        super(Loading()) {
    on<GetPokemonList>(_fetchPokemonList);
    on<TryAgain>(_fetchPokemonList);
  }

  final GetPokemonSummaryListUC _getPokemonSummaryListUC;

  void _fetchPokemonList(PokemonListEvent event, Emitter emit) async {
    emit(Loading());
    try {
      final pokemonList = await _getPokemonSummaryListUC.getFuture(NoParams());
      emit(Success(
          pokemonList: pokemonList.map((pokemon) => pokemon.toVM()).toList()));
    } catch (e) {
      emit(Error(mapToGenericViewErrorType(e)));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:domain/use_case/get_pokemon_detail_uc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/providers/general_provider.dart';
import 'package:poke_dapp_2/data/mappers/domain_to_view.dart';
import 'package:poke_dapp_2/presentation/common/utils/generic_error_view.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/bloc/pokemon_detail_event.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/bloc/pokemon_detail_state.dart';

final pokemonDetailBlocProvider =
    Provider.family.autoDispose<PokemonDetailBloc, int>((ref, pokemonId) {
  final getPokemonDetailUC = ref.watch(getPokemonDetailUCProvider);
  return PokemonDetailBloc(
    getPokemonDetailUC: getPokemonDetailUC,
    pokemonId: pokemonId,
  );
});

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  PokemonDetailBloc({
    required GetPokemonDetailUC getPokemonDetailUC,
    required int pokemonId,
  })  : _getPokemonDetailUC = getPokemonDetailUC,
        _pokemonId = pokemonId,
        super(Initial()) {
    on<GetPokemonDetail>(_fetchPokemonDetail);
    on<TryAgain>(_fetchPokemonDetail);
  }

  final GetPokemonDetailUC _getPokemonDetailUC;

  final int _pokemonId;

  void _fetchPokemonDetail(PokemonDetailEvent event, Emitter emit) async {
    emit(Loading());
    try {
      final pokemonDetail = await _getPokemonDetailUC
          .getFuture(GetPokemonDetailUCParams(_pokemonId));
      emit(Success(pokemonDetail: pokemonDetail.toVM()));
    } catch (e) {
      emit(Error(mapToGenericViewErrorType(e)));
    }
  }
}

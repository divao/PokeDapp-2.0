import 'package:domain/use_case/get_pokemon_detail_uc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/providers/general_provider.dart';
import 'package:poke_dapp_2/common/subscription_holder.dart';
import 'package:poke_dapp_2/data/mappers/domain_to_view.dart';
import 'package:poke_dapp_2/presentation/common/utils/generic_error_view.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/pokemon_detail_states.dart';
import 'package:rxdart/rxdart.dart';

final pokemonDetailBlocProvider =
    Provider.family.autoDispose<PokemonDetailBloc, int>((ref, pokemonId) {
  final getPokemonDetailUC = ref.watch(getPokemonDetailUCProvider);
  final bloc = PokemonDetailBloc(
    getPokemonDetailUC: getPokemonDetailUC,
    pokemonId: pokemonId,
  );
  ref.onDispose(() => bloc.dispose());
  return bloc;
});

class PokemonDetailBloc with SubscriptionHolder {
  PokemonDetailBloc({
    required GetPokemonDetailUC getPokemonDetailUC,
    required int pokemonId,
  })  : _getPokemonDetailUC = getPokemonDetailUC,
        _pokemonId = pokemonId {
    Rx.merge<dynamic>([
      Stream.value(null),
      _onTryAgainSubject,
    ])
        .flatMap(
          (_) => _fetchPokemonDetail(),
        )
        .listen(_pokemonDetailSubject.add)
        .addTo(subscriptions);
  }

  final GetPokemonDetailUC _getPokemonDetailUC;

  final int _pokemonId;

  final _onTryAgainSubject = BehaviorSubject<void>();

  Sink<void> get onTryAgainSink => _onTryAgainSubject.sink;

  final _pokemonDetailSubject =
      BehaviorSubject<PokemonDetailState>.seeded(Loading());

  Stream<PokemonDetailState> get pokemonDetailStream =>
      _pokemonDetailSubject.stream;

  Sink<PokemonDetailState> get pokemonDetailSink => _pokemonDetailSubject.sink;

  Stream<PokemonDetailState> _fetchPokemonDetail() async* {
    yield Loading();
    try {
      final pokemonDetail = await _getPokemonDetailUC
          .getFuture(GetPokemonDetailUCParams(_pokemonId));
      yield Success(pokemonDetail: pokemonDetail.toVM());
    } catch (e) {
      yield Error(mapToGenericViewErrorType(e));
    }
  }

  void dispose() {
    _pokemonDetailSubject.close();
    _onTryAgainSubject.close();
    disposeAll();
  }
}

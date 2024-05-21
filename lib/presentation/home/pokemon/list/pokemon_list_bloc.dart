import 'package:domain/use_case/get_pokemon_summary_list_uc.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/providers/general_provider.dart';
import 'package:poke_dapp_2/common/subscription_holder.dart';
import 'package:poke_dapp_2/data/mappers/domain_to_view.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/pokemon_list_states.dart';
import 'package:rxdart/rxdart.dart';

final pokemonListBlocProvider = Provider.autoDispose<PokemonListBloc>((ref) {
  final getPokemonSummaryListUC = ref.watch(getPokemonSummaryListUCProvider);
  final bloc = PokemonListBloc(
    getPokemonSummaryListUC: getPokemonSummaryListUC,
  );
  ref.onDispose(bloc.dispose);
  return bloc;
});

class PokemonListBloc with SubscriptionHolder {
  PokemonListBloc({
    required GetPokemonSummaryListUC getPokemonSummaryListUC,
  }) : _getPokemonSummaryListUC = getPokemonSummaryListUC {
    Rx.merge<dynamic>([
      Stream.value(null),
      _onTryAgainSubject,
    ])
        .flatMap(
          (_) => _fetchPokemonList(),
        )
        .listen(_pokemonListSubject.add)
        .addTo(subscriptions);
  }

  final GetPokemonSummaryListUC _getPokemonSummaryListUC;

  final _onTryAgainSubject = BehaviorSubject<void>();

  Sink<void> get onTryAgainSink => _onTryAgainSubject.sink;

  final _pokemonListSubject =
      BehaviorSubject<PokemonListState>.seeded(Loading());

  Stream<PokemonListState> get pokemonListStream => _pokemonListSubject.stream;

  Sink<PokemonListState> get pokemonListSink => _pokemonListSubject.sink;

  Stream<PokemonListState> _fetchPokemonList() async* {
    yield Loading();
    try {
      final pokemonList = await _getPokemonSummaryListUC.getFuture(NoParams());
      yield Success(pokemonList: pokemonList.map((pokemon) => pokemon.toVM()).toList());
    } catch (e) {
      yield Error();
    }
  }

  void dispose() {
    _pokemonListSubject.close();
    _onTryAgainSubject.close();
    disposeAll();
  }
}

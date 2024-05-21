import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/presentation/common/async_snapshot_response_view.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/pokemon_detail_bloc.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/pokemon_detail_states.dart';

class PokemonDetailPage extends ConsumerStatefulWidget {
  const PokemonDetailPage({
    required this.bloc,
    required this.pokemonId,
    super.key,
  });

  static Widget create({
    required int pokemonId,
  }) =>
      Consumer(
        builder: (_, ref, __) {
          final bloc = ref.watch(pokemonDetailBlocProvider(pokemonId));
          return PokemonDetailPage(bloc: bloc, pokemonId: pokemonId);
        },
      );

  final int pokemonId;
  final PokemonDetailBloc bloc;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonDetailPageState();
}

class _PokemonDetailPageState extends ConsumerState<PokemonDetailPage> {
  PokemonDetailBloc get _bloc => widget.bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Detail'),
      ),
      body: StreamBuilder<PokemonDetailState>(
        stream: _bloc.pokemonDetailStream,
        builder: (context, snapshot) {
          return AsyncSnapshotResponseView<Loading, Error, Success>(
              snapshot: snapshot,
              onTryAgainTap: () => _bloc.onTryAgainSink.add(null),
              successWidgetBuilder: (context, success) {
                final pokemonDetail = success.pokemonDetail;
                return Container();
              }
          );
        },
      ),
    );
  }
}
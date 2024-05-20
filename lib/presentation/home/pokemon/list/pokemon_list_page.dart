import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/common/providers/general_provider.dart';
import 'package:poke_dapp_2/presentation/common/async_snapshot_response_view.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/pokemon_list_bloc.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/pokemon_list_states.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/widgets/pokemon_summary_item.dart';

class PokemonListPage extends ConsumerStatefulWidget {
  const PokemonListPage({
    required this.bloc,
    super.key,
  });

  final PokemonListBloc bloc;

  static Widget create() => Consumer(
        builder: (context, ref, _) {
          final bloc = ref.watch(pokemonListBlocProvider);
          return PokemonListPage(bloc: bloc);
        },
      );

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonListPageState();
}

class _PokemonListPageState extends ConsumerState<PokemonListPage> {
  PokemonListBloc get _bloc => widget.bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.s.appTitle),
      ),
      body: StreamBuilder<PokemonListState>(
          stream: _bloc.pokemonListStream,
          builder: (context, snapshot) {
            return AsyncSnapshotResponseView<Loading, Error, Success>(
                snapshot: snapshot,
                onTryAgainTap: () => _bloc.onTryAgainSink.add(null),
                successWidgetBuilder: (context, success) {
                  final pokemonList = success.pokemonList;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    itemCount: pokemonList.length,
                    itemBuilder: (context, index) => PokemonSummaryItem(
                      pokemonSummary: pokemonList[index],
                    ),
                  );
                });
          }),
    );
  }
}

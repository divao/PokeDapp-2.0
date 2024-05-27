import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/presentation/common/state_response_view.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/bloc/pokemon_list_bloc.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/bloc/pokemon_list_event.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/bloc/pokemon_list_state.dart';
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
  void initState() {
    super.initState();
    _bloc.add(GetPokemonList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.s.appTitle,
          style: ref.textStyles.appBarTitle,
        ),
        backgroundColor: ref.colors.primaryColor,
      ),
      backgroundColor: ref.colors.surfaceColor,
      body: BlocBuilder<PokemonListBloc, PokemonListState>(
          bloc: _bloc,
          builder: (context, state) {
            return StateResponseView<Loading, Error, Success>(
                state: state,
                onTryAgainTap: () => _bloc.add(TryAgain()),
                successWidgetBuilder: (context, success) {
                  final pokemonList = success.pokemonList;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
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

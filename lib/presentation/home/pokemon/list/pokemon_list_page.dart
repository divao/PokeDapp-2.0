import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/pokemon_list_bloc.dart';

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
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends ConsumerState<PokemonListPage> {
  PokemonListBloc get _bloc => widget.bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.s.appTitle),
      ),
      body: const Center(
        child: Text('Pokemon List Page'),
      ),
    );
  }
}

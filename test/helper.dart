import 'package:domain/model/pokemon_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/utils/utils.dart';

Future<void> delayTime({
  Duration duration = const Duration(milliseconds: 100),
}) async {
  await Future<void>.delayed(duration);
}

class Mocks {
  static final pokemonSummaryList = [
    PokemonSummary(id: 1, name: 'Bulbasaur', imageUrl: pokemonIdToOfficialImageUrl(1)),
    PokemonSummary(id: 2, name: 'Ivysaur', imageUrl: pokemonIdToOfficialImageUrl(2)),
    PokemonSummary(id: 3, name: 'Venusaur', imageUrl: pokemonIdToOfficialImageUrl(3)),
    PokemonSummary(id: 4, name: 'Charmander', imageUrl: pokemonIdToOfficialImageUrl(4)),
    PokemonSummary(id: 5, name: 'Charmeleon', imageUrl: pokemonIdToOfficialImageUrl(5)),
    PokemonSummary(id: 6, name: 'Charizard', imageUrl: pokemonIdToOfficialImageUrl(6)),
    PokemonSummary(id: 7, name: 'Squirtle', imageUrl: pokemonIdToOfficialImageUrl(7)),
    PokemonSummary(id: 8, name: 'Wartortle', imageUrl: pokemonIdToOfficialImageUrl(8)),
    PokemonSummary(id: 9, name: 'Blastoise', imageUrl: pokemonIdToOfficialImageUrl(9)),
  ];
}

class TestGeneralProvider extends ConsumerWidget {
  const TestGeneralProvider({
    required this.child,
    this.overrides = const [],
    super.key,
  });
  final Widget child;
  final List<Override> overrides;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: overrides,
      child: child,
    );
  }
}
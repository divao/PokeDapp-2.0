import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poke_dapp_2/generated/l10n.dart';
import 'package:poke_dapp_2/main.dart' as app;
import 'package:poke_dapp_2/presentation/common/pokedapp_view_keys.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/pokemon_detail_page.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/pokemon_list_page.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/widgets/pokemon_summary_item.dart';

import '../test/helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized().framePolicy =
      LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('PokeDapp basic flow', (tester) async {
    await app.main();
    await tester.pump();
    await delayTime(duration: const Duration(seconds: 5));

    final pokeDappBottomNavigationBar =
        find.byKey(PokeDappViewKeys.pokeDappBottomNavigationBar);
    final pokeDappBottomNavigationPokemonItem =
        find.byKey(PokeDappViewKeys.pokeDappBottomNavigationBarPokemon);
    final pokeDappBottomNavigationPokedexItem =
        find.byKey(PokeDappViewKeys.pokeDappBottomNavigationBarPokedex);

    expect(pokeDappBottomNavigationBar, findsOneWidget);
    expect(pokeDappBottomNavigationPokemonItem, findsOneWidget);
    expect(pokeDappBottomNavigationPokedexItem, findsOneWidget);

    final pokemonListPageFinder = find.byType(PokemonListPage);
    final pokemonListPageTitleFinder = find.text(S.current.appTitle);
    final pokemonListPageGridViewFinder =
        find.byKey(PokeDappViewKeys.pokemonListPageGridView);
    final pokemonSummaryItemFinder = find.byType(PokemonSummaryItem);

    expect(pokemonListPageFinder, findsOneWidget);
    expect(pokemonListPageTitleFinder, findsOneWidget);
    expect(pokemonListPageGridViewFinder, findsOneWidget);
    expect(pokemonSummaryItemFinder, findsWidgets);

    await tester.tapAt(const Offset(80, 140));
    await tester.pumpAndSettle();

    final pokemonDetailPageFinder = find.byType(PokemonDetailPage);
    final pokemonDetailPagePokemonNumberFinder =
        find.byKey(PokeDappViewKeys.pokemonDetailPagePokemonNumber);
    final pokemonDetailPagePokemonDescriptionFinder =
        find.byKey(PokeDappViewKeys.pokemonDetailPagePokemonDescription);

    expect(pokemonDetailPageFinder, findsOneWidget);
    expect(pokemonDetailPagePokemonNumberFinder, findsOneWidget);
    expect(pokemonDetailPagePokemonDescriptionFinder, findsOneWidget);

    await tester.tap(pokeDappBottomNavigationPokedexItem);
    await tester.pumpAndSettle();

    expect(pokemonListPageFinder, findsOneWidget);
    expect(pokemonListPageTitleFinder, findsOneWidget);
    expect(pokemonListPageGridViewFinder, findsOneWidget);
    expect(pokemonSummaryItemFinder, findsWidgets);

    await tester.tapAt(const Offset(80, 140));
    await tester.pumpAndSettle();

    expect(pokemonDetailPageFinder, findsOneWidget);
    expect(pokemonDetailPagePokemonNumberFinder, findsOneWidget);
    expect(pokemonDetailPagePokemonDescriptionFinder, findsOneWidget);
  });
}

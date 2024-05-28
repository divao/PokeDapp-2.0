import 'package:domain/use_case/get_pokemon_summary_list_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/bloc/pokemon_list_bloc.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/bloc/pokemon_list_event.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/list/bloc/pokemon_list_state.dart';

import '../../../../../helper.dart';
import 'pokemon_list_bloc_tests.mocks.dart';

@GenerateMocks([GetPokemonSummaryListUC])
void main() {
  late PokemonListBloc bloc;
  late MockGetPokemonSummaryListUC mockGetPokemonSummaryListUC;

  setUpAll(() {
    mockGetPokemonSummaryListUC = MockGetPokemonSummaryListUC();
  });

  Future<void> createBloc() async {
    bloc = PokemonListBloc(
      getPokemonSummaryListUC: mockGetPokemonSummaryListUC,
    );
  }

  test('Should emit Success state when list loads correctly', () async {
    when(mockGetPokemonSummaryListUC.getFuture(any)).thenAnswer(
      (_) async => Future.value(Mocks.pokemonSummaryList),
    );
    await createBloc();
    bloc.add(GetPokemonList());

    await expectLater(
      bloc.stream,
      emitsInOrder(
        [
          isA<Loading>(),
          isA<Success>(),
        ],
      ),
    );
    verify(mockGetPokemonSummaryListUC.getFuture(any)).called(1);
  });

  test('Should emit Error state when list loads incorrectly', () async {
    when(mockGetPokemonSummaryListUC.getFuture(any)).thenThrow(Exception());
    await createBloc();
    bloc.add(GetPokemonList());

    await expectLater(
      bloc.stream,
      emitsInOrder(
        [
          isA<Loading>(),
          isA<Error>(),
        ],
      ),
    );
    verify(mockGetPokemonSummaryListUC.getFuture(any)).called(1);
  });
}

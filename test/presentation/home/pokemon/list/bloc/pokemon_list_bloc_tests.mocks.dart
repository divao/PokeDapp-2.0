// Mocks generated by Mockito 5.4.4 from annotations
// in poke_dapp_2/test/presentation/home/pokemon/list/bloc/pokemon_list_bloc_tests.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:domain/data_repository/pokemon_data_repository.dart' as _i2;
import 'package:domain/logger.dart' as _i4;
import 'package:domain/model/pokemon_summary.dart' as _i6;
import 'package:domain/use_case/get_pokemon_summary_list_uc.dart' as _i3;
import 'package:domain/use_case/use_case.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePokemonDataRepository_0 extends _i1.SmartFake
    implements _i2.PokemonDataRepository {
  _FakePokemonDataRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetPokemonSummaryListUC].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPokemonSummaryListUC extends _i1.Mock
    implements _i3.GetPokemonSummaryListUC {
  MockGetPokemonSummaryListUC() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PokemonDataRepository get pokemonDataRepository => (super.noSuchMethod(
        Invocation.getter(#pokemonDataRepository),
        returnValue: _FakePokemonDataRepository_0(
          this,
          Invocation.getter(#pokemonDataRepository),
        ),
      ) as _i2.PokemonDataRepository);

  @override
  _i4.ErrorLogger get logger => (super.noSuchMethod(
        Invocation.getter(#logger),
        returnValue: (
          String errorType,
          dynamic error, [
          StackTrace? stackTrace,
        ]) =>
            _i5.Future<void>.value(),
      ) as _i4.ErrorLogger);

  @override
  _i5.Future<List<_i6.PokemonSummary>> getRawFuture(_i7.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRawFuture,
          [params],
        ),
        returnValue:
            _i5.Future<List<_i6.PokemonSummary>>.value(<_i6.PokemonSummary>[]),
      ) as _i5.Future<List<_i6.PokemonSummary>>);

  @override
  _i5.Future<List<_i6.PokemonSummary>> getFuture(_i7.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFuture,
          [params],
        ),
        returnValue:
            _i5.Future<List<_i6.PokemonSummary>>.value(<_i6.PokemonSummary>[]),
      ) as _i5.Future<List<_i6.PokemonSummary>>);
}

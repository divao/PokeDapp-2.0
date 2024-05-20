import 'package:domain/data_repository/pokemon_data_repository.dart';
import 'package:domain/model/pokemon_summary.dart';
import 'package:domain/use_case/use_case.dart';

class GetPokemonSummaryListUC extends UseCase<NoParams, List<PokemonSummary>> {
  GetPokemonSummaryListUC({
    required super.logger,
    required this.pokemonDataRepository,
  });

  final PokemonDataRepository pokemonDataRepository;

  @override
  Future<List<PokemonSummary>> getRawFuture(NoParams params) =>
      pokemonDataRepository.getPokemonSummaryList();
}

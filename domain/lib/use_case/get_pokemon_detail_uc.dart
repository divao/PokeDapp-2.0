import 'package:domain/data_repository/pokemon_data_repository.dart';
import 'package:domain/model/pokemon_detail.dart';
import 'package:domain/use_case/use_case.dart';

class GetPokemonDetailUC
    extends UseCase<GetPokemonDetailUCParams, PokemonDetail> {
  GetPokemonDetailUC({
    required super.logger,
    required this.pokemonDataRepository,
  });

  final PokemonDataRepository pokemonDataRepository;

  @override
  Future<PokemonDetail> getRawFuture(
    GetPokemonDetailUCParams params,
  ) =>
      pokemonDataRepository.getPokemonDetail(
        params.id,
      );
}

class GetPokemonDetailUCParams {
  GetPokemonDetailUCParams(this.id);

  final int id;
}

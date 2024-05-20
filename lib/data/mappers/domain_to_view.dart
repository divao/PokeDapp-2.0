import 'package:domain/model/pokemon_summary.dart';
import 'package:poke_dapp_2/data/view/model/pokemon_summary_vm.dart';

extension PokemonSummaryMappers on PokemonSummary {
  PokemonSummaryVM toVM() => PokemonSummaryVM(
        id: id,
        name: name,
        imageUrl: imageUrl,
      );
}
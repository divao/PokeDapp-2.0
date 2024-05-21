import 'package:domain/model/pokemon_detail.dart';
import 'package:domain/model/pokemon_summary.dart';
import 'package:poke_dapp_2/data/view/model/pokemon_detail_vm.dart';
import 'package:poke_dapp_2/data/view/model/pokemon_summary_vm.dart';

extension PokemonSummaryMappers on PokemonSummary {
  PokemonSummaryVM toVM() => PokemonSummaryVM(
        id: id,
        name: name,
        imageUrl: imageUrl,
      );
}

extension PokemonDetailVMMappers on PokemonDetail {
  PokemonDetailVM toVM() => PokemonDetailVM(
        id: id,
        name: name,
        imageUrl: imageUrl,
        types: types,
        stats: stats.map((stat) => stat.toVM()).toList(),
        cryUrl: cryUrl,
        description: description,
      );
}

extension PokemonStatMappers on PokemonStat {
  PokemonStatVM toVM() => PokemonStatVM(
        name: name,
        value: value,
      );
}
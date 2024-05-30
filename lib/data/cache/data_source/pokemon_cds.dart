import 'package:isar/isar.dart';
import 'package:poke_dapp_2/data/cache/model/pokemon_detail_cm.dart';
import 'package:poke_dapp_2/data/cache/model/pokemon_summary_cm.dart';

class PokemonCDS {
  PokemonCDS({
    required this.isar,
  });

  final Isar isar;

  Future<void> addPokemonSummaryList(List<PokemonSummaryCM> pokemonList) async =>
      isar.writeTxn(
        () => isar.pokemonSummaryCMs.putAll(pokemonList),
      );

  Future<List<PokemonSummaryCM>> fetchPokemonSummaryList() async => isar.txn(
        () async => isar.pokemonSummaryCMs.where().findAll(),
      );

  Future<bool> isPokemonDetailBoxEmpty() async {
    final itemsCount = await isar.pokemonDetailCMs.count();
    return itemsCount <= 0;
  }

  Future<bool> isPokemonDetailInBox(int pokemonId) async {
    final pokemonDetail = await isar.pokemonDetailCMs.get(pokemonId);
    return pokemonDetail != null;
  }

  Future<void> addPokemonDetail(PokemonDetailCM pokemonDetail) async =>
      isar.writeTxn(
        () => isar.pokemonDetailCMs.put(pokemonDetail),
      );

  Future<PokemonDetailCM?> fetchPokemonDetail(int pokemonId) async =>
      isar.pokemonDetailCMs.get(pokemonId);
}

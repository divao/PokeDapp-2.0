class UrlBuilder {
  static const _pokemonBaseUrl = 'https://pokeapi.co/api/v2/';

  static String pokemonSummaryList() => '$_pokemonBaseUrl?limit=151';

  static String pokemonDetail(int id) => '$_pokemonBaseUrl/$id';
}
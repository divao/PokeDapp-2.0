class UrlBuilder {
  static const _pokemonBaseUrl = 'https://pokeapi.co/api/v2/';

  static const _pokemonResource = 'pokemon';

  static String pokemonSummaryList() => '$_pokemonBaseUrl$_pokemonResource?limit=151';

  static String pokemonDetail(int id) => '$_pokemonBaseUrl$_pokemonResource/$id';
}
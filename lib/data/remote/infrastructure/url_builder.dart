class UrlBuilder {
  static const _pokemonBaseUrl = 'https://pokeapi.co/api/v2/';

  static const _pokemonResource = 'pokemon';

  static const _pokemonSpeciesResource = 'pokemon-species';

  static String pokemonSummaryList() => '$_pokemonBaseUrl$_pokemonResource?limit=151';

  static String pokemonAttributes(int id) => '$_pokemonBaseUrl$_pokemonResource/$id';

  static String pokemonDescription(int id) => '$_pokemonBaseUrl$_pokemonSpeciesResource/$id';
}
int pokemonUrlToId(String url) {
  final uri = Uri.parse(url);
  return int.parse(uri.pathSegments[uri.pathSegments.length - 2]);
}

String pokemonIdToOfficialImageUrl(int pokemonId) {
  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonId.png';
}

String pokemonIdToHomeImageUrl(int pokemonId) {
  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$pokemonId.png';
}

extension StringExtensions on String {
  String capitalize() {
    final lowerCaseString = toLowerCase();
    return lowerCaseString[0].toUpperCase() + lowerCaseString.substring(1);
  }

  String fixPokemonDescription() {
    return replaceAll(RegExp(r'[\n\r\f]'), ' ');
  }
}
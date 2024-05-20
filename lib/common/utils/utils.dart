int pokemonUrlToId(String url) {
  final uri = Uri.parse(url);
  return int.parse(uri.pathSegments[uri.pathSegments.length - 2]);
}

String pokemonIdToImageUrl(int pokemonId) {
  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonId.png';
}

extension StringExtensions on String {
  String capitalize() {
    final lowerCaseString = toLowerCase();
    return lowerCaseString[0].toUpperCase() + lowerCaseString.substring(1);
  }
}
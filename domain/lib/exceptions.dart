abstract class PokeDappException implements Exception {}

class UnexpectedException implements PokeDappException {}

class NoConnectionException implements PokeDappException {}

class ResourceAlreadyExistsException implements PokeDappException {}

class NullResponseException implements PokeDappException {}

class DatabaseNotStartedException implements PokeDappException {}

class ConnectionTimedOutException implements PokeDappException {}

class GetPokemonSummaryListException implements PokeDappException {}

class GetPokemonAttributesException implements PokeDappException {}

class GetPokemonDescriptionException implements PokeDappException {}
abstract class PokeDappException implements Exception {}

class UnexpectedException implements PokeDappException {}

class NoConnectionException implements PokeDappException {}

class ResourceAlreadyExistsException implements PokeDappException {}

class ObjectNotFoundException implements PokeDappException {}

class DatabaseNotStartedException implements PokeDappException {}

class ConnectionTimedOutException implements PokeDappException {}
// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static String m0(pokemonId) => "No. ${pokemonId}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("PokéDapp"),
        "audioErrorMessage": MessageLookupByLibrary.simpleMessage(
            "An error occurred while loading the audio."),
        "audioErrorTitle": MessageLookupByLibrary.simpleMessage("Error"),
        "bottomNavigationPokedexItem":
            MessageLookupByLibrary.simpleMessage("Pokédex"),
        "bottomNavigationPokemonItem":
            MessageLookupByLibrary.simpleMessage("Pokémon"),
        "genericError":
            MessageLookupByLibrary.simpleMessage("Something went wrong."),
        "noInternetError":
            MessageLookupByLibrary.simpleMessage("No internet connection."),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "pokemonDetailTitle":
            MessageLookupByLibrary.simpleMessage("Pokémon Details"),
        "pokemonNumber": m0,
        "pokemonStatAttack": MessageLookupByLibrary.simpleMessage("Attack"),
        "pokemonStatDefense": MessageLookupByLibrary.simpleMessage("Defense"),
        "pokemonStatHp": MessageLookupByLibrary.simpleMessage("HP"),
        "pokemonStatSpecialAttack":
            MessageLookupByLibrary.simpleMessage("Sp. Atk"),
        "pokemonStatSpecialDefense":
            MessageLookupByLibrary.simpleMessage("Sp. Def"),
        "pokemonStatSpeed": MessageLookupByLibrary.simpleMessage("Speed"),
        "timeoutError":
            MessageLookupByLibrary.simpleMessage("Internal server error."),
        "tryAgain": MessageLookupByLibrary.simpleMessage("TRY AGAIN")
      };
}

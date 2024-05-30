// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `PokéDapp`
  String get appTitle {
    return Intl.message(
      'PokéDapp',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pokémon`
  String get bottomNavigationPokemonItem {
    return Intl.message(
      'Pokémon',
      name: 'bottomNavigationPokemonItem',
      desc: '',
      args: [],
    );
  }

  /// `Pokédex`
  String get bottomNavigationPokedexItem {
    return Intl.message(
      'Pokédex',
      name: 'bottomNavigationPokedexItem',
      desc: '',
      args: [],
    );
  }

  /// `Pokémon Details`
  String get pokemonDetailTitle {
    return Intl.message(
      'Pokémon Details',
      name: 'pokemonDetailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get genericError {
    return Intl.message(
      'Something went wrong.',
      name: 'genericError',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error.`
  String get timeoutError {
    return Intl.message(
      'Internal server error.',
      name: 'timeoutError',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection.`
  String get noInternetError {
    return Intl.message(
      'No internet connection.',
      name: 'noInternetError',
      desc: '',
      args: [],
    );
  }

  /// `TRY AGAIN`
  String get tryAgain {
    return Intl.message(
      'TRY AGAIN',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `No. {pokemonId}`
  String pokemonNumber(Object pokemonId) {
    return Intl.message(
      'No. $pokemonId',
      name: 'pokemonNumber',
      desc: '',
      args: [pokemonId],
    );
  }

  /// `HP`
  String get pokemonStatHp {
    return Intl.message(
      'HP',
      name: 'pokemonStatHp',
      desc: '',
      args: [],
    );
  }

  /// `Attack`
  String get pokemonStatAttack {
    return Intl.message(
      'Attack',
      name: 'pokemonStatAttack',
      desc: '',
      args: [],
    );
  }

  /// `Defense`
  String get pokemonStatDefense {
    return Intl.message(
      'Defense',
      name: 'pokemonStatDefense',
      desc: '',
      args: [],
    );
  }

  /// `Sp. Atk`
  String get pokemonStatSpecialAttack {
    return Intl.message(
      'Sp. Atk',
      name: 'pokemonStatSpecialAttack',
      desc: '',
      args: [],
    );
  }

  /// `Sp. Def`
  String get pokemonStatSpecialDefense {
    return Intl.message(
      'Sp. Def',
      name: 'pokemonStatSpecialDefense',
      desc: '',
      args: [],
    );
  }

  /// `Speed`
  String get pokemonStatSpeed {
    return Intl.message(
      'Speed',
      name: 'pokemonStatSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get audioErrorTitle {
    return Intl.message(
      'Error',
      name: 'audioErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while loading the audio.`
  String get audioErrorMessage {
    return Intl.message(
      'An error occurred while loading the audio.',
      name: 'audioErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

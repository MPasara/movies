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

  /// `🔥 Popular`
  String get popular_header {
    return Intl.message(
      '🔥 Popular',
      name: 'popular_header',
      desc: '',
      args: [],
    );
  }

  /// `😍 Favourites`
  String get favourites_header {
    return Intl.message(
      '😍 Favourites',
      name: 'favourites_header',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get favourites {
    return Intl.message(
      'Favourites',
      name: 'favourites',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Search movies`
  String get search_movies {
    return Intl.message(
      'Search movies',
      name: 'search_movies',
      desc: '',
      args: [],
    );
  }

  /// `Search results`
  String get search_results_header {
    return Intl.message(
      'Search results',
      name: 'search_results_header',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Something went wrong`
  String get oops_error_message {
    return Intl.message(
      'Oops! Something went wrong',
      name: 'oops_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get try_again {
    return Intl.message(
      'Try again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `🍿 No favourites yet?\n Your top picks will appear here soon! 🎥✨`
  String get no_favourite_movies {
    return Intl.message(
      '🍿 No favourites yet?\n Your top picks will appear here soon! 🎥✨',
      name: 'no_favourite_movies',
      desc: '',
      args: [],
    );
  }

  /// `Start adding movies to your favourites`
  String get start_adding_movies {
    return Intl.message(
      'Start adding movies to your favourites',
      name: 'start_adding_movies',
      desc: '',
      args: [],
    );
  }

  /// `{rating} / 10 IMDb`
  String movie_rating(Object rating) {
    return Intl.message(
      '$rating / 10 IMDb',
      name: 'movie_rating',
      desc: '',
      args: [rating],
    );
  }

  /// `No movies found for {query}`
  String no_movies_found(Object query) {
    return Intl.message(
      'No movies found for $query',
      name: 'no_movies_found',
      desc: '',
      args: [query],
    );
  }

  /// `Found {count} movies`
  String search_result(Object count) {
    return Intl.message(
      'Found $count movies',
      name: 'search_result',
      desc: '',
      args: [count],
    );
  }

  /// `No movies found\nTry a different search term`
  String get no_movies_found_body {
    return Intl.message(
      'No movies found\nTry a different search term',
      name: 'no_movies_found_body',
      desc: '',
      args: [],
    );
  }

  /// `No movies available`
  String get no_movies_available {
    return Intl.message(
      'No movies available',
      name: 'no_movies_available',
      desc: '',
      args: [],
    );
  }

  /// `⚙️ General`
  String get general {
    return Intl.message(
      '⚙️ General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language {
    return Intl.message(
      'Change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Croatian`
  String get croatian {
    return Intl.message(
      'Croatian',
      name: 'croatian',
      desc: '',
      args: [],
    );
  }

  /// `Failed to fetch genres..`
  String get failed_to_fetch_genres {
    return Intl.message(
      'Failed to fetch genres..',
      name: 'failed_to_fetch_genres',
      desc: '',
      args: [],
    );
  }

  /// `Failed to fetch popular movies..`
  String get failed_to_fetch_popular_movies {
    return Intl.message(
      'Failed to fetch popular movies..',
      name: 'failed_to_fetch_popular_movies',
      desc: '',
      args: [],
    );
  }

  /// `Search movies failed..`
  String get search_failed {
    return Intl.message(
      'Search movies failed..',
      name: 'search_failed',
      desc: '',
      args: [],
    );
  }

  /// `Fetch language failed..`
  String get fetch_language_failed {
    return Intl.message(
      'Fetch language failed..',
      name: 'fetch_language_failed',
      desc: '',
      args: [],
    );
  }

  /// `Set language failed..`
  String get set_language_failed {
    return Intl.message(
      'Set language failed..',
      name: 'set_language_failed',
      desc: '',
      args: [],
    );
  }

  /// `Favourite movie failed..`
  String get favourite_movie_failed {
    return Intl.message(
      'Favourite movie failed..',
      name: 'favourite_movie_failed',
      desc: '',
      args: [],
    );
  }

  /// `Load favourite movies failed..`
  String get load_favourite_movies_failed {
    return Intl.message(
      'Load favourite movies failed..',
      name: 'load_favourite_movies_failed',
      desc: '',
      args: [],
    );
  }

  /// `Unfavourite movie failed`
  String get unfavourite_movie_failed {
    return Intl.message(
      'Unfavourite movie failed',
      name: 'unfavourite_movie_failed',
      desc: '',
      args: [],
    );
  }

  /// `Released on`
  String get released_on {
    return Intl.message(
      'Released on',
      name: 'released_on',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hr'),
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

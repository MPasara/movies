// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hr locale. All the
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
  String get localeName => 'hr';

  static String m0(rating) => "${rating} / 10 IMDb";

  static String m1(query) => "Nema pronađenih filmova za ${query}";

  static String m2(count) => "Pronađeno ${count} filmova";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "change_language":
            MessageLookupByLibrary.simpleMessage("Promijeni jezik"),
        "croatian": MessageLookupByLibrary.simpleMessage("Hrvatski"),
        "description": MessageLookupByLibrary.simpleMessage("Opis"),
        "english": MessageLookupByLibrary.simpleMessage("Engleski"),
        "failed_to_fetch_genres": MessageLookupByLibrary.simpleMessage(
            "Dohvaćanje žanrova nije uspjelo.."),
        "failed_to_fetch_popular_movies": MessageLookupByLibrary.simpleMessage(
            "Dohvaćanje filmova nije uspjelo.."),
        "favourite_movie_failed": MessageLookupByLibrary.simpleMessage(
            "Favoriranje filma nije uspjelo.."),
        "favourites": MessageLookupByLibrary.simpleMessage("Favoriti"),
        "favourites_header":
            MessageLookupByLibrary.simpleMessage("😍 Favoriti"),
        "fetch_language_failed": MessageLookupByLibrary.simpleMessage(
            "Dohvaćanje jezika nije uspjelo.."),
        "general": MessageLookupByLibrary.simpleMessage("⚙️ Općenito"),
        "load_favourite_movies_failed": MessageLookupByLibrary.simpleMessage(
            "Učitavanje spremljenih filmova nije uspjelo.."),
        "movie_rating": m0,
        "no_favourite_movies": MessageLookupByLibrary.simpleMessage(
            "🍿 Još nema favorita?\nTvoji najbolji odabiri uskoro će se pojaviti ovdje! 🎥✨"),
        "no_movies_available":
            MessageLookupByLibrary.simpleMessage("Nema dostupnih filmova"),
        "no_movies_found": m1,
        "no_movies_found_body": MessageLookupByLibrary.simpleMessage(
            "Nema pronađenih filmova\nPokušaj s drugim pojmom"),
        "oops_error_message":
            MessageLookupByLibrary.simpleMessage("Ups! Nešto je pošlo po zlu"),
        "popular": MessageLookupByLibrary.simpleMessage("Popularno"),
        "popular_header": MessageLookupByLibrary.simpleMessage("🔥 Popularno"),
        "released_on": MessageLookupByLibrary.simpleMessage("Datum izlaska"),
        "search_failed": MessageLookupByLibrary.simpleMessage(
            "Pretraga filmova nije uspjela.."),
        "search_movies":
            MessageLookupByLibrary.simpleMessage("Pretraži filmove"),
        "search_result": m2,
        "search_results_header":
            MessageLookupByLibrary.simpleMessage("Rezultati pretrage"),
        "set_language_failed": MessageLookupByLibrary.simpleMessage(
            "Postavljanje jezika nije uspjelo.."),
        "start_adding_movies": MessageLookupByLibrary.simpleMessage(
            "Počni dodavati filmove u svoje favorite"),
        "try_again": MessageLookupByLibrary.simpleMessage("Pokušaj ponovno"),
        "unfavourite_movie_failed": MessageLookupByLibrary.simpleMessage(
            "Neuspješno dodavanje filma u favorite")
      };
}

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(rating) => "${rating} / 10 IMDb";

  static String m1(query) => "No movies found for ${query}";

  static String m2(count) => "Found ${count} movies";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "change_language": MessageLookupByLibrary.simpleMessage("Change language"),
    "croatian": MessageLookupByLibrary.simpleMessage("Croatian"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "failed_to_fetch_genres": MessageLookupByLibrary.simpleMessage(
      "Failed to fetch genres..",
    ),
    "failed_to_fetch_popular_movies": MessageLookupByLibrary.simpleMessage(
      "Failed to fetch popular movies..",
    ),
    "favourite_movie_failed": MessageLookupByLibrary.simpleMessage(
      "Favourite movie failed..",
    ),
    "favourites": MessageLookupByLibrary.simpleMessage("Favourites"),
    "favourites_header": MessageLookupByLibrary.simpleMessage("😍 Favourites"),
    "fetch_language_failed": MessageLookupByLibrary.simpleMessage(
      "Fetch language failed..",
    ),
    "general": MessageLookupByLibrary.simpleMessage("⚙️ General"),
    "load_favourite_movies_failed": MessageLookupByLibrary.simpleMessage(
      "Load favourite movies failed..",
    ),
    "movie_rating": m0,
    "no_favourite_movies": MessageLookupByLibrary.simpleMessage(
      "🍿 No favourites yet?\n Your top picks will appear here soon! 🎥✨",
    ),
    "no_movies_available": MessageLookupByLibrary.simpleMessage(
      "No movies available",
    ),
    "no_movies_found": m1,
    "no_movies_found_body": MessageLookupByLibrary.simpleMessage(
      "No movies found\nTry a different search term",
    ),
    "oops_error_message": MessageLookupByLibrary.simpleMessage(
      "Oops! Something went wrong",
    ),
    "popular": MessageLookupByLibrary.simpleMessage("Popular"),
    "popular_header": MessageLookupByLibrary.simpleMessage("🔥 Popular"),
    "search_failed": MessageLookupByLibrary.simpleMessage(
      "Search movies failed..",
    ),
    "search_movies": MessageLookupByLibrary.simpleMessage("Search movies"),
    "search_result": m2,
    "search_results_header": MessageLookupByLibrary.simpleMessage(
      "Search results",
    ),
    "set_language_failed": MessageLookupByLibrary.simpleMessage(
      "Set language failed..",
    ),
    "start_adding_movies": MessageLookupByLibrary.simpleMessage(
      "Start adding movies to your favourites",
    ),
    "try_again": MessageLookupByLibrary.simpleMessage("Try again"),
    "unfavourite_movie_failed": MessageLookupByLibrary.simpleMessage(
      "Unfavourite movie failed",
    ),
  };
}

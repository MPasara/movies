import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/favourite/data/repositories/favourite_movies_repository.dart';
import 'package:movies/features/favourite/domain/blocs/favourite_movie_event.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';

class FavouriteMoviesBloc extends Bloc<FavouriteMoviesEvent, Map<int, Movie>> {
  FavouriteMoviesBloc(this._favouriteMoviesRepository) : super({}) {
    on<LoadFavouriteMovies>(_loadFavouriteMovies);
    on<ToggleFavouriteMovie>(_toggleFavouriteMovie);

    // Auto-load favourites when bloc is created
    add(const LoadFavouriteMovies());
  }

  final FavouriteMoviesRepository _favouriteMoviesRepository;

  Future<void> _loadFavouriteMovies(
    LoadFavouriteMovies event,
    Emitter<Map<int, Movie>> emit,
  ) async {
    final result = await _favouriteMoviesRepository.loadFavouriteMovies();

    result.fold(
      (failure) {
        // Handle error - you might want to emit error to a separate stream
        // or use a global error handler
        log('Failed to load favourite movies: ${failure.message}');
      },
      (favouriteMovies) {
        final favouriteMoviesMap = Map<int, Movie>.fromEntries(
          favouriteMovies.map((movie) => MapEntry(movie.id, movie)),
        );
        emit(favouriteMoviesMap);
      },
    );
  }

  Future<void> _toggleFavouriteMovie(
    ToggleFavouriteMovie event,
    Emitter<Map<int, Movie>> emit,
  ) async {
    final movie = event.movie;
    final currentFavourites = Map<int, Movie>.from(state);

    if (currentFavourites.containsKey(movie.id)) {
      // Remove from favourites
      final result = await _favouriteMoviesRepository.unfavouriteMovie(
        movie.id,
      );

      result.fold(
        (failure) {
          log('Failed to unfavourite movie: ${failure.message}');
          // Could emit a snackbar message here
        },
        (_) {
          currentFavourites.remove(movie.id);
          emit(currentFavourites);
        },
      );
    } else {
      // Add to favourites
      final result = await _favouriteMoviesRepository.favouriteMovie(movie);

      result.fold(
        (failure) {
          log('Failed to favourite movie: ${failure.message}');
          // Could emit a snackbar message here
        },
        (_) {
          currentFavourites[movie.id] = movie;
          emit(currentFavourites);
          // Could emit a success message here
        },
      );
    }
  }

  // Helper methods for UI
  bool isMovieFavourite(int movieId) => state.containsKey(movieId);

  List<Movie> get favouriteMoviesList => state.values.toList();

  int get favouriteMoviesCount => state.length;
}

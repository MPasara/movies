import 'package:movies/features/popular/domain/entities/movie.dart';

abstract interface class DatabaseService {
  Future<void> initDatabase();
  Future<void> favouriteMovie(Movie movie);
  Future<void> unfavouriteMovie(int movieId);
  Future<bool> isMovieFavourite(int movieId);
  Future<List<Movie>> getFavouriteMovies();
}

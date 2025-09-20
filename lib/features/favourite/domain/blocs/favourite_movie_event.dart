import 'package:equatable/equatable.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';

sealed class FavouriteMoviesEvent extends Equatable {
  const FavouriteMoviesEvent();

  @override
  List<Object?> get props => [];
}

final class LoadFavouriteMovies extends FavouriteMoviesEvent {
  const LoadFavouriteMovies();
}

final class ToggleFavouriteMovie extends FavouriteMoviesEvent {
  const ToggleFavouriteMovie(this.movie);

  final Movie movie;

  @override
  List<Object?> get props => [movie];
}

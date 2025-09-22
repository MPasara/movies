import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:movies/common/domain/failure.dart';
import 'package:movies/features/favourite/data/repositories/database_service.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';

abstract interface class FavouriteMoviesRepository {
  Future<Either<Failure, void>> favouriteMovie(Movie movie);
  Future<Either<Failure, void>> unfavouriteMovie(int movieId);
  Future<Either<Failure, List<Movie>>> loadFavouriteMovies();
}

class FavouriteMoviesRepositoryImpl implements FavouriteMoviesRepository {
  FavouriteMoviesRepositoryImpl(this._databaseService);

  final DatabaseService _databaseService;

  @override
  Future<Either<Failure, void>> favouriteMovie(Movie movie) async {
    try {
      await _databaseService.favouriteMovie(movie);
      return const Right(null);
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return Left(Failure(message: 'Favourite movie failed'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> loadFavouriteMovies() async {
    try {
      final movies = await _databaseService.getFavouriteMovies();
      return Right(movies);
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return Left(Failure(message: 'Load favourite movies failed'));
    }
  }

  @override
  Future<Either<Failure, void>> unfavouriteMovie(int movieId) async {
    try {
      await _databaseService.unfavouriteMovie(movieId);
      return const Right(null);
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return Left(Failure(message: 'Unfavourite movie failed'));
    }
  }
}

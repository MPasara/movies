import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:movies/common/data/api_client.dart';
import 'package:movies/common/domain/failure.dart';
import 'package:movies/common/utils/constants.dart';
import 'package:movies/features/popular/data/mappers/movie_entity_mapper.dart';
import 'package:movies/features/popular/domain/entities/movie_wrapper.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, MovieWrapper>> getPopularMovies(int page);
}

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._apiClient, this._movieEntityMapper);

  final ApiClient _apiClient;
  final MovieEntityMapper _movieEntityMapper;

  @override
  Future<Either<Failure, MovieWrapper>> getPopularMovies(int page) async {
    try {
      final response = await _apiClient.getPopularMovies(kApiLanguage, page);
      final movies = response.results
          .map(_movieEntityMapper.fromResponse)
          .toList();

      return Right(
        MovieWrapper(
          currentPage: response.page,
          totalPages: response.totalPages,
          movies: movies,
          isLoading: false,
        ),
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return Left(
        Failure(message: 'Get popular movies failed: ${e.toString()}'),
      );
    }
  }
}

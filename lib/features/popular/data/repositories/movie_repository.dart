import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:movies/common/data/api_client.dart';
import 'package:movies/common/domain/failure.dart';
import 'package:movies/common/utils/constants/constants.dart';
import 'package:movies/features/popular/data/mappers/movie_entity_mapper.dart';
import 'package:movies/features/popular/data/repositories/genre_repository.dart';
import 'package:movies/features/popular/domain/entities/movie_wrapper.dart';
import 'package:movies/generated/l10n.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, MovieWrapper>> fetchPopularMovies(int page);
  Future<Either<Failure, MovieWrapper>> searchForMovies(String query);
}

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(
    this._apiClient,
    this._movieEntityMapper,
    this._genreRepository,
  );

  final ApiClient _apiClient;
  final MovieEntityMapper _movieEntityMapper;
  final GenreRepository _genreRepository;
  Map<int, String>? _genresCache;

  @override
  Future<Either<Failure, MovieWrapper>> fetchPopularMovies(int page) async {
    try {
      if (_genresCache == null) {
        final genreResult = await _fetchAndCacheGenres();
        if (genreResult.isLeft) {
          return Left(genreResult.left);
        }
      }

      final response = await _apiClient.fetchPopularMovies(kApiLanguage, page);

      final movies = response.results
          .map(
            (movieResponse) => _movieEntityMapper.fromResponseWithGenres(
              movieResponse,
              _genresCache!,
            ),
          )
          .toList();

      return Right(
        MovieWrapper(
          currentPage: response.page,
          totalPages: response.totalPages,
          movies: movies,
          // isLoading: false,
        ),
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return Left(Failure(message: S.current.failed_to_fetch_popular_movies));
    }
  }

  Future<Either<Failure, void>> _fetchAndCacheGenres() async {
    final genreResult = await _genreRepository.fetchAllGenres();

    return genreResult.fold((failure) => Left(failure), (genreWrapper) {
      _genresCache = {
        for (var genre in genreWrapper.genres) genre.id: genre.name,
      };
      return const Right(null);
    });
  }

  @override
  Future<Either<Failure, MovieWrapper>> searchForMovies(String query) async {
    try {
      final response = await _apiClient.searchMovies(query);

      if (_genresCache == null) {
        final genreResult = await _fetchAndCacheGenres();
        if (genreResult.isLeft) {
          return genreResult.fold(
            (failure) => Left(failure),
            (_) => throw Exception(),
          );
        }
      }

      final searchResult = response.results
          .map(
            (movieResponse) => _movieEntityMapper.fromResponseWithGenres(
              movieResponse,
              _genresCache!,
            ),
          )
          .toList();
      return Right(
        MovieWrapper(
          currentPage: response.page,
          totalPages: response.totalPages,
          isLoading: false,
          movies: searchResult,
        ),
      );
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return Left(Failure(message: S.current.search_failed));
    }
  }
}

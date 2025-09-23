import 'dart:ui';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/common/utils/locale_constants.dart';
import 'package:movies/features/popular/data/mappers/movie_entity_mapper.dart';
import 'package:movies/features/popular/data/models/movie_response.dart';
import 'package:movies/features/popular/data/repositories/movie_repository.dart';
import 'package:movies/generated/l10n.dart';

import '../../../../test_variables.dart';

void main() {
  late MovieRepositoryImpl repository;
  late MockApiClient mockApiClient;
  late MockGenreRepository mockGenreRepository;
  late MovieEntityMapper movieEntityMapper;

  setUp(() async {
    await S.load(Locale.fromSubtags(languageCode: LocaleConstants.eng));
    mockApiClient = MockApiClient();
    mockGenreRepository = MockGenreRepository();
    movieEntityMapper = MovieEntityMapper();
    repository = MovieRepositoryImpl(
      mockApiClient,
      movieEntityMapper,
      mockGenreRepository,
    );
  });

  group('fetchPopularMovies', () {
    test('should return Right when fetchPopularMovies is successful', () async {
      when(
        () => mockGenreRepository.fetchAllGenres(),
      ).thenAnswer((_) async => Right(kTestGenreWrapper));

      when(() => mockApiClient.fetchPopularMovies(any(), any())).thenAnswer(
        (_) async => MovieResponseWrapper(
          page: 1,
          results: [kTestMovieResponse],
          totalResults: 1,
          totalPages: 1,
        ),
      );

      final either = await repository.fetchPopularMovies(1);

      expect(either.right, kTestMovieWrapper);
    });

    test('should return Left when fetchPopularMovies fails', () async {
      when(
        () => mockGenreRepository.fetchAllGenres(),
      ).thenAnswer((_) async => Right(kTestGenreWrapper));

      when(
        () => mockApiClient.fetchPopularMovies(any(), any()),
      ).thenThrow(Exception('API error'));

      final either = await repository.fetchPopularMovies(1);

      expect(either.left.message, S.current.failed_to_fetch_popular_movies);
    });
  });

  group('searchForMovies', () {
    test('should return Right when searchForMovies is successful', () async {
      when(
        () => mockGenreRepository.fetchAllGenres(),
      ).thenAnswer((_) async => Right(kTestGenreWrapper));

      when(() => mockApiClient.searchMovies(any())).thenAnswer(
        (_) async => MovieResponseWrapper(
          page: 1,
          results: [kTestMovieResponse],
          totalResults: 1,
          totalPages: 1,
        ),
      );

      final either = await repository.searchForMovies('query');

      expect(either.right, kTestMovieWrapper);
    });

    test('should return Left when searchForMovies fails', () async {
      when(
        () => mockGenreRepository.fetchAllGenres(),
      ).thenAnswer((_) async => Right(kTestGenreWrapper));

      when(
        () => mockApiClient.searchMovies(any()),
      ).thenThrow(Exception('API error'));

      final either = await repository.searchForMovies('query');

      expect(either.left.message, S.current.search_failed);
    });
  });
}

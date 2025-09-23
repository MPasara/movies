import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/common/utils/locale_constants.dart';
import 'package:movies/features/favourite/data/repositories/favourite_movies_repository.dart';
import 'package:movies/generated/l10n.dart';

import '../../../../test_variables.dart';

void main() {
  late FavouriteMoviesRepositoryImpl repository;
  late MockDatabaseService mockDatabaseService;

  setUp(() async {
    await S.load(Locale.fromSubtags(languageCode: LocaleConstants.eng));
    mockDatabaseService = MockDatabaseService();
    repository = FavouriteMoviesRepositoryImpl(mockDatabaseService);
  });

  group('favouriteMovie', () {
    test('should return Right when favouriteMovie is successful', () async {
      when(
        () => mockDatabaseService.favouriteMovie(kTestMovie),
      ).thenAnswer((_) async {});

      final either = await repository.favouriteMovie(kTestMovie);
      expect(either.isRight, true);
    });

    test('should return Left when favouriteMovie fails', () async {
      when(
        () => mockDatabaseService.favouriteMovie(kTestMovie),
      ).thenThrow(kTestException);

      final either = await repository.favouriteMovie(kTestMovie);

      expect(either.left.message, S.current.favourite_movie_failed);
    });
  });

  group('unfavouriteMovie', () {
    test('should return Right when unfavouriteMovie is successful', () async {
      when(
        () => mockDatabaseService.unfavouriteMovie(1),
      ).thenAnswer((_) async {});

      final either = await repository.unfavouriteMovie(1);
      expect(either.isRight, true);
    });

    test('should return Left when unfavouriteMovie fails', () async {
      when(
        () => mockDatabaseService.unfavouriteMovie(1),
      ).thenThrow(kTestException);

      final either = await repository.unfavouriteMovie(1);

      expect(either.left.message, S.current.unfavourite_movie_failed);
    });
  });

  group('loadFavouriteMovies', () {
    test(
      'should return Right when loadFavouriteMovies is successful',
      () async {
        when(
          () => mockDatabaseService.getFavouriteMovies(),
        ).thenAnswer((_) async => [kTestMovie]);

        final either = await repository.loadFavouriteMovies();
        expect(either.right, [kTestMovie]);
      },
    );

    test('should return Left when loadFavouriteMovies fails', () async {
      when(
        () => mockDatabaseService.getFavouriteMovies(),
      ).thenThrow(kTestException);

      final either = await repository.loadFavouriteMovies();
      expect(either.left.message, S.current.load_favourite_movies_failed);
    });
  });
}

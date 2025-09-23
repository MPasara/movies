import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/common/utils/locale_constants.dart';
import 'package:movies/features/popular/data/repositories/genre_repository.dart';
import 'package:movies/generated/l10n.dart';

import '../../../../test_variables.dart';

void main() {
  late GenreRepository repository;
  late MockApiClient mockApiClient;

  setUp(() async {
    await S.load(Locale.fromSubtags(languageCode: LocaleConstants.eng));
    mockApiClient = MockApiClient();
    repository = GenreRepositoryImpl(mockApiClient);
  });

  group('fetchAllGenres', () {
    test('should return Right when fetchAllGenres is successful', () async {
      when(
        () => mockApiClient.fetchAllGenres(),
      ).thenAnswer((_) async => kTestGenreWrapper);
      final either = await repository.fetchAllGenres();
      expect(either.right, kTestGenreResponse);
    });

    test('should return Left when fetchAllGenres is not successful', () async {
      when(() => mockApiClient.fetchAllGenres()).thenThrow((_) async {
        return kTestException;
      });
      final either = await repository.fetchAllGenres();
      expect(either.left.message, S.current.failed_to_fetch_genres);
    });
  });
}

import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/common/data/repositories/locale_repository.dart';
import 'package:movies/common/utils/locale_constants.dart';
import 'package:movies/generated/l10n.dart';

import '../../../test_variables.dart';

void main() {
  late LocaleRepositoryImpl repository;
  late MockLocalStorageService mockLocalStorageService;

  setUp(() async {
    await S.load(Locale.fromSubtags(languageCode: LocaleConstants.eng));
    mockLocalStorageService = MockLocalStorageService();
    repository = LocaleRepositoryImpl(mockLocalStorageService);
  });

  group('fetchLanguage', () {
    test('should return Right when fetchLanguage is successful', () async {
      when(
        () => mockLocalStorageService.getLanguageCode(),
      ).thenAnswer((_) async => kTestLanguageCode);

      final either = await repository.fetchLanguage();
      expect(either.right, kTestLanguageCode);
    });

    test('should return Left when fetchLanguage fails', () async {
      when(
        () => mockLocalStorageService.getLanguageCode(),
      ).thenThrow(kTestException);

      final either = await repository.fetchLanguage();
      expect(either.left.message, S.current.fetch_language_failed);
    });
  });

  group('setLanguage', () {
    test('should return Right when setLanguage is successful', () async {
      when(
        () => mockLocalStorageService.setLanguageCode(kTestLanguageCode),
      ).thenAnswer((_) async {});

      final either = await repository.setLanguage(kTestLanguageCode);
      expect(either.isRight, true);
    });

    test('should return Left when setLanguage fails', () async {
      when(
        () => mockLocalStorageService.setLanguageCode(kTestLanguageCode),
      ).thenThrow(kTestException);

      final either = await repository.setLanguage(kTestLanguageCode);

      expect(either.left.message, S.current.set_language_failed);
    });
  });
}

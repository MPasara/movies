import 'package:either_dart/either.dart';
import 'package:movies/common/data/local_storage_service.dart';
import 'package:movies/common/domain/failure.dart';

abstract interface class LocaleRepository {
  Future<Either<Failure, void>> setLanguage(String languageCode);
  Future<Either<Failure, String?>> fetchLanguage();
}

class LocaleRepositoryImpl implements LocaleRepository {
  LocaleRepositoryImpl(this._localStorageService);

  final LocalStorageService _localStorageService;

  @override
  Future<Either<Failure, String?>> fetchLanguage() async {
    try {
      final languageCode = await _localStorageService.getLanguageCode();
      return Right(languageCode);
    } catch (e) {
      return Left(Failure(message: 'Fetch languages failed'));
    }
  }

  @override
  Future<Either<Failure, void>> setLanguage(String languageCode) async {
    try {
      final code = await _localStorageService.setLanguageCode(languageCode);
      return Right(code);
    } catch (e) {
      return Left(Failure(message: 'Set languages failed'));
    }
  }
}

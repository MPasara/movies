import 'package:either_dart/either.dart';
import 'package:movies/common/data/api_client.dart';
import 'package:movies/common/domain/failure.dart';
import 'package:movies/features/popular/data/models/genre_response.dart';
import 'package:movies/generated/l10n.dart';

abstract class GenreRepository {
  Future<Either<Failure, GenreResponseWrapper>> fetchAllGenres();
}

class GenreRepositoryImpl implements GenreRepository {
  GenreRepositoryImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<Either<Failure, GenreResponseWrapper>> fetchAllGenres() async {
    try {
      final response = await _apiClient.fetchAllGenres();
      return Right(response);
    } catch (e) {
      return Left(Failure(message: S.current.failed_to_fetch_genres));
    }
  }
}

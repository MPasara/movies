import 'package:movies/common/utils/constants/sembast_constants.dart';
import 'package:movies/features/favourite/data/repositories/database_service.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseServiceImpl implements DatabaseService {
  final _storeRef = intMapStoreFactory.store(
    SembastConstants.favouriteMoviesStore,
  );
  late final Database _database;

  @override
  Future<void> favouriteMovie(Movie movie) async {
    final db = _database;

    final movieData = {
      'id': movie.id,
      'title': movie.title,
      'description': movie.description,
      'posterImagePath': movie.posterImagePath,
      'backdropImagePath': movie.backdropImagePath,
      'voteAverage': movie.voteAverage,
      'genres': movie.genres,
      'releaseDate': movie.releaseDate.toString(),
    };

    await _storeRef.record(movie.id).put(db, movieData);
  }

  @override
  Future<List<Movie>> getFavouriteMovies() async {
    final favouriteMovies = <Movie>[];
    final records = await _storeRef.find(_database);

    for (final record in records) {
      final movieJson = record.value as Map<String, dynamic>;

      final id = movieJson['id'] as int?;
      final title = movieJson['title'] as String?;
      final description = movieJson['description'] as String?;
      final posterPath = movieJson['posterImagePath'] as String?;

      if (id != null && title != null) {
        favouriteMovies.add(
          Movie(
            id: id,
            title: title,
            description: description ?? '',
            posterImagePath: posterPath ?? '',
            backdropImagePath: movieJson['backdropImagePath'] as String?,
            voteAverage: (movieJson['voteAverage'] as num?)?.toDouble() ?? 0.0,
            genres: List<String>.from(movieJson['genres'] as List? ?? []),
            releaseDate: movieJson['releaseDate'] as DateTime?,
          ),
        );
      }
    }

    return favouriteMovies;
  }

  @override
  Future<void> initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, SembastConstants.dbName);
    _database = await databaseFactoryIo.openDatabase(dbPath);
  }

  @override
  Future<bool> isMovieFavourite(int movieId) async {
    final record = await _storeRef.record(movieId).get(_database);
    return record != null;
  }

  @override
  Future<void> unfavouriteMovie(int movieId) async =>
      _storeRef.record(movieId).delete(_database);
}

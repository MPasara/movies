import 'package:mocktail/mocktail.dart';
import 'package:movies/common/data/api_client.dart';
import 'package:movies/common/data/services/local_storage_service.dart';
import 'package:movies/features/favourite/data/repositories/database_service.dart';
import 'package:movies/features/popular/data/models/genre_response.dart';
import 'package:movies/features/popular/data/models/movie_response.dart';
import 'package:movies/features/popular/data/repositories/genre_repository.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';
import 'package:movies/features/popular/domain/entities/movie_wrapper.dart';

class MockApiClient extends Mock implements ApiClient {}

class MockGenreRepository extends Mock implements GenreRepository {}

class MockLocalStorageService extends Mock implements LocalStorageService {}

class MockDatabaseService extends Mock implements DatabaseService {}

final kTestGenreResponse = GenreResponseWrapper(
  genres: [GenreResponse(id: 1, name: 'testGenre')],
);

final kTestException = Exception('testException');

final kTestGenreWrapper = GenreResponseWrapper(
  genres: [GenreResponse(id: 1, name: 'testGenre')],
);

final kTestMovieResponse = MovieResponse(
  id: 1,
  title: 'Test Movie',
  overview: 'Overview',
  posterPath: '/poster.jpg',
  backdropPath: '/backdrop.jpg',
  voteAverage: 8.0,
  genreIds: [1],
);

final kTestMovie = Movie(
  id: 1,
  title: 'Test Movie',
  description: 'Overview',
  posterImagePath: '/poster.jpg',
  backdropImagePath: '/backdrop.jpg',
  voteAverage: 8.0,
  genres: ['testGenre'],
);

final kTestMovieWrapper = MovieWrapper(
  currentPage: 1,
  totalPages: 1,
  isLoading: false,
  movies: [kTestMovie],
);

final kTestLanguageCode = 'en';

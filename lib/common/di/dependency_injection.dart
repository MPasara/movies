import 'package:get_it/get_it.dart';
import 'package:movies/common/data/api_client.dart';
import 'package:movies/common/data/dio_client.dart';
import 'package:movies/features/popular/data/mappers/movie_entity_mapper.dart';
import 'package:movies/features/popular/data/repositories/genre_repository.dart';
import 'package:movies/features/popular/data/repositories/movie_repository.dart';
import 'package:movies/features/popular/domain/blocs/movie_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  _registerNetworking();

  _registerRepositories();

  _registerBlocs();
}

void resetDependencies() {
  getIt.reset();
}

void _registerNetworking() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(DioClient.create()));
}

void _registerRepositories() {
  getIt.registerLazySingleton<GenreRepository>(
    () => GenreRepositoryImpl(getIt<ApiClient>()),
  );

  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      getIt<ApiClient>(),
      MovieEntityMapper(),
      getIt<GenreRepository>(),
    ),
  );
}

void _registerBlocs() {
  getIt.registerFactory<MovieBloc>(() => MovieBloc(getIt<MovieRepository>()));
}

import 'package:get_it/get_it.dart';
import 'package:movies/common/data/api_client.dart';
import 'package:movies/common/data/dio_client.dart';
import 'package:movies/common/data/local_storage_service.dart';
import 'package:movies/common/data/repositories/locale_repository.dart';
import 'package:movies/common/domain/cubits/locale_cubit.dart';
import 'package:movies/features/favourite/data/repositories/database_service.dart';
import 'package:movies/features/favourite/data/repositories/database_service_impl.dart';
import 'package:movies/features/favourite/data/repositories/favourite_movies_repository.dart';
import 'package:movies/features/favourite/domain/blocs/favourite_movies_bloc.dart';
import 'package:movies/features/popular/data/mappers/movie_entity_mapper.dart';
import 'package:movies/features/popular/data/repositories/genre_repository.dart';
import 'package:movies/features/popular/data/repositories/movie_repository.dart';
import 'package:movies/features/popular/domain/blocs/movie_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  _registerNetworking();
  _registerDatabase();
  _registerServices();
  _registerRepositories();
  _registerBlocs();
}

void resetDependencies() {
  getIt.reset();
}

void _registerNetworking() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(DioClient.create()));
}

void _registerDatabase() {
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseServiceImpl());
}

void _registerServices() {
  getIt.registerLazySingleton<LocalStorageService>(
    () => LocalStorageServiceImpl(),
  );
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

  getIt.registerLazySingleton<FavouriteMoviesRepository>(
    () => FavouriteMoviesRepositoryImpl(getIt<DatabaseService>()),
  );

  getIt.registerLazySingleton<LocaleRepository>(
    () => LocaleRepositoryImpl(getIt<LocalStorageService>()),
  );
}

void _registerBlocs() {
  getIt.registerFactory<MovieBloc>(() => MovieBloc(getIt<MovieRepository>()));

  getIt.registerFactory<FavouriteMoviesBloc>(
    () => FavouriteMoviesBloc(getIt<FavouriteMoviesRepository>()),
  );

  // ADD THIS REGISTRATION:
  getIt.registerFactory<LocaleCubit>(
    () => LocaleCubit(getIt<LocaleRepository>()),
  );
}

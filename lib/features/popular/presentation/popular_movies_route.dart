import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/data/api_client.dart';
import 'package:movies/common/data/dio_client.dart';
import 'package:movies/features/popular/data/mappers/movie_entity_mapper.dart';
import 'package:movies/features/popular/data/repositories/movie_repository.dart';
import 'package:movies/features/popular/domain/blocs/movie_bloc.dart';
import 'package:movies/features/popular/presentation/popular_movies_page.dart';

class PopularMoviesRoute extends StatelessWidget {
  const PopularMoviesRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(
        // For now, creating dependencies here
        // In production, use proper DI like GetIt
        MovieRepositoryImpl(
          ApiClient(DioClient.create()), // Use configured Dio
          MovieEntityMapper(genresMap: {}),
        ),
      ),
      child: const PopularMoviesPage(),
    );
  }
}

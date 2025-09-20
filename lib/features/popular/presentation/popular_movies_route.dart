import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/di/dependency_injection.dart';
import 'package:movies/features/popular/domain/blocs/movie_bloc.dart';
import 'package:movies/features/popular/presentation/popular_movies_page.dart';

class PopularMoviesRoute extends StatelessWidget {
  const PopularMoviesRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieBloc>(),
      child: const PopularMoviesPage(),
    );
  }
}

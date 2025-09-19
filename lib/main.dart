import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';
import 'package:movies/features/popular/presentation/movie_details_page.dart';
import 'package:movies/main_page.dart';
import 'package:movies/movie_observer.dart';

void main() {
  Bloc.observer = MovieObserver();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainPage(),
      routes: {
        MovieDetailsPage.routeName: (context) => MovieDetailsPage(
          movie: ModalRoute.of(context)!.settings.arguments as Movie,
        ),
      },
    );
  }
}

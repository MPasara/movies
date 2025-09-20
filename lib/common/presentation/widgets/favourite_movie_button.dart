import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/favourite/domain/blocs/favourite_movie_event.dart';
import 'package:movies/features/favourite/domain/blocs/favourite_movies_bloc.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';

class FavouriteMovieButton extends StatelessWidget {
  const FavouriteMovieButton({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteMoviesBloc, Map<int, Movie>>(
      builder: (context, favouriteMovies) {
        final isFavourite = favouriteMovies.containsKey(movie.id);

        return IconButton(
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_outline,
            color: isFavourite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            HapticFeedback.mediumImpact();
            context.read<FavouriteMoviesBloc>().add(
              ToggleFavouriteMovie(movie),
            );
          },
        );
      },
    );
  }
}

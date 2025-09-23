import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/presentation/widgets/app_drawer.dart';
import 'package:movies/features/favourite/domain/blocs/favourite_movie_event.dart';
import 'package:movies/features/favourite/domain/blocs/favourite_movies_bloc.dart';
import 'package:movies/features/favourite/presentation/widgets/empty_list.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';
import 'package:movies/features/popular/presentation/widgets/movie_list_tile.dart';
import 'package:movies/generated/l10n.dart';

class FavouriteMoviesPage extends StatelessWidget {
  const FavouriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(S.of(context).favourites_header),
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<FavouriteMoviesBloc, Map<int, Movie>>(
        builder: (context, favouriteMovies) {
          if (favouriteMovies.isEmpty) {
            return const EmptyList();
          }

          final movies = favouriteMovies.values.toList();

          return RefreshIndicator(
            onRefresh: () async {
              context.read<FavouriteMoviesBloc>().add(
                const LoadFavouriteMovies(),
              );
            },
            child: RawScrollbar(
              interactive: true,
              radius: const Radius.circular(10),
              thumbColor: Colors.black.withValues(alpha: 0.65),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieListTile(movie: movie);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

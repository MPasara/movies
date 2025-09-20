import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/favourite/domain/blocs/favourite_movie_event.dart';
import 'package:movies/features/favourite/domain/blocs/favourite_movies_bloc.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';
import 'package:movies/features/popular/presentation/widgets/movie_list_tile.dart';

class FavouriteMoviesPage extends StatelessWidget {
  const FavouriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Movies'),
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<FavouriteMoviesBloc>().add(
                const LoadFavouriteMovies(),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FavouriteMoviesBloc, Map<int, Movie>>(
        builder: (context, favouriteMovies) {
          if (favouriteMovies.isEmpty) {
            return const _EmptyState();
          }

          final movies = favouriteMovies.values.toList();

          return RefreshIndicator(
            onRefresh: () async {
              context.read<FavouriteMoviesBloc>().add(
                const LoadFavouriteMovies(),
              );
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieListTile(movie: movie);
              },
            ),
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.heart_broken,
            size: 80,
            color: Colors.pink.withValues(alpha: 0.5),
          ),
          SizedBox(height: 16),
          Text(
            'No Favourite Movies',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Start adding movies to your favourites',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

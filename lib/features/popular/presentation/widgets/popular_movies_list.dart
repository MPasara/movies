import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/popular/domain/blocs/movie_bloc.dart';
import 'package:movies/features/popular/domain/blocs/movie_event.dart';
import 'package:movies/features/popular/domain/entities/movie_wrapper.dart';
import 'package:movies/features/popular/presentation/widgets/movie_list_tile.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({
    super.key,
    required this.movieWrapper,
    required this.scrollController,
  });

  final MovieWrapper movieWrapper;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<MovieBloc>().add(const RefreshMovies());
      },
      child: RawScrollbar(
        controller: scrollController,
        interactive: true,
        radius: const Radius.circular(10),
        thumbColor: Colors.black.withValues(alpha: 0.65),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (query) {},
              ),
              toolbarHeight: 56,
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index >= movieWrapper.movies.length) {
                    return movieWrapper.isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : const SizedBox.shrink();
                  }

                  final movie = movieWrapper.movies[index];
                  return MovieListTile(movie: movie);
                }, childCount: movieWrapper.movies.length + 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

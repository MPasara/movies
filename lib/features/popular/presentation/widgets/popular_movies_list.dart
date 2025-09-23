import 'package:flutter/material.dart';
import 'package:movies/features/popular/domain/entities/movie_wrapper.dart';
import 'package:movies/features/popular/presentation/widgets/movie_list_tile.dart';
import 'package:movies/generated/l10n.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({
    super.key,
    required this.movieWrapper,
    required this.scrollController,
    required this.searchController,
    required this.onSearchChanged,
    required this.isSearching,
    required this.onRefresh,
  });

  final MovieWrapper movieWrapper;
  final ScrollController scrollController;
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final bool isSearching;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
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
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: S.of(context).search_movies,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                            onSearchChanged('');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: onSearchChanged,
              ),
              toolbarHeight: 56,
            ),

            if (isSearching) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    movieWrapper.movies.isEmpty
                        ? S.of(context).no_movies_found(searchController.text)
                        : S
                              .of(context)
                              .search_result(movieWrapper.movies.length),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                ),
              ),
            ],

            movieWrapper.movies.isEmpty && !movieWrapper.isLoading
                ? SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isSearching ? Icons.search_off : Icons.movie,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            isSearching
                                ? S.of(context).no_movies_found_body
                                : S.of(context).no_movies_available,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (index >= movieWrapper.movies.length) {
                          return movieWrapper.isLoading
                              ? const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
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

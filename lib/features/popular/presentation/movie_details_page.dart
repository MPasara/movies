import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/common/presentation/widgets/favourite_movie_button.dart';
import 'package:movies/common/utils/constants.dart';
import 'package:movies/config/env.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';
import 'package:movies/features/popular/presentation/widgets/genre_chip.dart';

class MovieDetailsPage extends StatelessWidget {
  static const routeName = '/movie-details';
  const MovieDetailsPage({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 334,
            child: CachedNetworkImage(
              imageUrl:
                  '${Env.tmdbImageBaseUrl}/$kImageSize300${(movie.backdropImagePath?.isNotEmpty == true) ? movie.backdropImagePath! : movie.posterImagePath}',
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 400),
              placeholder: (context, url) => const SizedBox.shrink(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.movie, size: 40),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
                splashRadius: 24,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.345,
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.66,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 5,
                          child: Text(
                            movie.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: FavouriteMovieButton(movie: movie),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 12),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          Text(
                            '${movie.voteAverage.toStringAsFixed(1)}/10 IMDb',
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 5,
                      runSpacing: 4,
                      children: [
                        for (final genre in movie.genres)
                          GenreChip(name: genre),
                      ],
                    ),
                    const SizedBox(height: 40),
                    movie.description != ''
                        ? const Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        : const SizedBox(),
                    Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(movie.description),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

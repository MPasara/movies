import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/config/env.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';

class MovieDetailsPage extends StatelessWidget {
  static const routeName = '/movie-details';
  const MovieDetailsPage({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title!)),
      body: Column(
        children: [
          Text(movie.title!),
          Text(movie.voteAverage!.toStringAsFixed(1)),
          CachedNetworkImage(
            imageUrl:
                '${Env.tmdbImageBaseUrl}original${movie.backdropImagePath}',
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 500),
            placeholder: (context, url) => const SizedBox.shrink(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.movie, size: 40),
          ),
          Text(movie.description!),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: movie.genres!.length,
              itemBuilder: (context, index) {
                return Text(movie.genres![index]);
              },
            ),
          ),
          //if(movie.genres != null)
        ],
      ),
    );
  }
}

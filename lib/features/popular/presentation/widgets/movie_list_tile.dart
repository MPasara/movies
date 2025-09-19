import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';
import 'package:movies/features/popular/presentation/movie_details_page.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({super.key, required this.movie});

  final Movie movie; // Replace with your Movie entity type

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            MovieDetailsPage.routeName,
            arguments: movie,
          );
        },
        leading: SizedBox(
          width: 60,
          //height: 70,
          child: movie.posterImagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/original${movie.posterImagePath}',
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 500),
                    placeholder: (context, url) => const SizedBox.shrink(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.movie, size: 40),
                  ),
                )
              : const Icon(Icons.movie, size: 40),
        ),
        title: Text(
          movie.title ?? 'Unknown Title',
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.voteAverage != null) ...[
              Text(movie.voteAverage!.toStringAsFixed(1)),
            ],
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.bookmark_outline),
          onPressed: () {},
        ),
      ),
    );
  }
}

import 'package:movies/features/popular/data/models/movie_response.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';

class MovieEntityMapper {
  MovieEntityMapper();

  Movie fromResponseWithGenres(
    MovieResponse response,
    Map<int, String> genresMap,
  ) {
    List<String> genreNames = [];

    // Only try to map genres if we have both genre IDs and a non-empty genre map
    if (response.genreIds?.isNotEmpty == true && genresMap.isNotEmpty) {
      genreNames = response.genreIds!
          .map((id) => genresMap[id])
          .where((name) => name != null) // Filter out nulls
          .cast<String>()
          .toList();
    }

    return Movie(
      id: response.id ?? 0,
      title: response.title ?? '',
      description: response.overview ?? '',
      posterImagePath: response.posterPath ?? '',
      backdropImagePath: response.backdropPath,
      voteAverage: response.voteAverage ?? 0,
      genres: genreNames, // Will be empty list if genres unavailable
    );
  }
}

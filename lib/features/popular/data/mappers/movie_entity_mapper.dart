import 'package:movies/features/popular/data/models/movie_response.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';

class MovieEntityMapper {
  MovieEntityMapper({required this.genresMap});

  final Map<int, String> genresMap;

  Movie fromResponse(MovieResponse response) {
    return Movie(
      id: response.id,
      title: response.title,
      description: response.overview,
      posterImagePath: response.posterPath,
      backdropImagePath: response.backdropPath,
      voteAverage: response.voteAverage,
      genres: response.genreIds!
          .map((id) => genresMap[id] ?? 'Unknown')
          .toList(),
    );
  }
}

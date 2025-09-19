import 'package:movies/features/popular/data/models/movie_response.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';

class MovieEntityMapper {
  MovieEntityMapper();

  Movie fromResponseWithGenres(
    MovieResponse response,
    Map<int, String> genresMap,
  ) {
    final genreNames =
        response.genreIds
            ?.map((id) => genresMap[id] ?? 'Unknown')
            .where((name) => name != 'Unknown')
            .toList() ??
        [];

    return Movie(
      id: response.id,
      title: response.title,
      description: response.overview,
      posterImagePath: response.posterPath,
      backdropImagePath: response.backdropPath,
      voteAverage: response.voteAverage,
      genres: genreNames,
    );
  }
}

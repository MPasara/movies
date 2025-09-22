import 'package:movies/features/popular/data/models/movie_response.dart';
import 'package:movies/features/popular/domain/entities/movie.dart';

class MovieEntityMapper {
  MovieEntityMapper();

  Movie fromResponseWithGenres(
    MovieResponse response,
    Map<int, String> genresMap,
  ) {
    List<String> genreNames = [];

    if (response.genreIds?.isNotEmpty == true && genresMap.isNotEmpty) {
      genreNames = response.genreIds!
          .map((id) => genresMap[id])
          .where((name) => name != null)
          .cast<String>()
          .toList();
    }

    return Movie(
      id: response.id,
      title: response.title,
      description: response.overview ?? '',
      posterImagePath: response.posterPath ?? '',
      backdropImagePath: response.backdropPath,
      voteAverage: response.voteAverage ?? 0,
      genres: genreNames,
    );
  }

  MovieResponse toResponse(Movie movie, Map<String, int> reverseGenresMap) {
    List<int> genreIds = [];

    if (movie.genres.isNotEmpty && reverseGenresMap.isNotEmpty) {
      genreIds = movie.genres
          .map((genreName) => reverseGenresMap[genreName])
          .where((id) => id != null)
          .cast<int>()
          .toList();
    }

    return MovieResponse(
      id: movie.id,
      title: movie.title,
      overview: movie.description,
      posterPath: movie.posterImagePath,
      backdropPath: movie.backdropImagePath,
      voteAverage: movie.voteAverage,
      genreIds: genreIds,
    );
  }
}

import 'package:dio/dio.dart';
import 'package:movies/features/popular/data/models/genre_response.dart';
import 'package:movies/features/popular/data/models/movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/movie/popular')
  Future<MovieResponseWrapper> fetchPopularMovies(
    @Query('language') String language,
    @Query('page') int page,
  );

  @GET('/genre/movie/list')
  Future<GenreResponseWrapper> fetchAllGenres();
}

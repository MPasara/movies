import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'TMDB_API_KEY', obfuscate: true)
  static final String tmdbApiKey = _Env.tmdbApiKey;

  @EnviedField(varName: 'TMDB_BASE_URL')
  static const String tmdbBaseUrl = _Env.tmdbBaseUrl;

  @EnviedField(varName: 'TMDB_IMAGE_BASE_URL')
  static const String tmdbImageBaseUrl = _Env.tmdbImageBaseUrl;
}

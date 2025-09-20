import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:loggy/loggy.dart';
import 'package:movies/config/env.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Env.tmdbBaseUrl,
        queryParameters: {'api_key': Env.tmdbApiKey},
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        logPrint: (object) {
          assert(() {
            logDebug(object);
            return true;
          }());
        },
      ),
    );
    return dio;
  }
}

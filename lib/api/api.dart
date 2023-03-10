import 'package:dio/dio.dart';

class Api {
  static const url = "https://pokeapi.co/api/v2/";
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: url));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: url,
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);
}

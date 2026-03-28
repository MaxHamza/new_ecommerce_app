import 'package:dio/dio.dart';

class DioService {
  final Dio dio;

  DioService()
      : dio = Dio(
    BaseOptions(
      baseUrl: 'https://fakestoreapi.com/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );
}
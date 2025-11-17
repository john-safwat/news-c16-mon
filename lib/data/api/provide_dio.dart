import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio provideDio() {
  Dio dio = Dio();
  dio.options.headers = {"X-Api-Key": "2c58c6392813448996cbedf8b2cd9b2e"};
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 140,
    enabled: kDebugMode,
  ));
  return dio;
}

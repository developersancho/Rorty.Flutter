import 'package:dio/dio.dart';
import 'package:rorty_flutter/data/remote/dio/logging_interceptor.dart';

class DioFactory {
  final String _baseUrl;

  DioFactory(this._baseUrl);

  BaseOptions _createBaseOptions() => BaseOptions(
        baseUrl: _baseUrl,
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
      );

  Dio create() => Dio(_createBaseOptions())
    ..interceptors.addAll([
      LoggerInterceptor(),
    ]);
}

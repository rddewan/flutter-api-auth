import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provideDio = Provider<Dio>((ref) {
  var options = BaseOptions(
    baseUrl: 'https://freeapi.rdewan.dev/',
    connectTimeout: 1000 * 60,
    sendTimeout: 1000 * 60,
    receiveTimeout: 1000 * 60,
    headers: {'Accept': 'application/json'},
  );
  var _dio = Dio(options);
  _dio.interceptors.add(HttpFormatter());
  return _dio;
});

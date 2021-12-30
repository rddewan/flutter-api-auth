import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/data/remote/model/response/signup_response.dart';
import 'package:login_register/data/remote/provide_dio.dart';
import 'package:login_register/repository/signup/signup_repository.dart';
import 'package:login_register/util/failure.dart';

final provideSingupRepository = Provider<SignupRepository>((ref) {
  final _dio = ref.watch(provideDio);

  return SingupRepositoryImpl(_dio);
});

class SingupRepositoryImpl implements SignupRepository {
  final Dio _dio;

  SingupRepositoryImpl(this._dio);

  @override
  Future<SignupResponse> signup(Map data) async {
    try {
      final response = await _dio.post('api/register', data: data);
      final result = SignupResponse.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (e is SocketException) {
        throw Failure(message: e.message);
      }

      throw Failure(
          message: e.response?.statusMessage ?? 'Something went wrong',
          code: e.response?.statusCode,
          exception: e);
    }
  }
}

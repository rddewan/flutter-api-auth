import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/data/remote/model/request/login_request.dart';
import 'package:login_register/data/remote/model/response/login_response.dart';
import 'package:login_register/data/remote/provide_dio.dart';
import 'package:login_register/repository/login/login_repository.dart';
import 'package:login_register/util/failure.dart';

final provideLoginRepositoryImpl = Provider<LoginRepositoryImpl>((ref) {
  var _dio = ref.watch(provideDio);
  return LoginRepositoryImpl(_dio);
});

class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this._dio);
  final Dio _dio;

  @override
  Future<LoginResponse> login(Map data) async {
    try {
      var response = await _dio.post('api/login',data: data);
      var result = LoginResponse.fromJson(response.data);

      return result;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message);
      }
      if (e.response?.statusCode == 401) {
        throw Failure(message: e.response?.data.toString() ?? 'Please check your login detail');
      }

      throw Failure(
          message: e.response?.statusMessage ?? 'Something went wrong',
          code: e.response?.statusCode,
          exception: e);
    }
  }
}

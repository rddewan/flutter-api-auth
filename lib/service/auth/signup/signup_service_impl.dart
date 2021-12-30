import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/data/remote/model/response/signup_response.dart';
import 'package:login_register/repository/signup/signup_repository.dart';
import 'package:login_register/repository/signup/signup_repository_impl.dart';
import 'package:login_register/service/auth/signup/signup_service.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:login_register/util/failure.dart';

final provideSignupService = Provider<SignupService>((ref) {
  final _repository = ref.watch(provideSingupRepository);

  return SignupServiceImpl(_repository);
});

class SignupServiceImpl implements SignupService {
  final SignupRepository _repository;

  SignupServiceImpl(this._repository);

  @override
  Future<Result<Failure, SignupResponse>> signup(Map data) async {
    try {
      final result = await _repository.signup(data);

      return Success(result);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}

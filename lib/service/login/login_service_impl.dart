import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/data/remote/model/response/login_response.dart';
import 'package:login_register/repository/login/login_repository.dart';
import 'package:login_register/repository/login/login_repository_impl.dart';
import 'package:login_register/service/login/login_service.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:login_register/util/failure.dart';

final provideLoginService = Provider<LoginServiceImpl>((ref) {
  var _loginRepository = ref.watch(provideLoginRepositoryImpl);

  return LoginServiceImpl(_loginRepository);
});

class LoginServiceImpl extends LoginService {
  LoginServiceImpl(this._loginRepository);

  final LoginRepository _loginRepository;

  @override
  Future<Result<Failure, LoginResponse>> login(Map data) async {
    try {
      var result = await _loginRepository.login(data);
      return Success(result);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/data/local/model/auth/auth_model.dart';
import 'package:login_register/repository/auth/secure_storage_repository.dart';
import 'package:login_register/repository/auth/secure_storage_repository_impl.dart';
import 'package:login_register/repository/login/login_repository.dart';
import 'package:login_register/repository/login/login_repository_impl.dart';
import 'package:login_register/service/auth/login/login_service.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:login_register/util/failure.dart';

final provideLoginService = Provider<LoginService>((ref) {
  final _loginRepository = ref.watch(provideLoginRepositoryImpl);
  final _secureStorage = ref.watch(provideSecureStorageRepository);

  return LoginServiceImpl(_loginRepository, _secureStorage);
});

class LoginServiceImpl implements LoginService {
  LoginServiceImpl(this._loginRepository, this._secureStorageRepository);

  final LoginRepository _loginRepository;
  final SecureStorageRepository _secureStorageRepository;

  @override
  Future<Result<Failure, bool>> login(Map data) async {
    try {
      var response = await _loginRepository.login(data);
      final json = <String, dynamic>{};
      json['access_token'] = response.accessToken;
      json['token_id'] = response.tokenId;
      json['user_id'] = response.userId;
      json['name'] = response.name;
      json['email'] = response.email;

      final result = await save(AuthModel.fromJson(json));
      return Success(result);

    } on Failure catch (failure) {
      return Error(failure);
    }
  } 

  @override
  Future<Result<Failure, AuthModel?>> read() async {
    try {
      final _success = await _secureStorageRepository.read();
      return Success(_success);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }

  @override
  Future<bool> save(AuthModel authModel) async {
    final _success = await _secureStorageRepository.save(authModel);
    return _success;
  }
}

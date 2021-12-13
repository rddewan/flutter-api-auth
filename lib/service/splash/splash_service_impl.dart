import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/data/local/model/auth/auth_model.dart';
import 'package:login_register/repository/auth/secure_storage_repository.dart';
import 'package:login_register/repository/auth/secure_storage_repository_impl.dart';
import 'package:login_register/service/splash/splash_service.dart';
import 'package:login_register/util/failure.dart';
import 'package:multiple_result/multiple_result.dart';

final provideSplashService = Provider<SplashService>((ref) {
  final _secureStorageRepository = ref.watch(provideSecureStorageRepository);
  return SplashServiceImpl(_secureStorageRepository);
});

class SplashServiceImpl implements SplashService {
  final SecureStorageRepository _secureStorageRepository;

  SplashServiceImpl(this._secureStorageRepository);

  @override
  Future<Result<Failure, AuthModel?>> read() async {
    try {
      final result = await _secureStorageRepository.read();
      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }
}

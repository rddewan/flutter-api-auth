import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/repository/auth/secure_storage_repository.dart';
import 'package:login_register/repository/auth/secure_storage_repository_impl.dart';
import 'package:login_register/service/auth/logout/logout_service.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:login_register/util/failure.dart';

final provideLogoutService = Provider<LogoutService>((ref) {
  final _secureStorageRepository = ref.watch(provideSecureStorageRepository);
  return LogoutServiceImpl(_secureStorageRepository);
});

class LogoutServiceImpl implements LogoutService {
  final SecureStorageRepository _secureStorageRepository;

  LogoutServiceImpl(this._secureStorageRepository);

  @override
  Future<Result<Failure, bool>> logout() async {
    try {
      final _success = await _secureStorageRepository.clear();
      return Success(_success);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}

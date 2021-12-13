import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/data/local/model/auth/auth_model.dart';
import 'package:login_register/data/local/storage/shared_pref/secure_stoarge.dart';
import 'package:login_register/data/local/storage/shared_pref/secure_storage_impl.dart';
import 'package:login_register/repository/auth/secure_storage_repository.dart';

final provideSecureStorageRepository =
    Provider<SecureStorageRepositoryImpl>((ref) {
  final _secureStorage = ref.watch(provideSecureStoreage);
  return SecureStorageRepositoryImpl(_secureStorage);
});

class SecureStorageRepositoryImpl implements SecureStorageRepository {
  final SecureStorage _secureStorage;

  SecureStorageRepositoryImpl(this._secureStorage);

  @override
  Future<bool> clear() async {
    return await _secureStorage.clear();
  }

  @override
  Future<AuthModel?> read() async {
    return await _secureStorage.read();
  }

  @override
  Future<bool> save(AuthModel authModel) async {
    final result = await _secureStorage.save(authModel);
    return result;
  }
}

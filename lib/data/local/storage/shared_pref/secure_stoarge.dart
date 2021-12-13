import 'package:login_register/data/local/model/auth/auth_model.dart';

abstract class SecureStorage {
  Future<AuthModel?> read();
  Future<bool> save(AuthModel authModel);
  Future<bool> clear();
}

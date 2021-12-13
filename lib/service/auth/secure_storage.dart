import 'package:login_register/data/local/model/auth/auth_model.dart';
import 'package:login_register/util/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SecureStorageService {
  Future<Result<Failure, bool>> clear();
  Future<bool> save(AuthModel authModel);
  Future<Result<Failure, AuthModel?>> read();
}

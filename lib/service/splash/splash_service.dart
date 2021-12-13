import 'package:login_register/data/local/model/auth/auth_model.dart';
import 'package:login_register/util/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SplashService {
  Future<Result<Failure,AuthModel?>> read();
}

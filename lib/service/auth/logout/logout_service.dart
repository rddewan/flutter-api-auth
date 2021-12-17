import 'package:login_register/util/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class LogoutService {
  Future<Result< Failure, bool>> logout();
}

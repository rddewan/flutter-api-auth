
import 'package:login_register/util/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class LoginService {
  Future<Result<Failure,bool>> login(Map data);
}
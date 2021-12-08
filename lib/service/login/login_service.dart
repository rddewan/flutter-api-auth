
import 'package:login_register/data/remote/model/response/login_response.dart';
import 'package:login_register/util/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class LoginService {
  Future<Result<Failure,LoginResponse>> login(Map data);
}
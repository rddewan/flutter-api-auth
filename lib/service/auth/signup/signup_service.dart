import 'package:login_register/data/remote/model/response/signup_response.dart';
import 'package:login_register/util/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SignupService {
  Future<Result<Failure, SignupResponse>> signup(Map data);
}

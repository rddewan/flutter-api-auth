import 'package:login_register/data/remote/model/response/signup_response.dart';

abstract class SignupRepository {
  Future<SignupResponse> signup(Map data);
}

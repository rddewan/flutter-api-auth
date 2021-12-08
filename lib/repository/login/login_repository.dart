import 'package:login_register/data/remote/model/response/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(Map data);
  
}

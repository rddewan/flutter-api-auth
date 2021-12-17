import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/controller/auth/login/login_state.dart';
import 'package:login_register/service/auth/login/login_service.dart';
import 'package:login_register/service/auth/login/login_service_impl.dart';


final provideloginController =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  var _loginService = ref.watch(provideLoginService);

  return LoginController(
      const LoginState(doLogin: AsyncValue.loading()), _loginService
    );
});



class LoginController extends StateNotifier<LoginState> {
  LoginController(LoginState state, this._loginService) : super(state);

  final LoginService _loginService;

  Future<void> login(Map data) async {    
    state = state.copyWith(doLogin: const AsyncValue.loading());
    var result = await _loginService.login(data);
    result.when(
        (error) => state = state.copyWith(doLogin: AsyncValue.error(error)),
        (success) => state = state.copyWith(doLogin: AsyncValue.data(success)));
  }
}

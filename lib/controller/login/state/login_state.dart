import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/data/remote/model/response/login_response.dart';

@immutable
class LoginState {
  final AsyncValue<LoginResponse> doLogin;

  const LoginState({required this.doLogin});

  LoginState copyWith({AsyncValue<LoginResponse>? doLogin}) {
    return LoginState(doLogin: doLogin ?? this.doLogin);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is LoginState && other.doLogin == doLogin;
  }

  @override
  int get hashCode {
    return doLogin.hashCode;
  }
}

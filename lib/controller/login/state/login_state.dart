import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


@immutable
class LoginState {
  final AsyncValue<bool> doLogin;

  const LoginState({required this.doLogin});

  LoginState copyWith({AsyncValue<bool>? doLogin}) {
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

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/data/remote/model/response/signup_response.dart';

@immutable
class SignupState {
  final AsyncValue<SignupResponse> signup;

  const SignupState({required this.signup});

  SignupState copyWith({AsyncValue<SignupResponse>? signup}) {
    return SignupState(signup: signup ?? this.signup);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SignupState && other.signup == signup;
  }

  @override
  int get hashCode {
    return signup.hashCode;
  }
}

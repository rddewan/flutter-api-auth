import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/data/local/model/auth/auth_model.dart';

@immutable
class SplashState {
  final AsyncValue<AuthModel?> authModel;

  const SplashState({required this.authModel});

  SplashState copyWith({AsyncValue<AuthModel?>? authModel}) {
    return SplashState(authModel: authModel ?? this.authModel);
  }
}

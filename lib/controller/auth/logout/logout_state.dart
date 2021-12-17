import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class LogoutState {
  final AsyncValue<bool> logout;

  const LogoutState({required this.logout});

  LogoutState copyWith({AsyncValue<bool>? logout}) {
    return LogoutState(logout: logout ?? this.logout);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is LogoutState && other.logout == logout;
  }

  @override
  int get hashCode => logout.hashCode;
}

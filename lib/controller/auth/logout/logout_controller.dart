import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/controller/auth/logout/logout_state.dart';
import 'package:login_register/service/auth/logout/logout_service.dart';
import 'package:login_register/service/auth/logout/logout_service_impl.dart';

final provideLogoutController =
    StateNotifierProvider.autoDispose<LogoutController, LogoutState>((ref) {
  final _logoutService = ref.watch(provideLogoutService);
  return LogoutController(
      const LogoutState(logout: AsyncValue.loading()), _logoutService);
});

class LogoutController extends StateNotifier<LogoutState> {
  LogoutController(LogoutState state, this._logoutService) : super(state);
  final LogoutService _logoutService;

  Future<void> logout() async {
    state = state.copyWith(logout: const AsyncValue.loading());
    final result = await _logoutService.logout();
    result.when(
        (error) => state = state.copyWith(logout: AsyncValue.error(error)),
        (success) => state = state.copyWith(logout: AsyncValue.data(success)));
  }
}

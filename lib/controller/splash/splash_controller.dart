import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/controller/splash/state/splash_state.dart';
import 'package:login_register/service/splash/splash_service.dart';
import 'package:login_register/service/splash/splash_service_impl.dart';

final provideSplashController =
    StateNotifierProvider.autoDispose<SplashController, SplashState>((ref) {
  final _splashService = ref.watch(provideSplashService);
  final controller = SplashController(
      const SplashState(authModel: AsyncValue.loading()), _splashService);
  controller.read();
  return controller;
});

class SplashController extends StateNotifier<SplashState> {
  final SplashService _splashService;

  SplashController(SplashState state, this._splashService) : super(state);

  Future<void> read() async {
    state = state.copyWith(authModel: const AsyncValue.loading());
    final result = await _splashService.read();
    result.when(
        (error) => state = state.copyWith(authModel: AsyncValue.error(error)),
        (success) =>
            state = state.copyWith(authModel: AsyncValue.data(success)));
  }
}

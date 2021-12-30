import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/controller/auth/signup/signup_state.dart';
import 'package:login_register/service/auth/signup/signup_service.dart';
import 'package:login_register/service/auth/signup/signup_service_impl.dart';

final provideSignupController =
    StateNotifierProvider.autoDispose<SignupController, SignupState>((ref) {
      final _service = ref.watch(provideSignupService);
      
      return SignupController(const SignupState(signup: AsyncValue.loading()), _service);
});

class SignupController extends StateNotifier<SignupState> {
  SignupController(SignupState state, this._service) : super(state);

  final SignupService _service;

  Future<void> signup(Map data) async {
    state = state.copyWith(signup: const AsyncValue.loading());
    final result = await _service.signup(data);
    result.when(
        (error) => state = state.copyWith(signup: AsyncValue.error(error)),
        (success) => state = state.copyWith(signup: AsyncData(success)));
  }
}

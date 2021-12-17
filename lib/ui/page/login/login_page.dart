import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/controller/auth/login/login_controller.dart';
import 'package:login_register/controller/auth/login/login_state.dart';
import 'package:login_register/ui/page/home/home_page.dart';
import 'package:login_register/ui/widget/build_error_dialog.dart';
import 'package:login_register/ui/widget/build_loading_dialog.dart';
import 'package:login_register/ui/widget/build_scaffold.dart';
import 'package:login_register/ui/widget/build_form_filed.dart';
import 'package:login_register/ui/widget/outlined_button_green.dart';
import 'package:login_register/util/failure.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    listenLoginController(ref, context);
    return BuildScaffold('Login',
        LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      if (maxWidth <= 600) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mobile Device : ${constraints.maxWidth}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildEmailFormFiled(
                          'Email', 'Enter your email', _emailController),
                      const SizedBox(height: 16.0),
                      buildPasswordFormFiled('Password', 'Enter your password',
                          _passwordController),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButtonGreen(
                                icon: Icons.login_outlined,
                                text: 'Login',
                                onPressed: () async {
                                  var isValid =
                                      _formKey.currentState!.validate();
                                  if (isValid) {
                                    var data = {
                                      'email': _emailController.value.text,
                                      'password': _passwordController.value.text
                                    };
                                    ref
                                        .read(provideloginController.notifier)
                                        .login(data);
                                  }
                                }),
                          )
                        ],
                      )
                    ],
                  )),
            )
          ],
        );
      } else if (maxWidth > 600 && maxWidth <= 992) {
        //tablet
        return Column(
          children: [
            Text('Tablet Device : ${constraints.maxWidth}'),
          ],
        );
      } else {
        //Desktop
        return Column(
          children: [
            Text('Tablet Device : ${constraints.maxWidth}'),
          ],
        );
      }
    }), null);
  }

  void listenLoginController(WidgetRef ref, BuildContext context) {
    ref.listen<LoginState>(provideloginController, (previous, next) {
      next.doLogin.when(data: (data) {
        print('data: $data');
        hideLoadingMeterialDialog(context);
        //remove the top most route
        Navigator.pop(context);
        //navigate to home page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }, error: (e, s) {
        e as Failure;
        hideLoadingMeterialDialog(context);
        buildErrorDialog(context, 'ouch!', e.message);
      }, loading: () {
        buildLoadingMeterialDialog(context, 'connecting...',
            'Please wait we are trying to connect...');
      });
    });
  }
}

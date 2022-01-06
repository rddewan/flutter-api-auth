import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/controller/auth/login/login_controller.dart';
import 'package:login_register/controller/auth/login/login_state.dart';
import 'package:login_register/ui/page/home/home_page.dart';
import 'package:login_register/ui/page/signup/signup_page.dart';
import 'package:login_register/ui/widget/build_error_dialog.dart';
import 'package:login_register/ui/widget/build_loading_dialog.dart';
import 'package:login_register/ui/widget/build_scaffold.dart';
import 'package:login_register/ui/widget/email_form_filed.dart';
import 'package:login_register/ui/widget/outlined_button_green.dart';
import 'package:login_register/ui/widget/password_form_filed.dart';
import 'package:login_register/util/failure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({this.email, Key? key}) : super(key: key);
  final String? email;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    listenLoginController(ref, context);

    return BuildScaffold(AppLocalizations.of(context)!.login,
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
                      EmailTextFormFiled(
                          lable: 'Email', textController: _emailController),
                      const SizedBox(height: 16.0),
                      PasswordFormField(
                        lableText: 'Password',
                        textController: _passwordController,
                        focusNode: passwordFocusNode,
                      ),
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
            ),
            const SizedBox(
              height: 16.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.createAccountMsg,
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.orange)),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => SignupPage()))
                            .then((value) {
                          if (value != null || value != '') {
                            _emailController.text = value.toString();
                            showSuccessDialog(context);
                          }
                        });
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ],
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
        hideLoadingMeterialDialog(context);
        //remove the top most route
        Navigator.pop(context);
        //navigate to home page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }, error: (e, s) {
        e as Failure;
        hideLoadingMeterialDialog(context);
        return buildErrorDialog(context, title: 'Ouch!', msg: e.message);
      }, loading: () {
        buildLoadingMeterialDialog(context, 'connecting...',
            'Please wait we are trying to connect...');
      });
    });
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Great!'),
            content: Row(
              children: const [
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.yellow,
                  size: 32.0,
                  semanticLabel: 'emoji smily face',
                ),
                SizedBox(width: 8.0),
                Expanded(
                    child: Text('You have successfully created a new account.'))
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    hideLoadingMeterialDialog(context);
                    passwordFocusNode.requestFocus();
                  },
                  child: const Text('OK'))
            ],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
          );
        });
  }
}

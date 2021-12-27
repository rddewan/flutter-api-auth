import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/ui/widget/build_scaffold.dart';
import 'package:login_register/ui/widget/email_form_filed.dart';
import 'package:login_register/ui/widget/name_form_field.dart';
import 'package:login_register/ui/widget/orange_gradient_button.dart';
import 'package:login_register/ui/widget/password_form_filed.dart';

class SignupPage extends ConsumerWidget {
   SignupPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();   
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _conformPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {   
    return BuildScaffold(
      'Signup',
      Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NameTextFormFiled(
                        lable: 'Name',
                        textController: _nameController,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      EmailTextFormFiled(
                        lable: 'Email',
                        textController: _emailController,),
                      const SizedBox(
                        height: 12.0,
                      ),
                      PasswordFormField(
                        lableText: 'Password',
                        textController: _passwordController,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      PasswordFormField(
                        lableText: 'Confrom Password', 
                        textController: _conformPasswordController,),
                      const SizedBox(
                        height: 32.0,
                      ),
                      OrangeGradientButton(
                          text: 'Register Now',
                          onTapCallBack: () {
                            register();
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      null,
    );
  }

  void register() {
    var isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      if (_passwordController.text != _conformPasswordController.text) {
        
      }
      print('Form is valid');
    }
  }
}

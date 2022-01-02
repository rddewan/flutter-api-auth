import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_register/controller/splash/splash_controller.dart';
import 'package:login_register/controller/splash/state/splash_state.dart';
import 'package:login_register/ui/page/home/home_page.dart';
import 'package:login_register/ui/page/login/login_page.dart';
import 'package:login_register/ui/widget/build_error_dialog.dart';
import 'package:login_register/ui/widget/build_scaffold.dart';
import 'package:login_register/ui/widget/progress_bar.dart';
import 'package:login_register/util/failure.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {    
    listenSplashController(context, ref);    
    return BuildScaffold("", Container(), null);
  }
   
  void listenSplashController(BuildContext context, WidgetRef ref) {
    ref.listen<SplashState>(provideSplashController, (previous, next) {
      next.authModel.when(
          data: (data) {
            if (data == null) {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            } else {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HomePage()));
            }
          },
          error: (e, s) {
            e as Failure;
            return buildErrorDialog(context, title: 'Ouch!', msg: e.message);
          },
          loading: () => const ProgressBar());
    });
  }
}

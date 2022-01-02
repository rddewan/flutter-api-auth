import 'package:flutter/material.dart';
import 'package:login_register/ui/page/login/login_page.dart';
import 'package:login_register/ui/page/splash/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case '/login':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => LoginPage(email: args));
        }
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No Route'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Sorry no route was found!',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    });
  }
}

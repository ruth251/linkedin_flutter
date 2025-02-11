import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import 'package:linkedin_flutter/screens/authentication/sign_in/signin_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String signin = '/signin';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signin:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}

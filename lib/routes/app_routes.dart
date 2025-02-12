import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import 'package:linkedin_flutter/screens/authentication/sign_in/signin_page.dart';
import 'package:linkedin_flutter/screens/authentication/forgot_password/forgot_password.dart';

class AppRoutes {
  static const String splash = '/';
  static const String signin = '/signin';
  static const String forgotPassword = '/forgotpassword';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signin:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}

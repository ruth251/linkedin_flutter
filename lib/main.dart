import 'package:flutter/material.dart';
import 'package:linkedin_flutter/screens/authentication/forgot_password/forgot_password.dart';
import 'package:linkedin_flutter/screens/authentication/sign_up/add_name.dart';
import 'package:linkedin_flutter/screens/authentication/sign_up/email_password.dart';
import 'package:linkedin_flutter/screens/authentication/sign_up/sign_up.dart';
import 'package:linkedin_flutter/screens/authentication/sign_in/signin_page.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LinkedIn Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    

      home: const SetEmailPass(),
      // initialRoute: AppRoutes.splash, // Start with the splash screen
      // onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

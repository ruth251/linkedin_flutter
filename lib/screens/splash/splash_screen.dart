import 'package:flutter/material.dart';
import 'package:linkedin_flutter/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the login page (or home page) after a delay
    //Future.delayed(const Duration(seconds: 10), () {
     // Navigator.pushReplacementNamed(context, AppRoutes.mainScreen),),// Adjust route name as needed
    // Navigate to the specified route after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x802B3F4D),
      body: Center(
        child: Image.asset(
          'assets/images/linkedin_logo.png',
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}

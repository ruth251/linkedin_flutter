import 'package:flutter/material.dart';
import 'package:linkedin_flutter/main_screen.dart';
import 'package:linkedin_flutter/screens/notification/notification_screen.dart';
import 'package:linkedin_flutter/screens/search/search_screen.dart';
import 'package:linkedin_flutter/screens/settings/settings_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String searchScreen = '/search';
  static const String mainScreen = '/main';
  static const String settingScreen = '/settings';
  static const String notificationScreen = '/notification';
  // static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case searchScreen:
        return MaterialPageRoute(builder: (_) => const Search());
      case mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      // case login:
      //   return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}

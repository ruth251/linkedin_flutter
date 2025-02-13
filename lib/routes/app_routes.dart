import 'package:flutter/material.dart';
import 'package:linkedin_flutter/main_screen.dart';
import 'package:linkedin_flutter/screens/messages/messages_screen.dart';
import 'package:linkedin_flutter/screens/notification/notification_screen.dart';
import 'package:linkedin_flutter/screens/search/search_screen.dart';
import 'package:linkedin_flutter/screens/settings/settings_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'package:linkedin_flutter/screens/authentication/sign_in/signin_page.dart';
import 'package:linkedin_flutter/screens/profile/profile_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String searchScreen = '/search';
  static const String mainScreen = '/main';
  static const String settingScreen = '/settings';
  static const String notificationScreen = '/notification';
  static const String signin = '/signin';
  static const String profilePage = '/profile';
  static const String messagesScreen = '/message';



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
      case signin:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case messagesScreen:
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}

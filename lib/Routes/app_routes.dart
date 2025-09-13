import 'package:countify/Screens/home_screen.dart';
import 'package:countify/Screens/login.dart';
import 'package:countify/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home_page = "/";
  static const String splash_screen = "/splash_screen";
  static const String login_screen = "login_screen";

  static Map<String,WidgetBuilder> mRoutes = {
    AppRoutes.home_page : (_) => HomeScreen(),
    AppRoutes.splash_screen : (_) => MySplashScreen(),
    AppRoutes.login_screen : (_) => MyLogin(),
  };

}

import 'package:countify/Routes/app_routes.dart';
import 'package:countify/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MySplashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash_screen,
      routes: AppRoutes.mRoutes,
    ),
  );
}

import 'package:countify/Routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash_screen,
      routes: AppRoutes.mRoutes,
    ),
  );
}

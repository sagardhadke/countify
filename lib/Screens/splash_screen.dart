import 'dart:async';

import 'package:countify/Routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  bool isUserLogin = false;

  @override
  void initState() {
    checkUserLoginStatus();
    print(isUserLogin);
    Timer(
      Duration(seconds: 2),
      () => isUserLogin
          ? Navigator.pushReplacementNamed(
              context,
              // MaterialPageRoute(builder: (context) => HomeScreen()),
              AppRoutes.home_page,
            )
          : Navigator.pushReplacementNamed(
              context,
              // MaterialPageRoute(builder: (context) => MyLogin()),
              AppRoutes.login_screen,
            ),
    );
    super.initState();
  }

  void checkUserLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isUserLogin = prefs.getBool("LoginStatus") ?? false;
    print("Login Status $isUserLogin");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/counting.png", height: 150, width: 150),
            SizedBox(height: 35),
            Text(
              "Countify – Every Launch Counts.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

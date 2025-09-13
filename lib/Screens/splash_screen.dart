import 'dart:async';

import 'package:countify/Screens/home_screen.dart';
import 'package:countify/Screens/login.dart';
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
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyLogin()),
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

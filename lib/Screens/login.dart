import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool isObscure = false;

  bool userLogin = false;

  @override
  void initState() {
    super.initState();
    getLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF7F7F7),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/counting.png", height: 100),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Welcome Back! \nLogin",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 25),
            TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Email",
              ),
            ),
            SizedBox(height: 10),
            StatefulBuilder(
              builder: (context, ss) => TextField(
                controller: pass,
                obscureText: isObscure,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: isObscure
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      ss(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Password",
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Forget Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  saveLoginStatus(true);
                  const snackdemo = SnackBar(
                    content: Row(
                      children: [
                        CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text('Login Successful'),
                      ],
                    ),
                    backgroundColor: Colors.green,
                    elevation: 10,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(5),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveLoginStatus(bool loginStatus) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("LoginStatus", loginStatus);
  }

  void getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userLogin = prefs.getBool("LoginStatus") ?? false;
      print("isuserLogin Status $userLogin");
    });
  }
}

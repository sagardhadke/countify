import 'package:countify/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    getUserCount();
    saveUesCount();
  }

  void getUserCount() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      count = pref.getInt("Count") ?? 0;
      print("user Count $count");
    });
  }

  void saveUesCount() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      count++;
      pref.setInt("Count", count);
      print("Count $count");
    });
  }

  Color getColors() {
    if (count % 3 == 0 && count % 5 == 0) {
      return Colors.red;
    } else if (count % 3 == 0) {
      return Colors.blue;
    } else if (count % 5 == 0) {
      return Colors.orange;
    }
    return Colors.deepPurple;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              userLogout(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: getColors(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "User Count $count",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Home Screen",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void userLogout(BuildContext cont) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushReplacement(
      cont,
      MaterialPageRoute(builder: (_) => MyLogin()),
    );
  }
}

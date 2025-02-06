import 'package:flutter/material.dart';
import 'package:shared_pref/LoginScreen.dart';
import 'package:shared_pref/ProfileScreen.dart';
import 'package:shared_pref/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Profile Screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          final prefs = snapshot.data as SharedPreferences;
          final isLoggedIn = prefs.getString('username') != null;

          return isLoggedIn ? ProfileScreen() : LoginScreen();
        },
      ),
    );
  }
}

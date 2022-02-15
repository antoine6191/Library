import 'package:flutter/material.dart';
import 'login_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        LoginScreen.route:(context) => LoginScreen()
      },
      initialRoute: '/',
    );
  }
}
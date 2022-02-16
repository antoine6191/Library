import 'package:flutter/material.dart';
import 'package:library_exercice/register_screen.dart';
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
        '/register': (context) => RegisterScreen()},

      initialRoute: '/',
    );
  }
}
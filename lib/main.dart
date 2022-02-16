import 'package:flutter/material.dart';
import 'package:library_exercice/books_list.dart';
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
        LoginScreen.route:(context) => LoginScreen(),
        BooksList.route:(context) => BooksList()
      },
      initialRoute: '/books',
    );
  }
}
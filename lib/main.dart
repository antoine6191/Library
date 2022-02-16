import 'package:flutter/material.dart';
import 'package:library_exercice/screens/book_creation_screen.dart';
import 'package:library_exercice/screens/login_screen.dart';
import 'package:library_exercice/screens/register_screen.dart';
import 'screens/books_list.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:  Color(0xFF3CB6D3),
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.grey
      ),
      routes: {
        '/': (context) => LoginScreen(),
        LoginScreen.route:(context) => LoginScreen(),
        BooksList.route:(context) => BooksList(),
        '/register': (context) => RegisterScreen(),
        '/book': (context) => BookCreationScreen(),
    },
      initialRoute: '/',
    );
  }
}

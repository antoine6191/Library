import 'package:flutter/material.dart';
import 'package:library_exercice/books_list.dart';
import 'login_screen.dart';

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
      routes: {
        '/': (context) => BooksList(),
        LoginScreen.route:(context) => LoginScreen(),
        BooksList.route:(context) => BooksList()
      },
      initialRoute: '/',
    );
  }
}

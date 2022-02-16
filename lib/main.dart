import 'package:flutter/material.dart';
import 'package:library_exercice/barcode/barcode_scan.dart';
import 'package:library_exercice/register_screen.dart';
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
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen()},

      initialRoute: '/',
      // home: BarcodeScan(),
    );
  }
}

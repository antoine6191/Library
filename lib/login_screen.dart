import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/login";
  String? name;
  String? password;

  final _namecontroller = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

}
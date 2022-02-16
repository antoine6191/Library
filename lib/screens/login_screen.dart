import 'package:flutter/material.dart';
import 'package:library_exercice/services/book_service.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  bool loggedIn = false;

  String? name;
  String? password;

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final BookService _bookService = BookService();


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Login")),
      body: Center(
          child: _buildLoginForm()),
    );
  }
  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nom d'utilisateur"),
              validator: (value) => value!.isEmpty ? 'Entrez votre nom' : null,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'E-mail'),
              validator: (value) => value!.isEmpty ? 'Entrez votre mdp' : null,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _validate();
                  setState(() {
                    loggedIn = true;
                    name = _nameController.text;
                  });
                }
              },
              child: const Text('Submit'),
            ),ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if(!form!.validate()){
      return;
    }
    final name = _nameController.text;
    final email = _passwordController.text;

    /*Navigator.of(context).pushReplacementNamed(
      StopWatch.route,
      arguments: name,
    );*/
  }
}
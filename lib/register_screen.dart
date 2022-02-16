import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const route = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  bool loggedIn = false;

  String? name;
  String? password;

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Register")),
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
              child: const Text('Register'),
            )
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
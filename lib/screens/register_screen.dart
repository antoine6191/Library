import 'package:flutter/material.dart';
import 'package:library_exercice/services/user_service.dart';

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
  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset('assets/cesi.png', width: 50.0,),
        backgroundColor: Theme.of(context).primaryColor,
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
            Image.asset('assets/cesi.png', width: 500.0,),
            SizedBox(height: 50.0,),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nom d'utilisateur"),
              validator: (value) => value!.isEmpty ? 'Entrez votre nom' : null,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              validator: (value) => value!.isEmpty ? 'Entrez votre mdp' : null,
            ),
            SizedBox(height: 50.0,),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _validate();
                  setState(() {
                    _userService.addUser(_nameController.text, _passwordController.text);
                    Navigator.pushNamed(context, '/listBook');

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

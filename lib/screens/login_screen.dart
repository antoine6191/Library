import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loggedIn = false;

  String? name;
  String? password;

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50.0,
          leading: Image.asset('assets/cesi.png'),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Login")),
      body: Center(child: _buildLoginForm()),
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
              decoration: InputDecoration(labelText: 'E-mail'),
              validator: (value) => value!.isEmpty ? 'Entrez votre mdp' : null,
            ),
            SizedBox(height: 50.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
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
                ),
                SizedBox(width: 25.0,),
                OutlinedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Register', style: TextStyle(color:  Color(0xFF3CB6D3)),
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
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

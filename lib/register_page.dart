import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth =FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  final String title = 'Registro';

  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passswordController =TextEditingController();
  late bool _success;
  late String _userEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (String? value) {
                if(value!.isEmpty) {
                  return 'Ingrese su Correo';
                }
              },
            ),
            TextFormField(
              controller: _passswordController,
              decoration: InputDecoration(labelText: 'Password'),
              validator: (String? value) {
                if(value!.isEmpty) {
                  return 'Ingrese su Contraseña';
                }
              },
            ),
            FlatButton(
                child: Text('Register'),
                color: Colors.deepPurple,
                textColor: Colors.white,
                onPressed: () {
                  _register();
                }
            ),
            Container(
              alignment: Alignment.center,
              child: Text(_success == null
                  ? ''
                  : (_success
                  ? 'Successfully registered' + _userEmail
                  : 'Registration failed'
              )
              ),
            )
          ],
        ),
      ),
    );
  }


  void dispose() {
    _emailController.dispose();
    _passswordController.dispose();
    super.dispose();
  }

  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passswordController.text,
    )) as User;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } else {
      _success = false;
    }
  }


}
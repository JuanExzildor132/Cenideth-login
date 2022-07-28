import 'package:cenideth_login/emailPage.dart';
import 'package:cenideth_login/register_page.dart';
import 'package:cenideth_login/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio de Sesion',
      home: LoginPage(title: 'Firebase Auth'),
    );
  }
}

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesion'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration:
                  InputDecoration(labelText: 'Email', icon: Icon(Icons.email)),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Contraseña', icon: Icon(Icons.vpn_key)),
            ),
            SizedBox(
              height: 15.0,
            ),
            FlatButton(
              child: Text('Login'),
              color: Colors.orangeAccent,
              textColor: Colors.white,
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                )
                    .then((User_user) {
                  Navigator.of(context).pushReplacement(CupertinoPageRoute(
                    builder: (context) => EmailScreen(),
                  ));
                }).catchError((e) {
                  print(e);
                });
              },
            ),
            FlatButton(
              child: Text('Registro'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
            VerticalDivider(),
            FlatButton(
              child: Text('Resgistro'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () => _pushPage(context, SignInPage()),
            ),
          ],
        ),
      ),
    );
  }
}

void _pushPage(BuildContext context, Widget page){
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => page),
  );
}

import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Autch'),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.all(5.0),
            width: 400.0,
            height: 400.0,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("asset/imagenes/correo.jpg"),
                  fit: BoxFit.cover
              ),
            ),
          ),
        ],
      ),
    );
  }
}

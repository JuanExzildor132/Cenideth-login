import 'package:flutter/material.dart';

class  MainGoogle extends StatefulWidget {
  const  MainGoogle({Key? key}) : super(key: key);

  @override
  State< MainGoogle> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<MainGoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Autch'),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.all(5.0),
            width: 400.0,
            height: 400.0,
            decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("asset/imagenes/carga.gif"),
                    fit: BoxFit.cover
                ),
            ),
          )
        ],
      ),
    );
  }
}

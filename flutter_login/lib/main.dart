import 'package:flutter/material.dart';
import 'package:flutter_login/telas/TelaInicial.dart';
import 'package:flutter_login/telas/TelaLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final controladorPagina = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Autentica Usuario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageView(
        controller: controladorPagina,
        children: <Widget>[
          Scaffold(
            body: TelaInicial(controladorPagina),
          ),
          Scaffold(
            body: TelaLogin(),
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {

  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Dica de senha"),
    content: Text("A dica de senha é abcd."),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
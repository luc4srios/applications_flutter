import 'package:escolhe_cor/tela.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String titulo = 'Palheta de cores';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: titulo,
        theme: ThemeData.dark().copyWith(
            primaryColor: Colors.grey[800], accentColor: Colors.amber),
        home: Principal(titulo: titulo),
      );
}

class Principal extends StatelessWidget {
  final String titulo;

  const Principal({this.titulo});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(titulo),
          centerTitle: true,
        ),
        body: Center(child: Tela()),
      );
}

import 'package:flutter/material.dart';
import '../widgets/display.dart';
import '../widgets/teclado.dart';
import '../models/memoria.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() {
    return new _CalculadoraState();
  }
}

class _CalculadoraState extends State<Calculadora> {
  final Memory memory = Memory();

  _onPressed(String comando) {
    setState(() {
      memory.applyCommand(comando);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: <Widget>[
          Display(memory.valor),
          Teclado(_onPressed),
        ],
      ),
    );
  }
}

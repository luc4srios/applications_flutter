import 'package:flutter/material.dart';
import 'button_row.dart';
import 'button.dart';

class Teclado extends StatelessWidget {
  final void Function(String) cb;

  Teclado(this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Column(children: <Widget>[
          ButtonRow([
            Button.grande(text: 'C', cb: cb),
            Button(text: '%', cb: cb),
            Button(text: '+', cb: cb),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button.numeros(text: '7', cb: cb),
            Button.numeros(text: '8', cb: cb),
            Button.numeros(text: '9', cb: cb),
            Button(text: '-', cb: cb),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button.numeros(text: '4', cb: cb),
            Button.numeros(text: '5', cb: cb),
            Button.numeros(text: '6', cb: cb),
            Button(text: '*', cb: cb),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button.numeros(text: '1', cb: cb),
            Button.numeros(text: '2', cb: cb),
            Button.numeros(text: '3', cb: cb),
            Button(text: '/', cb: cb),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button.numeros(text: '0', grande: true, cb: cb),
            Button.numeros(text: '.', cb: cb),
            Button(text: '=', cb: cb),
          ]),
        ]));
  }
}

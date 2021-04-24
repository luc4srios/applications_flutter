import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const ESCURO = Color.fromRGBO(80, 80, 80, 1);
  static const PADRAO = Color.fromRGBO(110, 110, 110, 1);
  static const NUMEROS = Color.fromRGBO(136, 136, 136, 1);

  final String text;
  final bool grande;
  final Color cor;
  final void Function(String) cb;

  Button({
    @required this.text,
    this.grande = false,
    this.cor = PADRAO,
    @required this.cb,
  });

  Button.numeros({
    @required this.text,
    this.grande = false,
    this.cor = NUMEROS,
    @required this.cb,
  });

  Button.grande({
    @required this.text,
    this.grande = true,
    this.cor = PADRAO,
    @required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: grande ? 2 : 1,
      child: RaisedButton(
        color: this.cor,
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w200,
            )),
        onPressed: () => cb(text),
      ),
    );
  }
}

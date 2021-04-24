import 'package:flutter/material.dart';
import 'package:flutter_login/main.dart';

class TelaInicial extends StatefulWidget {
  final PageController controller;
  TelaInicial(this.controller);
  @override
  _TelaInicialState createState() => _TelaInicialState(controller);
}

class _TelaInicialState extends State<TelaInicial> {

  final PageController controladorPagina;
  _TelaInicialState(this.controladorPagina);

  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: displayHeight() / 3,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(150),
              )
            ),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 60,
            ),
          ),

          SizedBox(height: displayHeight() / 4),

          Container(
            margin: EdgeInsets.only(
              top: displayHeight() / 4,
              right:  displayWidth() / 20,
              left:  displayWidth() / 20,
            ),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                  ),
                ]
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                hintText: 'E-mail',
                prefixIcon: Icon(Icons.alternate_email, color: Colors.purple,),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              top: 10,
              right:  displayWidth() / 20,
              left:  displayWidth() / 20,
            ),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                  ),
                ]
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              cursorColor: Colors.purple,
              decoration: InputDecoration(
                hintText: 'Senha',
                prefixIcon: Icon(Icons.vpn_key, color: Colors.purple,),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
            ),
          ),

          Container(
            height: 50,
            margin: EdgeInsets.symmetric(
              horizontal: displayWidth() / 20,
              vertical: 25,
            ),
            child: RaisedButton(
              onPressed: (){
                controladorPagina.nextPage(
                duration: Duration(seconds: 1),
                curve: Curves.ease,
                );
              },
              color: Colors.purple,
              child: Text (
                'Entrar',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),

          Container(
            height: 50,
            margin: EdgeInsets.symmetric(
              horizontal: displayWidth() / 20,
              vertical: 25,
            ),
            child: FlatButton(
              onPressed: (){
                showAlertDialog(context);
              },
              color: Colors.purple,
              child: Text (
                'Recuperar a senha',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

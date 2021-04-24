import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

class DefineCor {
  final String nome;
  final Color cor;

  const DefineCor({
    @required this.nome,
    @required this.cor,
  });
}

//Definição das cores da lista disponíveis
const List<DefineCor> cores = [
  DefineCor(nome: 'VERM.', cor: Colors.red),
  DefineCor(nome: 'VERDE', cor: Colors.green),
  DefineCor(nome: 'AZUL', cor: Colors.blue),
  DefineCor(nome: 'LARANJ.', cor: Colors.orange),
];

class Tela extends StatefulWidget {
  @override
  TelaState createState() => TelaState();
}

class TelaState extends State<Tela> {
  static const String chave = 'colorBox';
  DefineCor colorBox;

  @override
  void initState() {
    super.initState();

    colorBox = cores.first;
    load();
  }

  //Função assincrona para gravar as cores
  Future save(DefineCor colorBox) async {
    setState(() => this.colorBox = colorBox);
    //Obter instancia das preferencias compartilhadas
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(chave, colorBox.nome);
  }

  //Função assincrona para carregar as cores
  Future load() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String data = preferences.getString(chave);

    //Verifica se existe valor
    if (data == null) return;

    final DefineCor corAtual =
        cores.firstWhere((colorBox) => colorBox.nome == data);

    setState(() {
      colorBox = corAtual;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                cores.map((colorBox) => buildBox(context, colorBox)).toList(),
          ),
          SizedBox(width: 250, height: 250),
          Text(
            '   Lucas Rios' + '\n' + '\nRA: 04717-028',
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(color: colorBox.cor),
          )
        ],
      );

  //Quando houver um toque na cor, é chamado o metodo save para salvar a cor que foi tocada.
  Widget buildBox(BuildContext context, DefineCor colorBox) => GestureDetector(
        onTap: () => save(colorBox),
        child: Container(
          child: Center(
            child: Text(
              colorBox.nome,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
          ),
          width: 90.0,
          height: 90.0,
          color: colorBox.cor,
        ),
      );
}

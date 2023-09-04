import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _numeroAleatorio = 0;

  void _gerarNumeroAleatorio() {
    final random = Random();
    final novoNumeroAleatorio = random.nextInt(11); // Gera números de 0 a 10
    setState(() {
      _numeroAleatorio = novoNumeroAleatorio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Jogo do Número Aleatório"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _img(),
          _texto(),
          _numeroGerado(),
          SizedBox(height: 16),
          _botaoGerar(),
        ],
      ),
    );
  }

  _texto() {
    return Text(
      "Pense em um nº de 0 a 10",
      style: TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  _img() {
    return Center(
      child: Image.network(
        'https://e7.pngegg.com/pngimages/78/291/png-clipart-riddler-batman-arkham-city-batman-arkham-asylum-joker-batman-arkham-city-text-orange.png',
        height: 150,
        width: 150,
      ),
    );
  }

  _numeroGerado() {
    return Text(
      '$_numeroAleatorio',
      style: TextStyle(
        color: Colors.white,
        fontSize: 100,
      ),
    );
  }

  _botaoGerar() {
    return Container(
      width: 200,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
        ),
        onPressed: () {
          _gerarNumeroAleatorio();
        },
        child: Text(
          "Descobrir",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
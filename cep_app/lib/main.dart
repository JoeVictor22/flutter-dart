import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Cep> cep;

  @override
  void initState() {
    super.initState();
    cep = fetchCep();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca CEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Busca CEP'),
        ),
        body: Center(
          child: FutureBuilder<Cep>(
            future: cep,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.display);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class Cep {
  final String logradouro;
  final String cep;
  final String complemento;
  final String display;

  Cep({this.logradouro, this.cep, this.complemento, this.display});

  factory Cep.fromJson(Map<String, dynamic> json) {
    var display = json['cep'] + "-" + json['logradouro'];
    return Cep(
      logradouro: json['logradouro'],
      cep: json['cep'],
      complemento: json['complemento'],
      display : display,
    );
  }
}

Future<Cep> fetchCep() async {
  final response = await http.get('https://viacep.com.br/ws/01001000/json/');

  if (response.statusCode == 200) {
    return Cep.fromJson(json.decode(response.body));
  } else {
    throw Exception("Falha ao carregar CEP");
  }
}

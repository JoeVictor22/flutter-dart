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
    cep = fetchCep(60730235);
  }

  int _cep = 60730235;
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => _cep++);
            fetchCep(_cep) ;
            },
          tooltip: 'Increment CEP',
          child: const Icon(Icons.add),
        ),

      ),
    );
  }
}

class Cep {
  String logradouro;
  String cep;
  String complemento;
  String display;

  Cep({this.logradouro, this.cep, this.complemento, this.display});

  factory Cep.fromJson(Map<String, dynamic> json) {
    String cep = (json['cep'] != Null? json['cep'] : "nao");
    String logradouro = (json['logradouro'] != Null? json['logradouro'] : "nao");
    String complemento = (json['complemento'] != Null ? json['complemento'] : "nao");
    String display = cep + "-" + logradouro;

    return Cep(
      logradouro: logradouro,
      cep: cep,
      complemento: complemento,
      display : display,
    );
  }
}

Future<Cep> fetchCep(_cep) async {
  String cep = _cep.toString();
  String url = "https://viacep.com.br/ws/" + cep+ "/json/";
  var response = await http.get(url);

  print(cep+ "-" +  url);

  if (response.statusCode == 200) {
    return Cep.fromJson(json.decode(response.body));
  } else {
    throw Exception("Falha ao carregar CEP");
  }
}

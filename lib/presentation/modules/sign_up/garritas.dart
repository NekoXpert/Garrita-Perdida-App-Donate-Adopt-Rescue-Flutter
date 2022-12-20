import 'dart:convert';

import '../../../data/models/garritas_modelapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const GarritasApp());
}

class GarritasApp extends StatelessWidget {
  const GarritasApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garritdas Perdida',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Adopta(title: 'Dona, Adopta y Rescata'),
    );
  }
}

class Adopta extends StatefulWidget {
  const Adopta({super.key, required this.title});

  final String title;

  @override
  State<Adopta> createState() => _AdoptaState();
}

class _AdoptaState extends State<Adopta> {
  late Future<List<ApiTest>> _listadoApiTests;

  Future<List<ApiTest>> _getApiTests() async {
    final response = await http.get(Uri.parse(
        "https://api.giphy.com/v1/gifs/trending?api_key=ZgrwEHU3FjyVgTWV8c5VUfTsugsGexTJ&limit=10&rating=g"));

    List<ApiTest> ApiTests = [];

    if (response.statusCode == 200) {
      //me aseguro que lo de codifico en UTF8, sólo para asegurar que todo este en castellano
      String body = utf8.decode(response.bodyBytes);
      //convertimos el body en un objeto Json
      final jsonData = jsonDecode(body);
      // print(jsonData["data"][0]["type"]);

      for (var item in jsonData["data"]) {
        ApiTests.add(
            ApiTest(item["title"], item["images"]["downsized"]["url"]));
      }

      return ApiTests;
    } else {
      throw Exception("Falló la conexión");
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoApiTests = _getApiTests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              //return Text("data");

              // --return ListView(
              return GridView.count(
                  crossAxisCount: 2, // sólo con gridview
                  //permite eliminar restricciones en lista
                  // https://www.fluttercampus.com/guide/228/renderbox-was-not-laid-out-error/
                  shrinkWrap: true,
                  children: _listaApiTests(snapshot.data));
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("error");
            }
            // retorno por defecto - circulito que carga algo
            return Center(child: CircularProgressIndicator());
          },
          future: _listadoApiTests,
        ));
  }

  List<Widget> _listaApiTests(data) {
    List<Widget> ApiTests = [];

    for (var ApiTest in data) {
      ApiTests.add(Card(
          child: Column(
        children: [
          Expanded(child: Image.network(ApiTest.url, fit: BoxFit.fill)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(ApiTest.name),
          ),
        ],
      )));
    }
    return ApiTests;
  }
}

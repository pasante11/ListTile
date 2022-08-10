import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

  
  String url = "https://api.thecatapi.com/v1/categories";

  
  Future<dynamic> _getListado() async {
    final respuesta = await http.get( Uri.parse(url));
    
    if (respuesta.statusCode == 200){
      return jsonDecode(respuesta.body);
    } else {
      print("Error con la respusta");
    }
  }

class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Listado API"),
      ),
      body: FutureBuilder<dynamic>(
        future: _getListado(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            print(snapshot);
            return ListView(
              children: listado(snapshot.data)
            ) ;
          } else {
            print("No hay información");
            return Text("Sin data");
          }
        },
        initialData: Center(child: CircularProgressIndicator()),

      )
    );
  }

List<Widget> listado( List<dynamic> info ){

  List<Widget> lista = [];
  info.forEach((elemento) {
    lista.add(Text(elemento["name"]));
  });
  return lista;

}
}
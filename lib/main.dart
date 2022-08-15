import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;

Future<ListadoInspeccions> fetchPhotos() async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1:8000/api/inspeccions'));

  // Use the compute function to run parsePhotos in a separate isolate
 if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ListadoInspeccions.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Datos No Actualizados');
    }
}


class ListadoInspeccions {
    ListadoInspeccions({
        required this.message,
        required this.values,
    });

    String message;
    List<Value> values;

    factory ListadoInspeccions.fromJson(Map<String, dynamic> json) => ListadoInspeccions(
        message: json["message"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
    };
}

class Value {
    Value({
        required this.pi,
        required this.manzana,
        required this.numlote,
        required this.fecha,
    });

    String pi;
    String manzana;
    String numlote;
    DateTime fecha;

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        pi: json["pi"],
        manzana: json["manzana"],
        numlote: json["numlote"],
        fecha: DateTime.parse(json["fecha"]),
    );

    Map<String, dynamic> toJson() => {
        "pi": pi,
        "manzana": manzana,
        "numlote": numlote,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
    };
}


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  

  MyHomePage({Key?key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: (
              FutureBuilder<ListadoInspeccions>(
              future: fetchPhotos(),
              builder: (context, snapshot) {

                if (snapshot.hasData) {
                  List<Value> celulares = snapshot.data!.values;
                 return ListView(
              children: celulares.map(
                  (celular) => ListTile(
                    leading: Icon(Icons.file_copy_rounded),
                    title: Text("PI: "+celular.pi+"\nMANZANA: "+celular.manzana+"\nLOTE: "+celular.numlote + "\nFECHA: "+ celular.fecha.toString()),
                    //subtitle: Text("FECHA: "+ celular.fecha.toString()),
                    trailing: Icon(Icons.edit),
                  )
              ).toList()..add(ListTile())..add(ListTile())
            );

                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            )
        
          )),
    );
  }
}

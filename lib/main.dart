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


void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "home",
      routes: <String, Widget Function(BuildContext)>{
        "home": (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget appBarTitle = const Text("Ficha de Inspeccion");
  Icon actionIcon = const Icon(Icons.search);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: appBarTitle,
        backgroundColor: const Color(0xff00783f),
        automaticallyImplyLeading: false,
         actions: <Widget>[
             IconButton(icon: actionIcon,onPressed:(){
              setState(() {
                if (actionIcon.icon == Icons.search){
                  actionIcon =  Icon(Icons.close);
                  appBarTitle =   TextField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Colors.white),
                        hintText: "Buscar la PI...",
                        hintStyle: TextStyle(color: Colors.white)
                    ),
                    onTap: () =>  FutureBuilder<ListadoInspeccions>(
                        future: fetchPhotos(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                          List<Value> inspeccions = snapshot.data!.values;
                          return ListView(
                            children: inspeccions.map(
                              (inspeccion) => ListTile(
                              leading: const Icon(Icons.file_copy_rounded),
                              title: Text("PI: ${inspeccion.pi}\nMANZANA: ${inspeccion.manzana}\nLOTE: ${inspeccion.numlote}\nFECHA: ${formatDate(inspeccion.fecha, [dd, '-', mm, '-', yyyy, ' '])}"),
                              //subtitle: Text(),
                              trailing: const Icon(Icons.edit),
                            ),
                          ).toList()..add(const ListTile())..add(const ListTile())
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
                    keyboardType: TextInputType.number,
                  );}
                else {
                  actionIcon = const Icon(Icons.search);
                  appBarTitle = const Text("Ficha de Inspeccion");
                }
              });
            } ,),],
        centerTitle: true,
      ),
      body: Center(
          child: (
              FutureBuilder<ListadoInspeccions>(
              future: fetchPhotos(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                 List<Value> inspeccions = snapshot.data!.values;
                 return ListView(
                  children: inspeccions.map(
                    (inspeccion) => ListTile(
                    leading: const Icon(Icons.file_copy_rounded),
                    title: Text("PI: ${inspeccion.pi}\nMANZANA: ${inspeccion.manzana}\nLOTE: ${inspeccion.numlote}\nFECHA: ${formatDate(inspeccion.fecha, [dd, '-', mm, '-', yyyy, ' '])}"),
                    //subtitle: Text(),
                    trailing: const Icon(Icons.edit),
                  ),
                 ).toList()..add(const ListTile())..add(const ListTile())
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

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<ListadoInspeccions> fetchPhotos() async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1:8000/api/inspeccions'));

  // Use the compute function to run parsePhotos in a separate isolate
 if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return ListadoInspeccions.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Datos No Actualizados');
    }
}

// A function that will convert a response body into a List<Photo>
// To parse this JSON data, do
//
//     final listadoInspeccions = listadoInspeccionsFromMap(jsonString);

ListadoInspeccions listadoInspeccionsFromMap(String str) => ListadoInspeccions.fromMap(json.decode(str));

String listadoInspeccionsToMap(ListadoInspeccions data) => json.encode(data.toMap());

class ListadoInspeccions {
    ListadoInspeccions({
        required this.message,
        required this.values,
    });

    String message;
    Values values;

    factory ListadoInspeccions.fromMap(Map<String, dynamic> json) => ListadoInspeccions(
        message: json["message"],
        values: Values.fromMap(json["values"]),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "values": values.toMap(),
    };
}

class Values {
    Values({
        required this.id,
        required this.terrenoId,
        required this.userId,
        required this.nro,
        required this.fecha,
        required this.tipo,
        required this.acceso,
        required this.lat,
        required this.long,
        required this.nombreposeedor,
        required this.telefonoposeedor,
        required this.emailposeedor,
        required this.replegalposeedor,
        required this.horario,
        required this.nit,
        required this.registrocomercio,
        required this.rai,
        required this.psst,
        required this.licenciambiental,
        required this.medidorcre,
        required this.medidorsaguapac,
        required this.propietaria,
        required this.condicionposeedor,
        required this.nombredelpersonal,
        required this.telefonopersonal,
        required this.observacionentrevista,
        required this.actividadindustrial,
        required this.tipoactividadterreno,
        required this.tamanoempresa,
        required this.cantidadempleados,
        required this.hombres,
        required this.mujeres,
        required this.productoselaborados,
        required this.infraestructura,
        required this.tipoinfraestructura,
        required this.etapainfraestructura,
        required this.cerramiento,
        required this.tipocerramiento,
        required this.invasionretiros,
        required this.tipodeinvasion,
        required this.retirofeverificado,
        required this.retirofoverificado,
        required this.retirolaizqverificado,
        required this.retiroladerverificado,
        required this.viasdeacceso,
        required this.agua,
        required this.luz,
        required this.alumbradopublico,
        required this.alcantarillado,
        required this.gas,
        required this.pozo,
        required this.internet,
        required this.numautorizacionpozo,
        required this.recojobasura,
        required this.empresacontratobasura,
        required this.residuossolidos,
        required this.residuosliquidos,
        required this.residuosgaseosos,
        required this.nombreencargadodehse,
        required this.sustanciaspeligrosasverificadas,
        required this.comerciodeenvases,
        required this.emisiondegases,
        required this.archivo,
        required this.obs,
    });

    int id;
    String terrenoId;
    int userId;
    String nro;
    DateTime fecha;
    String tipo;
    String acceso;
    double lat;
    double long;
    String nombreposeedor;
    String telefonoposeedor;
    String emailposeedor;
    String replegalposeedor;
    String horario;
    String nit;
    String registrocomercio;
    String rai;
    String psst;
    String licenciambiental;
    String medidorcre;
    String medidorsaguapac;
    String propietaria;
    String condicionposeedor;
    String nombredelpersonal;
    String telefonopersonal;
    String observacionentrevista;
    String actividadindustrial;
    String tipoactividadterreno;
    String tamanoempresa;
    int cantidadempleados;
    int hombres;
    int mujeres;
    String productoselaborados;
    String infraestructura;
    String tipoinfraestructura;
    String etapainfraestructura;
    String cerramiento;
    String tipocerramiento;
    String invasionretiros;
    String tipodeinvasion;
    int retirofeverificado;
    int retirofoverificado;
    int retirolaizqverificado;
    int retiroladerverificado;
    String viasdeacceso;
    String agua;
    String luz;
    String alumbradopublico;
    String alcantarillado;
    String gas;
    String pozo;
    String internet;
    String numautorizacionpozo;
    dynamic recojobasura;
    String empresacontratobasura;
    String residuossolidos;
    String residuosliquidos;
    String residuosgaseosos;
    String nombreencargadodehse;
    String sustanciaspeligrosasverificadas;
    String comerciodeenvases;
    String emisiondegases;
    String archivo;
    String obs;

    factory Values.fromMap(Map<String, dynamic> json) => Values(
        id: json["id"],
        terrenoId: json["terreno_id"],
        userId: json["user_id"],
        nro: json["nro"],
        fecha: DateTime.parse(json["fecha"]),
        tipo: json["tipo"],
        acceso: json["acceso"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        nombreposeedor: json["nombreposeedor"],
        telefonoposeedor: json["telefonoposeedor"],
        emailposeedor: json["emailposeedor"],
        replegalposeedor: json["replegalposeedor"],
        horario: json["horario"],
        nit: json["nit"],
        registrocomercio: json["registrocomercio"],
        rai: json["rai"],
        psst: json["psst"],
        licenciambiental: json["licenciambiental"],
        medidorcre: json["medidorcre"],
        medidorsaguapac: json["medidorsaguapac"],
        propietaria: json["propietaria"],
        condicionposeedor: json["condicionposeedor"],
        nombredelpersonal: json["nombredelpersonal"],
        telefonopersonal: json["telefonopersonal"],
        observacionentrevista: json["observacionentrevista"],
        actividadindustrial: json["actividadindustrial"],
        tipoactividadterreno: json["tipoactividadterreno"],
        tamanoempresa: json["tamanoempresa"],
        cantidadempleados: json["cantidadempleados"],
        hombres: json["hombres"],
        mujeres: json["mujeres"],
        productoselaborados: json["productoselaborados"],
        infraestructura: json["infraestructura"],
        tipoinfraestructura: json["tipoinfraestructura"],
        etapainfraestructura: json["etapainfraestructura"],
        cerramiento: json["cerramiento"],
        tipocerramiento: json["tipocerramiento"],
        invasionretiros: json["invasionretiros"],
        tipodeinvasion: json["tipodeinvasion"],
        retirofeverificado: json["retirofeverificado"],
        retirofoverificado: json["retirofoverificado"],
        retirolaizqverificado: json["retirolaizqverificado"],
        retiroladerverificado: json["retiroladerverificado"],
        viasdeacceso: json["viasdeacceso"],
        agua: json["agua"],
        luz: json["luz"],
        alumbradopublico: json["alumbradopublico"],
        alcantarillado: json["alcantarillado"],
        gas: json["gas"],
        pozo: json["pozo"],
        internet: json["internet"],
        numautorizacionpozo: json["numautorizacionpozo"],
        recojobasura: json["recojobasura"],
        empresacontratobasura: json["empresacontratobasura"],
        residuossolidos: json["residuossolidos"],
        residuosliquidos: json["residuosliquidos"],
        residuosgaseosos: json["residuosgaseosos"],
        nombreencargadodehse: json["nombreencargadodehse"],
        sustanciaspeligrosasverificadas: json["sustanciaspeligrosasverificadas"],
        comerciodeenvases: json["comerciodeenvases"],
        emisiondegases: json["emisiondegases"],
        archivo: json["archivo"],
        obs: json["obs"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "terreno_id": terrenoId,
        "user_id": userId,
        "nro": nro,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "tipo": tipo,
        "acceso": acceso,
        "lat": lat,
        "long": long,
        "nombreposeedor": nombreposeedor,
        "telefonoposeedor": telefonoposeedor,
        "emailposeedor": emailposeedor,
        "replegalposeedor": replegalposeedor,
        "horario": horario,
        "nit": nit,
        "registrocomercio": registrocomercio,
        "rai": rai,
        "psst": psst,
        "licenciambiental": licenciambiental,
        "medidorcre": medidorcre,
        "medidorsaguapac": medidorsaguapac,
        "propietaria": propietaria,
        "condicionposeedor": condicionposeedor,
        "nombredelpersonal": nombredelpersonal,
        "telefonopersonal": telefonopersonal,
        "observacionentrevista": observacionentrevista,
        "actividadindustrial": actividadindustrial,
        "tipoactividadterreno": tipoactividadterreno,
        "tamanoempresa": tamanoempresa,
        "cantidadempleados": cantidadempleados,
        "hombres": hombres,
        "mujeres": mujeres,
        "productoselaborados": productoselaborados,
        "infraestructura": infraestructura,
        "tipoinfraestructura": tipoinfraestructura,
        "etapainfraestructura": etapainfraestructura,
        "cerramiento": cerramiento,
        "tipocerramiento": tipocerramiento,
        "invasionretiros": invasionretiros,
        "tipodeinvasion": tipodeinvasion,
        "retirofeverificado": retirofeverificado,
        "retirofoverificado": retirofoverificado,
        "retirolaizqverificado": retirolaizqverificado,
        "retiroladerverificado": retiroladerverificado,
        "viasdeacceso": viasdeacceso,
        "agua": agua,
        "luz": luz,
        "alumbradopublico": alumbradopublico,
        "alcantarillado": alcantarillado,
        "gas": gas,
        "pozo": pozo,
        "internet": internet,
        "numautorizacionpozo": numautorizacionpozo,
        "recojobasura": recojobasura,
        "empresacontratobasura": empresacontratobasura,
        "residuossolidos": residuossolidos,
        "residuosliquidos": residuosliquidos,
        "residuosgaseosos": residuosgaseosos,
        "nombreencargadodehse": nombreencargadodehse,
        "sustanciaspeligrosasverificadas": sustanciaspeligrosasverificadas,
        "comerciodeenvases": comerciodeenvases,
        "emisiondegases": emisiondegases,
        "archivo": archivo,
        "obs": obs,
    };
}


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

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
      body: Padding(
        padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
        child: FutureBuilder<ListadoInspeccions>(
         future: fetchPhotos(),
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             //return Text(snapshot.data!.values.nombreposeedor);
             return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  <Widget>[
                Card(
                  elevation: 2.0,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    child: Expanded(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        leading: const Icon(Icons.file_copy_rounded, color:Color(0xff8dc440), size: 50,),
                        title:  Text("Fecha: "'${snapshot.data!.values.fecha}'),
                        subtitle: Text("Terreno: " '${snapshot.data!.values.terrenoId}'),
                        trailing:  const Icon(Icons.edit, color:Color(0xff8dc440),size: 30,),
                        onTap: () {
                          //Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(user: widget.user)));
                        },
                      ),
                    ),
                ),
                ]
            );
           
           } else if (snapshot.hasError) {
             return Text('${snapshot.error}');
           }
           // By default, show a loading spinner.
           return const Center(
           child: Text("cargando..."),
         );
         },
       ),
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<ListadoInspeccions> photos;

  PhotosList({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
                constraints: BoxConstraints.expand(
                ),
                color: Colors.white10,
                alignment: Alignment.center,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Image.network(
                          photos[index].values.acceso,
                          fit: BoxFit.fitWidth,
                        ),
                        title: Text(photos[index].values.nombreencargadodehse),
                        subtitle: Text(photos[index].values.emailposeedor),
                      ),
                      ButtonTheme(
                        // make buttons use the appropriate styles for cards
                        child: ButtonBar(
                          children: <Widget>[                         
                            FlatButton(
                              child: const Text('Open'),
                              onPressed: () {/* ... */},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        );
      },
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_ml_kit_example/api/api_auditiva.dart';


class RespuestaScreen extends StatelessWidget {
   
  const RespuestaScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments.toString();
    // print('-------------------------------');
    // print(args);
    //  var ab = (args!.split(', '));
    // final respuesta = json.decode(args!);
    // print(ab);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Respuestas"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          // color: Color.fromARGB(255, 139, 133, 133),
          child: FutureBuilder<List>(
            future: AuditivaApi.getAllPeticion( args! ),
            builder: (context, AsyncSnapshot snapshot) {
              print(snapshot);
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    // print(snapshot.data![i]['image']['url']);
                    final respuesta = snapshot.data![i]['image']['url'];
                    final traducida = snapshot.data![i]['traducida'];
                    return Container(
                      width: double.infinity,
                      // height: 500,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          Image( image: NetworkImage('$respuesta'), fit: BoxFit.cover, width: 500 ),
                          Text('$traducida', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Divider()
                        ],
                      )
                      
                    );
                  }
                  // },
                );
              } else { return const Center( child: Text('No Data Found'), ); }
            },
          ),
        ),
      ),
    );
  }
}
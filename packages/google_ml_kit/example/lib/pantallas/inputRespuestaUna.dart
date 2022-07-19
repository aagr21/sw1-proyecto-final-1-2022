import 'dart:convert';

import 'package:flutter/material.dart';

class InputRespuestaUnaScreen extends StatelessWidget {
   
  const InputRespuestaUnaScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    // print(args['data1']);
    // print(args['text'])args['data1'];
    final urlCadena = args['data1'].toString();
    final dataText = args['text'];
    // print(urlCadena);
    // final borrado = urlCadena.substring(1, args.length - 1);
    // print(borrado);
    // print(args!.substring(15, 110));// url
    // print(args!.substring(215, 229));// url
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Respuestas"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
            width: 300,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image( image: NetworkImage('$urlCadena'), width: 300 ),
                Text('$dataText', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],
            ),
        ),
      ),
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_ml_kit_example/api/api_auditiva.dart';

class InputAuditivaScreen extends StatelessWidget {
   
  InputAuditivaScreen({Key? key}) : super(key: key);
  final TextEditingController _palabraController = TextEditingController();
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresar Datos'),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
          child: Column(
            children: [
              TextFormField(// Formulario de HTML
                controller: _palabraController,
                decoration: const InputDecoration(// Personalizar las cajas
                  hintText: 'Ingresar palabra...',// placeholder
                  prefixIcon: Icon( Icons.perm_device_information ),
                ),
                
              ),
              Container(
                margin: EdgeInsets.symmetric( vertical: 20 ),
                child: ElevatedButton(
                  child: const Padding(// Padding dentro del boton
                    padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
                    child: Text('Realizar consulta', style: TextStyle( fontSize: 16 )),
                  ),
                  onPressed: () async{
                    var data1 = await AuditivaApi.postPeticion( palabra: _palabraController.text );
                    // print( jsonDecode(data1) );
                    // Future.delayed(Duration.zero).then((value) => {
                    //   Navigator.pop(context)
                    // });
                    Navigator.pushNamed(context, 'inputRespuestaUna', arguments: {
                      'data1': data1, 
                      'text': _palabraController.text
                    });
                  },
                ),
              ),
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon( Icons.image ),
        onPressed: () {
          Navigator.pushNamed(context, 'auditiva');
        }
      ),
    );
  }
}
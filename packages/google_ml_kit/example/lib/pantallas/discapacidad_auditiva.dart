import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit_example/models/auditiva.model.dart';
import 'package:google_ml_kit_example/api/api_auditiva.dart';

class DiscapacidadAuditivaScreen extends StatefulWidget {
  const DiscapacidadAuditivaScreen({Key? key}) : super(key: key);

  @override
  State<DiscapacidadAuditivaScreen> createState() => _DiscapacidadAuditivaScreenState();
}

class _DiscapacidadAuditivaScreenState extends State<DiscapacidadAuditivaScreen> {
  bool imageLabelChecking = false;
  // Auditiva auditivaServicio = ;

  XFile? imageFile;
  List<String> envioDato = [];

  String imageLabel = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Gelería o Camara"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (imageLabelChecking) const CircularProgressIndicator(),
                if (!imageLabelChecking && imageFile == null)
                  Container(
                    width: 300,
                    height: 300,
                    child: const Image( image: AssetImage('assets/image.jpg'), )
                  ),
                if (imageFile != null)
                  Image.file( File(imageFile!.path) ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.grey,
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric( vertical: 5, horizontal: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon( Icons.image, size: 30, color: Colors.red ),
                                Text( "Galería", style: TextStyle( fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.grey,
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            getImage(ImageSource.camera);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric( vertical: 5, horizontal: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon( Icons.camera_alt, size: 30, color: Colors.red ),
                                Text( "Camara", style: TextStyle( fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                  const SizedBox( height: 20 ),
                  Text( imageLabel, style: const TextStyle(fontSize: 20) ),
                  ElevatedButton(
                    child: const Padding(// Padding dentro del boton
                      padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
                      child: Text('Resultado de las busquedas', style: TextStyle( fontSize: 16 )),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'respuesta', arguments: envioDato);
                    },
                  ),
                
              ],
            )
          ),
        )
      ),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        imageLabelChecking = true;
        imageFile = pickedImage;
        setState(() {});
        getImageLabels(pickedImage);
      }
    } catch (e) {
      imageLabelChecking = false;
      imageFile = null;
      imageLabel = "Error occurred while getting image Label";
      setState(() {});
    }
  }

  void getImageLabels(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    ImageLabeler imageLabeler =
        ImageLabeler(options: ImageLabelerOptions(confidenceThreshold: 0.75));
    List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    StringBuffer sb = StringBuffer();
    
    // print(labels);
    for (ImageLabel imgLabel in labels) {
      String lblText = imgLabel.label;
      envioDato.add( lblText);
      // print(lblText);
      // double confidence = imgLabel.confidence;
      // sb.write(lblText);
      // sb.write(" : ");
      // sb.write((confidence * 100).toStringAsFixed(2));
      // sb.write("%\n");
    }
    // print(envioDato);
    // listarPeticion( envioDato );
    imageLabeler.close();
    imageLabel = sb.toString();
    imageLabelChecking = false;
    setState(() {});
  }
}
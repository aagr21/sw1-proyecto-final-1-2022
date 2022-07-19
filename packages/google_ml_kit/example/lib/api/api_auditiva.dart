import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class AuditivaApi {
  

  static Future<List> getAllPeticion( String datos ) async {
    // String baseUrl = "http://192.168.0.156:4000/api/lenguaje/obtener";
    try {
      var response = await Dio().get("https://limitless-cliffs-34121.herokuapp.com/api/lenguaje/obtener", queryParameters: { "peticionPalabras": datos });
      // var response = await Dio().get(baseUrl, queryParameters: { 'datosPalabra': datos });
      // print(response);
      // if (response.statusCode == 200) {
      return response.data;
      // } else {
        // return Future.error("Server Error");
      // }
    } catch (e) {
      return Future.error(e);
    }
  }
  static Future postPeticion( {String palabra = ''} ) async {
    try {
      var response = await Dio().post("https://limitless-cliffs-34121.herokuapp.com/api/lenguaje/envioDato", data: {
        "sendPalabra": palabra
      });
      // var response = await Dio().get(baseUrl, queryParameters: { 'datosPalabra': datos });
      // print(response);
      // if (response.statusCode == 200) {
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
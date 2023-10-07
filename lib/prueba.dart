
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class prueba extends StatefulWidget{
  static const nombreRuta ='registro';

  @override
  State<prueba> createState()=> _pruebaState();
}

class _pruebaState extends State<prueba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("hola")),
    );
  }


}

Future<void> fetchDataFromBackend() async {
  final response = await http.get(Uri.parse('https://localhost:7158/CallSoapMethod'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al obtener texto');
    // Maneja los errores de respuesta aquí.
  }
}
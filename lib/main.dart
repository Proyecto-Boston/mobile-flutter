import 'package:app_celtic_drive/inicio_sesion.dart';
import 'package:app_celtic_drive/registro.dart';
import 'package:flutter/material.dart';
import 'dart:io';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: registro(),
      routes: {
        registro.nombreRuta: (BuildContext context)=> registro(),
        inicio_sesion.nombreRuta:(BuildContext context) => inicio_sesion(),
      }
    );
  }
}


import 'dart:convert';

import 'package:app_celtic_drive/auth_service.dart';
import 'package:app_celtic_drive/inicio.dart';
import 'package:app_celtic_drive/inicio_sesion.dart';
import 'package:app_celtic_drive/models_request/response.dart';

import 'package:app_celtic_drive/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class registro extends StatefulWidget {
  static const nombreRuta = 'registro';


  @override
  State<registro> createState() => _registroState();
}

class _registroState extends State<registro> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = "";
  final AuthService auth_service = AuthService();
  //final AuthService authService = AuthService();
  /*
  void loginUser(){
    authService.signInUser(context: context, email: emailController.text, password: passwordController.text);
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Center(
            child: Container(
                decoration: const BoxDecoration(),

                ///terminar
                width: 350,
                height: 800,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Registro",
                          style: TextStyle(
                              fontSize: 34,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          height: 10,
                        ),
                      ),
                      const Text(
                        "Nombre usuario",
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: TextField(
                          controller: nameController,
                          obscureText: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 118, 253)),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[500])),
                        ),
                      ),
                      const Text(
                        "Apellido",
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: TextField(
                          controller: surnameController,
                          obscureText: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 118, 253)),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[500])),
                        ),
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: TextField(
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 118, 253)),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[500])),
                        ),
                      ),
                      const Text(
                        "Contraseña",
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 118, 253)),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[500])),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 24),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            final String url = 'http://10.0.2.2:1234/auth/register';
                            final name = nameController.text;
                            final surname = surnameController.text;
                            final email = emailController.text;
                            final password = passwordController.text;
                            final user = User(
                              id: 0,
                                name: name,
                                surname: surname,
                                email: email,
                                password: password);

                            try{
                              final response = await http.post(
                                Uri.parse(url),
                                body: json.encode(user.toJson()),
                                headers: {'Content-Type': 'application/json'},
                                );
                                final Map<String, dynamic> data = json.decode(response.body);
                                final r = Response.fromJson(data, statusCode: 200, details: 'El usuario se registró correctamente', );
                              if (response.statusCode == 200) {
                                setState(() {
                                  message = 'Usuario registrado exitosamente: $response';
                                });
                                final id= json.decode(response.body);
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Inicio(title: "Inicio", user: user,id: data["json"])));
                                
                              } else {
                                setState(() {
                                  message = 'Usuario ya registrado';
                                });
                              }
                            }catch(e){
                              print('Error: $e');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 118, 253),
                              minimumSize: const Size(double.infinity, 56),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)))),
                          icon: const Icon(
                            Icons.arrow_right,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          label: const Text(
                            "Registrarse",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ]))),
      ],
    ));
  }
}

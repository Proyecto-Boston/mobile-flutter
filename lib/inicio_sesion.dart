

import 'package:app_celtic_drive/auth_service.dart';
import 'package:app_celtic_drive/inicio.dart';

import 'package:app_celtic_drive/user.dart';
import 'package:flutter/material.dart';

class inicio_sesion extends StatefulWidget{
  static const nombreRuta ='login';
  @override
  State<inicio_sesion> createState() => _inicio_sesionState();
}

class _inicio_sesionState extends State<inicio_sesion> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message="";
  final AuthService auth_service=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    SingleChildScrollView(
      child: Center(
        child: Container(
          decoration:const BoxDecoration(),///terminar
          width: 350,
          height: 550,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 34,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const Text("Email",style: TextStyle(color: Colors.black),),
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 118, 253)),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[500])
                  ),
                ),
              ),
              const Text("Contraseña",style: TextStyle(color: Colors.black),),
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    focusedBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 118, 253)),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[500])
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () async{
                   
                    final email = emailController.text;
                    final password = passwordController.text;
                    final user = User(id: 0,email: email,password: password);
    
                    final response = (await auth_service.LoginUsuario(email,password));
                    if (response == 200) {
                      setState(() {
                        message = 'Ingreso exitoso';
                      });
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Inicio(title: "Inicio", user: user)));
                    } else if (response == 400) {
                      setState(() {
                        message = 'Error: ${response}';
                      });
                    } else {
                      setState(() {
                        message = 'Error desconocido';
                      });
                    }
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color.fromARGB(255, 0, 118, 253),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)
                      )
                    )
                  ),
                  icon: const Icon(Icons.arrow_right, color: Color.fromARGB(255, 255, 255, 255),),
                  label: const Text("Login",style: TextStyle(color: Colors.white),),
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                message,
                style: TextStyle(color: Colors.red),
              ),
            ]
          )
        )
      ),
    ));
  }
}
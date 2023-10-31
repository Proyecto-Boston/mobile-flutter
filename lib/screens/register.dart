import 'dart:convert';
import 'package:app_celtic_drive/models_request/response.dart';
import 'package:app_celtic_drive/screens/inicio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterUserWidget extends StatefulWidget {
  static const nombreRuta = 'registro';
  @override
  _RegisterUserWidgetState createState() => _RegisterUserWidgetState();
}

class _RegisterUserWidgetState extends State<RegisterUserWidget> {
  Response response = new Response(json: "", details: "");
  bool isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de usuario'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                ElevatedButton(
                  onPressed: () {
                    registerUser(
                      emailController.text,
                      passwordController.text,
                    );
                  },
                  child: Text('Registrar'),
                ),
                Text(response.details),
              ],
            ),
    );
  }

  Future<void> registerUser(String email, String password) async {
    final url = 'http://10.0.2.2:1234/auth/register'; 
    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    setState(() {
      isLoading = true;
    });

    try {
      final httpResponse = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      final Map<String, dynamic> data = json.decode(httpResponse.body);
      response = Response.fromJson(data, statusCode: data["statusCode"], details: data["details"]);

      if (response.statusCode == 201) {
        // Registro exitoso, navegar a la vista "Inicio" con el ID del usuario
        final userId = int.tryParse(response.json);
        if (userId != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyFileListWidget(userId: userId),
            ),
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    }

    setState(() {
      isLoading = false;
    });
  }
}





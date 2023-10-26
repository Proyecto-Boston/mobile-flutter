import 'dart:convert';
import 'dart:io';

import 'package:app_celtic_drive/File.dart';
import 'package:app_celtic_drive/Folder.dart';
import 'package:app_celtic_drive/custom_file.dart';
import 'package:app_celtic_drive/user.dart';
import 'package:http/http.dart' as http;
import 'package:app_celtic_drive/response.dart';
import 'package:file_picker/file_picker.dart';

class AuthService {
  Future<Map<String, dynamic>> LoginUsuario(
      String email, String password) async {
    final String url = 'http://localhost:8000/auth/login';
    

    final requestBody = {'email': email, 'password': password};

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Usuario no registrado');
    } else {
      throw Exception('Hubo un problema al iniciar sesión');
    }
  }

  Future<int> RegistroUsuario(User user) async {
    final String apiUrl = 'http://localhost:8000/auth/register';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return 201;
      } else if (response.statusCode == 400) {
        return json.decode(response.body)['details'];
      } else {
        return 400;
      }
    } catch (e) {
      print('Error: $e');
      return 503;
    }
  }

  Future<String> verificarSesion(String token) async {
    final String url = 'http://localhost:8000/auth/verifySession';

    final response = await http.post(
      Uri.parse(url),
      body: json.encode({"token": token}),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      return json.decode(response.body)["json"];
    } else if (response.statusCode == 400) {
      return json.decode(response.body)["details"];
    } else {
      return "Respuesta inesperada";
    }
  }

  Future<String> crearCarpeta(Folder carpeta) async {
    final String url = 'http://localhost:8000/folder/createFolder';

    final response = await http.post(
      Uri.parse(url),
      body: json.encode(carpeta.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      return "Carpeta creada";
    } else if (response.statusCode == 400) {
      return json.decode(response.body)["details"];
    } else {
      return "Respuesta inesperada";
    }
  }

  

  Future<String> moverArchivo(String ruta, int idArchivo) async {
    final String url = 'https://localhost:8000/file/moveFile';

    final Map<String, dynamic> requestBody = {
      "ruta": ruta,
      "idArchivo": idArchivo,
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        body: json.encode(requestBody),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        return "El archivo se ha movido correctamente";
      } else if (response.statusCode == 400) {
        return json.decode(response.body)["details"];
      } else {
        return "Respuesta inesperada";
      }
    } catch (e) {
      print(e.toString());
      return "Error de conexión";
    }
  }

  Future<String> eliminarArchivo(File archivo) async {
    final String url = 'https://localhost:8000/file/deleteFile';
    try {
      final response = await http.put(
        Uri.parse(url),
        body: json.encode(archivo.toJson()),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        return "El archivo se ha eliminado correctamente";
      } else if (response.statusCode == 400) {
        return json.decode(response.body)["details"];
      } else {
        return "Respuesta inesperada";
      }
    } catch (e) {
      print(e.toString());
      return "Error de conexión";
    }
  }
}

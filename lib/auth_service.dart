import 'dart:convert';

import 'package:app_celtic_drive/File.dart';
import 'package:app_celtic_drive/Folder.dart';
import 'package:app_celtic_drive/custom_file.dart';
import 'package:app_celtic_drive/user.dart';
import 'package:http/http.dart' as http;
import 'package:app_celtic_drive/response.dart';
import 'package:file_picker/file_picker.dart';

class AuthService {
  Future<String> LoginUsuario(User user) async {
    final String apiUrl = 'http://10.153.50.58:8000/api/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode({
          "email": user.email,
          "password": user.password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        final token = json.decode(response.body)["token_jwt"];
        return "Ingreso exitoso. Token: $token";
      } else if (response.statusCode == 400) {
        final mensajeError = json.decode(response.body)["message"];
        return "Error de inicio de sesión: $mensajeError";
      } else {
        return "Respuesta inesperada del servidor";
      }
    } catch (e) {
      print(e.toString());
      return "Error de conexión";
    }
  }

  Future<int> RegistroUsuario(User user) async {
    final String apiUrl = 'https://10.0.2.2:8000/api/registro';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
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
    final String url = 'http://10.153.50.34:8000/api/verificarSesion';

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
    final String url = 'http://10.153.50.34:8000/api/crearCarpeta';

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

  Future<String> subirArchivo(File archivo) async {
    final String url = 'http://10.153.50.34:8000/api/subirArchivo';

      try {
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..files.add(await http.MultipartFile.fromPath(
          'archivo',
          archivo.path,
        ));

      var response = await request.send();
      if (response.statusCode == 201) {
        return "Archivo subido exitosamente";
      } else if (response.statusCode == 400) {
        final responseBody = await response.stream.bytesToString();
        return responseBody;
      } else {
        return "Respuesta inesperada";
      }
    } catch (e) {
      print(e.toString());
      return "Error de conexión";
    }
  }

  Future<String> moverArchivo(String ruta, int idArchivo) async {
    final String url = 'https://localhost:7191/api/moverArchivo';

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
    final String url =
        'https://localhost:7191/api/eliminarArchivos'; 
    try {
      final response = await http.put(
        Uri.parse(url),
        body: json.encode(archivo
            .toJson()), 
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

  Future<String> obtenerArchivosUsuario(int idUser) async {
    final String url =
        'https://localhost:7191/api/obtenerArchivos?idUser=$idUser'; 

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        
        return response.body;
      } else if (response.statusCode == 400) {
        return "Error: ${response.body}";
      } else {
        return "Respuesta inesperada";
      }
    } catch (e) {
      print(e.toString());
      return "Error de conexión";
    }
  }
}

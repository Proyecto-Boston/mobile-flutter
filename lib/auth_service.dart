
import 'dart:convert';

import 'package:app_celtic_drive/user.dart';
import 'package:http/http.dart' as http;
import 'package:app_celtic_drive/response.dart';

class AuthService{

  Future<Response> login(User user) async {
    final url = 'https://192.168.0.114:7286/api/Soap/Login'; 
    final body = {
      'email': user.email,
      'password': user.password,
    };

    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 202) {
        
        final responseData = jsonDecode(response.body);
        final token = responseData['token'];
        return Response(statusCode: 202, json: token, details: 'Ingreso exitoso');
      } else if (response.statusCode == 400) {
        final responseData = jsonDecode(response.body);
        final message = responseData['message'];
        return Response(statusCode: 400, json: "null",details: message);
      } else {
        return Response(statusCode: response.statusCode,json: "null", details: 'Error al procesar la solicitud');
      }
    } catch (e) {
      print('Error: $e');
      return Response(statusCode: 400, json: "null",details: 'Error al procesar la solicitud');
    }
  }


}
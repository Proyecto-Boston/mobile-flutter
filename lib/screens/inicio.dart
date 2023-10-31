import 'dart:convert';
import 'package:app_celtic_drive/models_request/File.dart';
import 'package:app_celtic_drive/models_request/response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyFileListWidget extends StatefulWidget {
  final int userId;

  MyFileListWidget({required this.userId});

  @override
  _MyFileListWidgetState createState() => _MyFileListWidgetState();
}

class _MyFileListWidgetState extends State<MyFileListWidget> {
  late Response response;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = 'http://10.0.2.2:1234/file/getFiles';

    try {
      final httpResponse = await http.get(Uri.parse(url));
      if (httpResponse.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(httpResponse.body);
        response = Response.fromJson(data, statusCode: data["statusCode"], details: data["details"], );
      }
    } catch (e) {
      print('Error: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de archivos'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : response.statusCode == 200
              ? buildFileList(response.json)
              : Center(
                  child: Text(response.details),
                ),
    );
  }

  Widget buildFileList(String json) {
    // Parse y muestra la lista de archivos según la estructura de tu respuesta JSON
    // Asumiendo que tienes una lista de archivos llamada "files" en tu respuesta JSON.
    final List<File> files = (jsonDecode(json)['files'] as List)
        .map((fileJson) => File.fromJson(fileJson))
        .toList();

    return ListView.builder(
      itemCount: files.length,
      itemBuilder: (context, index) {
        final file = files[index];
        return ListTile(
          title: Text(file.name),
        );
      },
    );
  }
}




import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  PlatformFile? _file;
  String _fileData = "";

  Future<void> selectFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          _file = result.files.first;
          final bytes = File(_file!.path!).readAsBytesSync();
          _fileData = base64Encode(bytes);
        });
      }
    } on PlatformException catch (e) {
      print("Error al seleccionar el archivo: $e");
    }
  }

  Future<void> uploadFile() async {
    if (_file == null) {
      print("No se ha seleccionado un archivo.");
      return;
    }

    final url = Uri.parse("http://10.0.2.2:1234/file/uploadFile"); // Reemplaza con la URL de tu API

    final request = http.MultipartRequest('POST', url)
      ..fields['fileData'] = _fileData
      ..fields['id'] = '1'
      ..fields['name'] = _file!.name
      ..fields['path'] = '/uploads'
      ..fields['size'] = '1024'
      ..fields['userId'] = '1'
      ..fields['folderId'] = '2'
      ..fields['nodeId'] = '3';

    final response = await request.send();

    if (response.statusCode == 200) {
      print("Archivo enviado exitosamente.");
    } else {
      print("Error al enviar el archivo: ${response.reasonPhrase}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subir Documento",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor:Color.fromARGB(255, 0, 118, 253), ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: selectFile,
              child: Text("Seleccionar Archivo"),
            ),
            if (_file != null) Text("Archivo seleccionado: ${_file!.name}"),
            ElevatedButton(
              onPressed: uploadFile,
              child: Text("Subir Archivo"),
            ),
          ],
        ),
      ),
    );
  }
}


import 'dart:convert';

import 'package:app_celtic_drive/File.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FileListScreen extends StatefulWidget {
  @override
  _FileListScreenState createState() => _FileListScreenState();
}

class _FileListScreenState extends State<FileListScreen> {
  List<File> files = [];
  bool isLoading = false;

  Future<void> fetchFiles(int id) async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse('http://localhost:1234/file/getFiles?id=$id'));

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData.containsKey("files")) {
        final List<dynamic> filesData = jsonData["files"];
        files = filesData
            .map((fileData) => File(
                  id: fileData['id'],
                  name: fileData['name'],
                  path: fileData['path'],
                  fileData: List<String>.from(fileData['fileData']),
                  size: fileData['size'].toDouble(),
                  userId: fileData['userId'],
                  folderId: fileData['folderId'],
                  nodeId: fileData['nodeId'],
                ))
            .toList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Documentos",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor:Color.fromARGB(255, 0, 118, 253), ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : files.isEmpty
              ? Center(child: Text('No se encontraron archivos'))
              : ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    final file = files[index];
                    return ListTile(
                      title: Text(file.name),
                      subtitle: Text(file.path),
                      // Aquí puedes mostrar más detalles si lo deseas
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Llamar a la función para obtener los archivos
          fetchFiles(1);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
import 'dart:convert';
import 'dart:io';

import 'package:app_celtic_drive/File.dart';
import 'package:app_celtic_drive/auth_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;

class subir_documento extends StatefulWidget{
  const subir_documento({super.key, required this.title});

  final String title;
  @override
  State<subir_documento> createState()=> _subir_documentoState();
}

class _subir_documentoState extends State<subir_documento> {

  FileUploader fileUploader = FileUploader('http://10.0.2.2:1234');
  late String filePath;

  Future<void> uploadFile(File file) async {
    try {
        await fileUploader.uploadFile(file, id: file.id, name: file.name, path: filePath, fileData: file.fileData, size: file.size, userId: file.userId, folderId: file.folderId,nodeId: file.nodeId);
        print('Archivo subido con éxito.');
      } catch (e) {
        print('Error al subir el archivo: $e');
      }
  }
  
  late AuthService authService;
  String tipo = 'Todo';
  var fileTypeList = ['Todo', 'Imagen', 'Video', 'Audio'];
  FilePickerResult? resultado;
  PlatformFile? archivo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor:Color.fromARGB(255, 0, 118, 253), ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Seleciona el tipo de archivo',style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20),
                ),
                DropdownButton(
                  value: tipo,
                  items: fileTypeList.map((String type){
                    return DropdownMenuItem(value: type,child: Text(type,style: TextStyle(fontSize: 20),));
                  },
                ).toList(),
                onChanged: (String? value){
                  setState(() {
                    tipo=value!;
                    archivo;
                  });

                },
            )],
            ),
            ElevatedButton(onPressed:() {seleccionar(tipo);} , child: Text("Seleccionar Documento")),
            if (archivo!=null) detallesArchivo(archivo!),
            if (archivo!=null) ElevatedButton(onPressed: (){verSeleccion(archivo! as PlatformFile);}, child: Text("Ver archivo")),
            ElevatedButton(
              
              onPressed: (){
                uploadFile(archivo as File);},
              child: Text('Subir Archivo'),
            ),
          ],
        )
      ),
      
      backgroundColor: Colors.white,
    );
  }

  Widget detallesArchivo(PlatformFile archivo){
    final kb = archivo.size / 1024;
    final mb = kb / 1024;
    final size  = (mb>=1)?'${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nombre: ${archivo.name}'),
          Text('Tamaño: $size'),
          Text('Extencion: ${archivo.extension}'),
          Text('Ruta: ${archivo.path}'),
        ],
      ),
    );
  }

  void seleccionar(String? tipo)async{
    switch (tipo) {
      case 'Image':
        resultado = await FilePicker.platform.pickFiles(type: FileType.image);
        if (resultado == null) return;
        archivo = resultado!.files.first;
        setState(() {});
        break;
      case 'Video':
        resultado = await FilePicker.platform.pickFiles(type: FileType.video);
        if (resultado == null) return;
        archivo = resultado!.files.first;
        setState(() {});
        break;
      case 'Audio':
        resultado = await FilePicker.platform.pickFiles(type: FileType.audio);
        if (resultado == null) return;
        archivo = resultado!.files.first;
        setState(() {});
        break;
      case 'All':
        resultado = await FilePicker.platform.pickFiles();
        if (resultado == null) return;
        archivo = resultado!.files.first;
        setState(() {});
        break;
    }
    verSeleccion(archivo!);
  }

  void verSeleccion(PlatformFile archivo){
    OpenFile.open(archivo.path);
  }
}

class FileUploader {
  final String baseUrl; // URL del servidor API
  FileUploader(this.baseUrl);

  Future<void> uploadFile(File file, {
    required int id,
    required String name,
    String? path,
    required List<String> fileData,
    required int size,
    required int userId,
    required int folderId,
    required int nodeId,
  }) async {
    final apiUrl = Uri.parse('$baseUrl/file/uploadFile'); 
    final Map<String, dynamic> data = {
      'id': id,
      'name': name,
      'path': path,
      'fileData': fileData,
      'size': size,
      'userId': userId,
      'folderId': folderId,
      'nodeId': nodeId,
    };

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      apiUrl,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Archivo subido exitosamente.');
    } else {
      print('Error al subir el archivo: ${response.statusCode}');
      throw Exception('No se pudo subir el archivo.');
    }
  }
}
import 'dart:io';

import 'package:app_celtic_drive/File.dart';
import 'package:app_celtic_drive/auth_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class subir_documento extends StatefulWidget{
  const subir_documento({super.key, required this.title});

  final String title;
  @override
  State<subir_documento> createState()=> _subir_documentoState();
}

class _subir_documentoState extends State<subir_documento> {
  late AuthService authService;
  String tipo = 'Todo';
  var fileTypeList = ['Todo', 'Imagen', 'Video', 'Audio'];
  FilePickerResult? resultado;
  late File archivo;
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
            ElevatedButton(onPressed:() {authService.subirArchivo(archivo as File);} , child: Text("Seleccionar Documento")),
            if (archivo!=null) detallesArchivo(archivo! as PlatformFile),
            if (archivo!=null) ElevatedButton(onPressed: (){verSeleccion(archivo! as PlatformFile);}, child: Text("Ver archivo"))
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

  void verSeleccion(PlatformFile archivo){
    OpenFile.open(archivo.path);
  }
}
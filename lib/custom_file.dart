
import 'dart:typed_data';
import 'dart:async';

import 'package:app_celtic_drive/File.dart';

class CustomFile {
  final File originalFile; // La clase File existente
  final Uint8List bytes;

  CustomFile(this.originalFile, this.bytes);

  // Agrega un método para obtener un Stream de bytes del archivo
  Stream<Uint8List> getStreamFromBytes() {
    final streamController = StreamController<Uint8List>();

    for (int i = 0; i < bytes.length; i++) {
      streamController.add(Uint8List.fromList([bytes[i]]));
    }

    streamController.close();

    return streamController.stream;
  }
}
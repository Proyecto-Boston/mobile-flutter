import 'dart:io';
//Hola
import 'package:app_celtic_drive/permisos.dart';
import 'package:app_celtic_drive/ruta_directorio.dart';
import 'package:app_celtic_drive/subir_documento.dart';
import 'package:app_celtic_drive/subir_documento.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as Path;

class iniciar extends StatelessWidget {
  const iniciar({super.key});

   static const appTitle = 'Inicio';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Inicio(title: appTitle,),
    );
  }
}

class Inicio extends StatefulWidget{
  const Inicio({super.key, required this.title});

  final String title;
  @override
  State<Inicio> createState()=> _inicioState();
}

class _inicioState extends State<Inicio>{
  bool isPermission = false;
  var checkAllPermissions = CPermisos();

  checkPermission() async {
    var permission = await checkAllPermissions.isStoragePermission();
    if (permission) {
      setState(() {
        isPermission = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  var dataList = [
    {
      "id": "2",
      "title": "Video 1",
      "url": "https://download.samplelib.com/mp4/sample-30s.mp4"
    },
    {
      "id": "3",
      "title": "Video 2",
      "url": "https://download.samplelib.com/mp4/sample-20s.mp4"
    },
    {
      "id": "4",
      "title": "Video 3",
      "url": "https://download.samplelib.com/mp4/sample-15s.mp4"
    },
    {
      "id": "5",
      "title": "Video 4",
      "url": "https://download.samplelib.com/mp4/sample-10s.mp4"
    },
    {
      "id": "6",
      "title": "PDF 6",
      "url":
          "https://www.iso.org/files/live/sites/isoorg/files/store/en/PUB100080.pdf"
    },
    {
      "id": "10",
      "title": "PDF 7",
      "url": "https://www.tutorialspoint.com/javascript/javascript_tutorial.pdf"
    },
    {
      "id": "10",
      "title": "PDF 8",
      "url": "https://www.tutorialspoint.com/cplusplus/cpp_tutorial.pdf"
    },
    {
      "id": "11",
      "title": "PDF 9",
      "url":
          "https://www.iso.org/files/live/sites/isoorg/files/store/en/PUB100431.pdf"
    },
    {
      "id": "12",
      "title": "PDF 10",
      "url": "https://www.tutorialspoint.com/java/java_tutorial.pdf"
    },
    {
      "id": "13",
      "title": "PDF 12",
      "url": "https://www.irs.gov/pub/irs-pdf/p463.pdf"
    },
    {
      "id": "14",
      "title": "PDF 11",
      "url": "https://www.tutorialspoint.com/css/css_tutorial.pdf"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor:Color.fromARGB(255, 0, 118, 253), ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      drawer: Drawer(
        width: 350,
        child: Container(
          color:Color.fromARGB(255, 0, 118, 253),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              //_buildDrawerHeader(context),
              Row(
                children: [
                  Expanded(child:
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    //margin: EdgeInsets.only(top: 70),
                    //color: Colors.blue,
                    child: Column(
                      children:[
                        const SizedBox(
                          height: 100,
                        ),
                        const ListTile(
                          title: Text("Usuario",
                          style: const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800)),
                          subtitle: Text("usuario@gmail.com", style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 255, 255, 255)),),
                          leading: const CircleAvatar(
                            child: Icon(
                              Icons.perm_identity,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 40,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.6),
                          indent: 32,
                          endIndent: 32,
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  Icons.upload_file_rounded,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Subir Documento",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const subir_documento(title: "Subir Documento",)));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                          child: Row(
                            children: const [
                              Icon(
                                color: Color.fromARGB(255, 255, 255, 255),
                                Icons.file_download_rounded,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Descargar Documento",
                                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  Icons.edit_document,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Editar Documento",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                ),
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Inicio(title: "Inicio",)));
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  Icons.folder_delete_rounded,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Eliminar Documento",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Inicio(title: "Inicio",)));
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  Icons.folder_shared_rounded,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Compartir Documento",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Inicio(title: "Inicio",)));
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  Icons.folder,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Crear Carpeta",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            //signOutUser();
                          },
                        ),
                        Divider(
                          height: 30,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.6),
                          indent: 32,
                          endIndent: 32,
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  Icons.storage_rounded,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Almacenamiento",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            //signOutUser();
                          },
                        ),
                        Divider(
                          height: 30,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.6),
                          indent: 32,
                          endIndent: 32,
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  Icons.logout_rounded,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Salir",
                                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color:Colors.white),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            //signOutUser();
                          },
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ]
          ),
        ),
      ),
      body: isPermission
            ? ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = dataList[index];
                  return Lista(
                    fileUrl: data['url']!,
                    title: data['title']!,
                  );
                })
            : TextButton(
                onPressed: () {
                  checkPermission();
                },
                child: const Text("Permission issue")));
          
  }
}

class Lista extends StatefulWidget {
  Lista({super.key, required this.fileUrl, required this.title});
  final String fileUrl;
  final String title;

  @override
  State<Lista> createState() => _TileListState();
}

class _TileListState extends State<Lista> {
  bool dowloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  late String filePath;
  late CancelToken cancelToken;
  var getPathFile = RutaDirectorio();

  startDownload() async {
    cancelToken = CancelToken();
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    setState(() {
      dowloading = true;
      progress = 0;
    });

    try {
      await Dio().download(widget.fileUrl, filePath,
          onReceiveProgress: (count, total) {
        setState(() {
          progress = (count / total);
        });
      }, cancelToken: cancelToken);
      setState(() {
        dowloading = false;
        fileExists = true;
      });
    } catch (e) {
      print(e);
      setState(() {
        dowloading = false;
      });
    }
  }

  cancelDownload() {
    cancelToken.cancel();
    setState(() {
      dowloading = false;
    });
  }

  checkFileExit() async {
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    bool fileExistCheck = await File(filePath).exists();
    setState(() {
      fileExists = fileExistCheck;
    });
  }

  openfile() {
    OpenFile.open(filePath);
    print("fff $filePath");
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fileName = Path.basename(widget.fileUrl);
    });
    checkFileExit();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.grey.shade100,
      child: ListTile(
          title: Text(widget.title),
          leading: IconButton(
              onPressed: () {
                fileExists && dowloading == false
                    ? openfile()
                    : cancelDownload();
              },
              icon: fileExists && dowloading == false
                  ? const Icon(
                      Icons.window,
                      color: Colors.green,
                    )
                  : const Icon(Icons.close)),
          trailing: FittedBox(
            fit: BoxFit.fill,
            child:Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.delete_forever),color: Colors.redAccent,onPressed: () {},),
                IconButton(
              onPressed: () {
                fileExists && dowloading == false
                    ? openfile()
                    : startDownload();
              },
              icon: fileExists
                  ? const Icon(
                      Icons.save,
                      color: Colors.green,
                    )
                  : dowloading
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 3,
                              backgroundColor: Colors.grey,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.blue),
                            ),
                            Text(
                              "${(progress * 100).toStringAsFixed(2)}",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        )
                      : const Icon(Icons.download))
            ],
              
            )
              
          )
      ),
    );
  }
}
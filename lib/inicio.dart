import 'package:app_celtic_drive/subir_documento.dart';
import 'package:app_celtic_drive/subir_documento.dart';
import 'package:flutter/material.dart';
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
      
    );
  }
}
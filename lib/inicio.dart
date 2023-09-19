import 'package:flutter/material.dart';

class Inicio extends StatefulWidget{
  @override
  State<Inicio> createState()=> _inicioState();
}

class _inicioState extends State<Inicio>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 118, 253),
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
                        ListTile(
                          title: Text("Usuario",
                          style: const TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w800)),
                          subtitle: Text("usuario@gmail.com", style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 0, 118, 253)),),
                          leading: const CircleAvatar(
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 64,
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
                                  color: Color.fromARGB(255, 0, 118, 253),
                                  Icons.home,
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Inicio()));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                          child: Row(
                            children: const [
                              Icon(
                                color: Color.fromARGB(255, 32, 151, 219),
                                Icons.person,
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
                                  color: Color.fromARGB(255, 32, 151, 219),
                                  Icons.code,
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Inicio()));
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 32, 151, 219),
                                  Icons.data_array,
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Inicio()));
                          },
                        ),
                        Divider(
                          height: 64,
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
                                  color: Color.fromARGB(255, 32, 151, 219),
                                  Icons.settings,
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Inicio()));
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:30, top:16, bottom:16),
                            child: Row(
                              children: const [
                                Icon(
                                  color: Color.fromARGB(255, 32, 151, 219),
                                  Icons.logout,
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
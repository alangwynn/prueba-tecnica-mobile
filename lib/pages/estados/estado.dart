

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/widgets/avatar.dart';

class EstadoScreen extends StatelessWidget {

  const EstadoScreen({
    Key? key,
    required this.user,
    required this.estado
  }) : super(key: key);

  final dynamic user;
  final String estado;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cliente"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 100),
                  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Avatar(urlImage: user["avatar"],)
                  )
                ),
                Text(
                  'Cliente $estado',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: estado == 'Activo' ? const Color.fromARGB(255, 33, 163, 0) : estado == 'Inactivo' ? const Color.fromARGB(255, 233, 229, 0) : const Color.fromARGB(255, 224, 7, 0)
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  user["first_name"] + " " + user["last_name"],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  user["email"],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6e706e),
                  )
                ),
              ],
            )
          )
        )
      )
    );
  }

}


import 'package:flutter/material.dart';
import 'package:prueba_tecnica/pages/estados/estado.dart';
import 'package:prueba_tecnica/utils/utils.dart';
import 'package:prueba_tecnica/widgets/avatar.dart';

class ListadoClientes extends StatelessWidget {

  const ListadoClientes({
    Key? key,
    required this.user,
  }) : super(key: key);

  final dynamic user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Avatar(urlImage: user["avatar"],),
      title: Text(
        user["first_name"] + " " + user["last_name"],
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold
        )
      ),
      subtitle: Text(
        user["email"],
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 12,
          decoration: TextDecoration.underline,
        )
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Color(0xff001C54),
        size: 14,
      ),
      onTap: () {

        int random = Utils.generarNumerosAleatorios();
        String estado = 'Activo';

        if (random < 20) {
          estado = 'Activo';
        } else if (random % 20 == 0) {
          estado = 'Inactivo';
        } else if (random > 20 && random % 20 != 0) {
          estado = 'Bloqueado';
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EstadoScreen(user: user, estado: estado,),
          ),
        );
      },
    );
  }

}
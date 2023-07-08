import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prueba_tecnica/services/clientes.dart';
import 'package:prueba_tecnica/widgets/listado-clientes.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  dynamic clientes = [];

  @override
  void initState() {
    super.initState();
    EasyLoading.show();
    Clientes.getClientes().then((dynamic response) {
      var decodedResponse = utf8.decode(response.bodyBytes);
      dynamic parsedJson = json.decode(decodedResponse);
      setState(() {
        clientes = parsedJson["data"];
      });
    });
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bienvenido"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Listado de clientes',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xff001C54)
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) => const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xffdde3e1),
                  ),
                  itemBuilder: (BuildContext context, int index) => ListadoClientes(user: clientes[index],),
                  itemCount: clientes.length
                ),
              ],
            ),
          )
        )
      )
    );
  }
}
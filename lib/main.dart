import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prueba_tecnica/pages/estados/estado.dart';
import 'package:prueba_tecnica/pages/home/home.dart';
import 'package:prueba_tecnica/pages/login/login.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Color.fromARGB(45, 0, 0, 0).withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    Map<int, Color> color = {
      50: const Color.fromRGBO(0, 28, 84, .1),
      100:const Color.fromRGBO(0, 28, 84, .2),
      200:const Color.fromRGBO(0, 28, 84, .3),
      300:const Color.fromRGBO(0, 28, 84, .4),
      400:const Color.fromRGBO(0, 28, 84, .5),
      500:const Color.fromRGBO(0, 28, 84, .6),
      600:const Color.fromRGBO(0, 28, 84, .7),
      700:const Color.fromRGBO(0, 28, 84, .8),
      800:const Color.fromRGBO(0, 28, 84, .9),
      900:const Color.fromRGBO(0, 28, 84, 1),
    };

    return MaterialApp(
      title: 'Prueba Técnica',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF001C54, color),
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      builder: EasyLoading.init(),
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/activo': (context) => const EstadoScreen(user: null, estado: '',),
      },
    );
  }
}



import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:prueba_tecnica/pages/home/home.dart';

class LoginScreen extends StatefulWidget {
  
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {

  final TextEditingController _usernameControl = TextEditingController();
  final TextEditingController _passwordControl = TextEditingController();

  bool _isObscure = true;
  bool _validate = false;

  ButtonState stateOnlyText = ButtonState.idle;

  void onPressedCustomButton(estado) {
    setState(() {
      switch (estado) {
        case ButtonState.idle:
          stateOnlyText = ButtonState.idle;
          break;
        case ButtonState.loading:
          stateOnlyText = ButtonState.loading;
          break;
        case ButtonState.success:
          stateOnlyText = ButtonState.success;
          break;
        case ButtonState.fail:
          stateOnlyText = ButtonState.fail;
          stateOnlyText = ButtonState.idle;
          break;
      }
    });
  }

  void iniciarSesion(String user, String pass) {
    
    onPressedCustomButton(ButtonState.loading);

    Timer(const Duration(seconds: 2), irHome);

  }

  void irHome() {
    onPressedCustomButton(ButtonState.idle);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const HomeScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                  padding: const EdgeInsets.only(top: 150),
                  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/user.png'),
                    ),
                  )
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      const Text(
                        '¡Bienvenido!',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xff001C54)
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          'Ingresa tus credenciales',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _usernameControl,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0.0),
                          labelText: 'Usuario',
                          hintText: 'Ingresa tu nombre de usuario',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          prefixIcon: const Icon(
                            Iconsax.user,
                            color: Colors.black,
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 2
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, width: 1.5
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: _isObscure,
                        controller: _passwordControl,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0.0),
                          labelText: 'Contraseña',
                          hintText: 'Ingresa tu contraseña',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Icon(
                            Iconsax.key,
                            color: Colors.black,
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 2
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          floatingLabelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black, width: 1.5
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure ? Iconsax.eye : Iconsax.eye_slash,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProgressButton(
                        maxWidth: 400.0,
                        radius: 10.0,
                        stateWidgets: const {
                          ButtonState.idle: Text(
                            "Iniciar sesión",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              fontSize: 15
                            ),
                          ),
                          ButtonState.loading: Text(
                            "Cargando...",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              fontSize: 15
                            ),
                          ),
                          ButtonState.fail: Text(
                            "Ocurrió un error",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              fontSize: 15
                            ),
                          ),
                          ButtonState.success: Text(
                            "¡Éxito!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              fontSize: 15
                            ),
                          )
                        },
                        onPressed: () {
                          setState(() {
                            _usernameControl.text.isEmpty || _passwordControl.text.isEmpty || _passwordControl.text.length < 5 ? _validate = false : _validate = true;
                          });
                          if (_validate) {
                            iniciarSesion(_usernameControl.text, _passwordControl.text);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Lo ingresado no cumple con las condiciones"),
                              backgroundColor: Color(0XffAC2925),
                            ));
                            return;
                          }
                        },
                        stateColors: {
                          ButtonState.idle: const Color(0xff001C54),
                          ButtonState.loading: const Color(0xff001C54),
                          ButtonState.fail: const Color(0xff001C54),
                          ButtonState.success: Colors.green.shade400,
                        },
                        state: stateOnlyText,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
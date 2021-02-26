import 'package:flutter/material.dart';
import 'package:platzi_bloc_practica/Widgets/button_green.dart';
import 'package:platzi_bloc_practica/Widgets/gradient_back.dart';

class InicioSesion extends StatefulWidget {
  InicioSesion({Key key}) : super(key: key);

  @override
  _InicioSesionState createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  @override
  Widget build(BuildContext context) {
    return singInGoogleUI();
  }

  // ========= Monitorear la sesion del usuario ======
  Widget singInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            // ====== Centrar elementos de manera vertical ======
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Bienvenido \n Esta es tu App de viajes",
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 37.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              ButtonGreen(
                text: "Inicio Sesion Gmail",
                onPressed: () {},
                ancho: 300.0,
                alto: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}

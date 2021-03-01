import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_bloc_practica/User/bloc/bloc_user.dart';
import 'package:platzi_bloc_practica/Widgets/button_green.dart';
import 'package:platzi_bloc_practica/Widgets/gradient_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_bloc_practica/platzi_trips.dart';
import 'package:platzi_bloc_practica/platzi_trips_cupertino.dart';

class InicioSesion extends StatefulWidget {
  InicioSesion({Key key}) : super(key: key);

  @override
  _InicioSesionState createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  // declaracion del objeto UserBloc
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // ************   Instanciar objeto userbloc ****************
    // of.(context) => contiene el ciclo  o estado de vida de la aplicacioon
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  // ********** Maneja el estado de la sesion (logica para abrir determinada pantalla) ****************
  Widget _handleCurrentSession() {
    // ****** StreamBuilder es un Widget *******
    return StreamBuilder(
      stream: userBloc.authStatus,
      // el (snapshot => contiene los datos traidos de la sesion, osea el objeto User desde Firebase)
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // *** Valida si el objeto snapshot viene vacio o tiene un error no deja entrar
        if (snapshot.hasData || snapshot.hasError) {
          return singInGoogleUI();
          // si trae la data correcta de la sesion permite ingresar a la vista de home
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
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
                onPressed: () {
                  userBloc
                      .signIn()
                      .then((User user) => print("El usuario es  ${user}"));
                },
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

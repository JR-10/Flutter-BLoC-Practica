import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_bloc_practica/User/bloc/bloc_user.dart';
import 'package:platzi_bloc_practica/User/ui/screens/inicio_sesion.dart';
import 'platzi_trips.dart';
import 'platzi_trips_cupertino.dart';

// void main() => runApp(MyApp());

/*
Future<void> main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}*/

// ***** Se coloca de esta forma para Inicializar el Firebase ****
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home: PlatziTripsCupertino(),
          home: InicioSesion(),
        ),
        bloc: UserBloc());
  }
}

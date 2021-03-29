import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_bloc_practica/User/bloc/bloc_user.dart';
import 'package:platzi_bloc_practica/User/model/usuario.dart';
import '../widgets/user_info.dart';
import '../widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {
  // declaracion de variable que me trae los valores de la sesion
  Usuario usuario;

  ProfileHeader(@required this.usuario);

  @override
  Widget build(BuildContext context) {
    // esta clase lo que hace es estar alerta cuando los datos sean depositados en una interfaz los lee y luego ejecuta algo
    final title = Text('Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0));

    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[title],
          ),
          UserInfo(usuario),
          ButtonsBar(usuario)
        ],
      ),
    );
  }

  // ****************  ******************************
  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("Usuario no legeado");
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la informacion, Haz login")
          ],
        ),
      );
    } else {
      print("Logueado");
      print("valor del Snapshot Data:  ${snapshot.data}");

      // datos de la sesion
      usuario = Usuario(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoUrl: snapshot.data.photoURL);
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[title],
            ),
            UserInfo(usuario),
            ButtonsBar(usuario)
          ],
        ),
      );
    }
  }
}

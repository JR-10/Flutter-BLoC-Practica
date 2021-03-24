import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_bloc_practica/User/bloc/bloc_user.dart';
import 'package:platzi_bloc_practica/User/model/usuario.dart';
import '../widgets/user_info.dart';
import '../widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {
  // declaracion de variable que me trae los valores de la sesion
  UserBloc userBloc;
  Usuario usuario;

  @override
  Widget build(BuildContext context) {
    // instaciar el objeto userBloc para tener acceso a los datos de autenticacion
    userBloc = BlocProvider.of<UserBloc>(context);
    print('Valor del UserBloc:  $userBloc');

    // esta clase lo que hace es estar alerta cuando los datos sena depositados en una interfaz los lee y luego ejecuta algo
    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // monitoear el oibjeto snapshot
        // validar el estado de la conexion
        print('Valor del objeto snapshot que trae:  $snapshot');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
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
      print(snapshot.data);

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
            ButtonsBar()
          ],
        ),
      );
    }
  }
}

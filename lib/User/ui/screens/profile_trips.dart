import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_bloc_practica/User/bloc/bloc_user.dart';
import 'package:platzi_bloc_practica/User/model/usuario.dart';
import 'package:platzi_bloc_practica/User/ui/screens/profile_header.dart';
import 'package:platzi_bloc_practica/User/ui/widgets/profile_background.dart';
import 'package:platzi_bloc_practica/User/ui/widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {
  // llamdo al userBlock
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // implementar UserBloc
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // Capturar el estado de la conecxion
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.done:
            return showProfileData(snapshot);
          case ConnectionState.active:
            return showProfileData(snapshot);
          default:
        }
      },
    );

    /*
    Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[ProfileHeader(), ProfilePlacesList()],
        ),
      ],
    );*/
  }

  // Metodo Widget
  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print('Usuario no lOgueado');
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[Text("Usuario no logueado, has login")],
          ),
        ],
      );
    } else {
      print("Usuario Logueado correctamente");
      var usuario = Usuario(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoUrl: snapshot.data.photoURL);

      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(usuario),
              ProfilePlacesList(usuario)
            ],
          ),
        ],
      );
    }
  }
}

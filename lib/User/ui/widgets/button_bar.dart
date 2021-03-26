import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_bloc_practica/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_bloc_practica/User/bloc/bloc_user.dart';
import 'package:platzi_bloc_practica/User/model/usuario.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  // Declaracion de variable para el acceso al BlocUser y por consiguiente al SignOut
  UserBloc userBlock;
  // ----- Variable para obtener el usuario de la sesion -----
  Usuario usuarioSesion;

  ButtonsBar(@required this.usuarioSesion);

  @override
  Widget build(BuildContext context) {
    // instanciar la variable
    final picker = ImagePicker();
    userBlock = BlocProvider.of(context);

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            // Cambiar Password
            CircleButton(true, Icons.vpn_key, 20.0,
                Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            // Adicionar u nuevo lugar
            CircleButton(
                false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), () {
              picker
                  .getImage(source: ImageSource.camera)
                  .then((PickedFile image) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddPlaceScreen(
                            usuarioSesion: usuarioSesion,
                            image: File(image.path))));
              }).catchError((onError) => print(onError));
            }),
            // Cerrar la sesion de App
            CircleButton(
                true,
                Icons.exit_to_app,
                20.0,
                Color.fromRGBO(255, 255, 255, 0.6),
                () => {
                      // llamar al evento de cerrar sesion
                      userBlock.signOut()
                    }),
          ],
        ));
  }
}

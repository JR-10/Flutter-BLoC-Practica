import 'dart:io';

import 'package:flutter/material.dart';
import '../../../Widgets/floating_action_button_green.dart';

class CardImage extends StatelessWidget {
  // -------- Declaracion de Variables (Requeridos deben estar con final) --------
  final double alto;
  final double ancho;
  double leftDerecho;
  // double leftDerecho = 20.0;

  final String pathImage;
  // -----Variable para insertar un metodo --------
  final VoidCallback onPressedFabIcon;
  final IconData iconoData;

  CardImage(
      {Key key,
      this.pathImage,
      this.iconoData,
      this.ancho,
      this.alto,
      this.onPressedFabIcon,
      this.leftDerecho});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: alto,
      width: ancho,
      margin: EdgeInsets.only(left: leftDerecho),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: pathImage.contains('assets')
                ? AssetImage(pathImage)
                : FileImage(new File(pathImage)),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      alignment: Alignment(0.9, -0.8),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
            iconoData: iconoData, onPresseded: onPressedFabIcon)
      ],
    );
  }
}

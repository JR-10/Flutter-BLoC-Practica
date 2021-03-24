import 'package:flutter/material.dart';
import '../../../Place/ui/widgets/card_image.dart';

class CardImagenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ancho = 300.0;
    double alto = 250.0;
    double leftDerecho = 20.0;

    return Container(
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage(
              pathImage: "assets/img/beach_palm.jpeg",
              iconoData: Icons.favorite_border,
              ancho: ancho,
              alto: alto,
              leftDerecho: leftDerecho),
          CardImage(
              pathImage: "assets/img/mountain.jpeg",
              iconoData: Icons.favorite_border,
              ancho: ancho,
              alto: alto,
              leftDerecho: leftDerecho),
          CardImage(
              pathImage: "assets/img/mountain_stars.jpeg",
              iconoData: Icons.favorite_border,
              ancho: ancho,
              alto: alto,
              leftDerecho: leftDerecho),
          CardImage(
              pathImage: "assets/img/river.jpeg",
              iconoData: Icons.favorite_border,
              ancho: ancho,
              alto: alto,
              leftDerecho: leftDerecho),
          CardImage(
              pathImage: "assets/img/sunset.jpeg",
              iconoData: Icons.favorite_border,
              ancho: ancho,
              alto: alto,
              leftDerecho: leftDerecho),
        ],
      ),
    );
  }
}

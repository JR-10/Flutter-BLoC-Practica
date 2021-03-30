import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_bloc_practica/User/bloc/bloc_user.dart';
import '../../../Place/ui/widgets/card_image.dart';

class CardImagenList extends StatelessWidget {
  // Definicion del UserBloc
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    /*
    double ancho = 300.0;
    double alto = 250.0;
    double leftDerecho = 20.0;
    */
    return Container(
      height: 350.0,
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.done:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.docs));
            case ConnectionState.active:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.docs));
            default:
          }
        },
      ),

      /*
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
        
      ),*/
    );
  }

  Widget listViewPlaces(List<CardImage> placesCard) {
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    );
  }
}

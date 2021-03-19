import 'package:flutter/material.dart';
import 'package:platzi_bloc_practica/Place/model/place.dart';

class Usuario {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;

  // Definir metodo constructor
  Usuario(
      {Key key,
      @required this.uid,
      @required this.name,
      @required this.email,
      @required this.photoUrl,
      this.myPlaces,
      this.myFavoritePlaces});
}

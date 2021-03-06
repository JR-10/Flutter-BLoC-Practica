import 'package:flutter/material.dart';
import 'package:platzi_bloc_practica/User/model/usuario.dart';

class Place {
  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  Usuario userOwner;

  // Constructor
  Place(
      {Key key,
      @required this.name,
      @required this.description,
      @required this.urlImage,
      this.likes,
      @required this.userOwner});
}
